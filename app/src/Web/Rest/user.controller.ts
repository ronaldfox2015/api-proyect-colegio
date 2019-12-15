// tslint:disable-next-line: ordered-imports
import { ErrorRequestHandler, NextFunction, Request, Response } from 'express';
import { inject, injectable } from 'inversify';
// tslint:disable-next-line: ordered-imports
import { controller, httpGet, httpPost } from 'inversify-express-utils';
import { logger } from '../../Utils';
import { AuthApplicationService } from './../../User/Application/AuthApplicationService';
// tslint:disable-next-line: ordered-imports
import { AuthInput } from './../../User/Application/Input/AuthInput';
// tslint:disable-next-line: ordered-imports

@injectable()
@controller('/v1')
export class UserController {
  // tslint:disable-next-line: no-empty
  constructor(
    @inject('AuthApplicationService') private userAppSvc: AuthApplicationService
  ) {}

  @httpPost('/user')
  createAccount(request: any, response: Response) {
    return response.send(request.query);
  }
  @httpPost('/auth/login')
  async login(request: Request, response: Response, next: NextFunction) {
    try {
      const apiResponse = await this.userAppSvc.login(
        new AuthInput(
          request.body.user,
          request.body.password,
          request.body.rol
        )
      );
      response.send(apiResponse);
    } catch (error) {
      response.status(error.code).json(error);
    }
  }
}
