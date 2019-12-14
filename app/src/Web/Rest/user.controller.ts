import { inject, injectable } from 'inversify';
// tslint:disable-next-line: ordered-imports
import { Request, Response, NextFunction, ErrorRequestHandler } from 'express';
// tslint:disable-next-line: ordered-imports
import { controller, httpPost, httpGet } from 'inversify-express-utils';
import { AuthApplicationService } from './../../User/Application/AuthApplicationService';
// tslint:disable-next-line: ordered-imports
import { AuthInput } from './../../User/Application/Input/AuthInput';
import { logger } from '../../Utils';
// tslint:disable-next-line: ordered-imports

@injectable()
@controller('/v1')
export class UserController {
  // tslint:disable-next-line: no-empty
  constructor(
    @inject('UserApplicationService') private userAppSvc: AuthApplicationService
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
      response.status(error.status).json(error);
    }
  }
}
