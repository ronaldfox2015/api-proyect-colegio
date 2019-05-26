import { inject, injectable } from 'inversify';
import { Request, Response } from 'express';
import { controller, httpPost, httpGet } from 'inversify-express-utils';
import * as HTTP_CODES from 'http-status-codes';
import { logger } from '../../utils/logger';
import { UserApplicationService } from './../../education-system/application/user/user-application-service';

@injectable()
@controller('/v1')
export class AuthController {

    constructor(
        @inject('UserApplicationService') private userAppSvc: UserApplicationService
    ) { }

    @httpPost('/user/login')
    registerMovie(request: any, response: Response) {
        request.body.response = this.userAppSvc.login(request.body.user,request.body.pasword);
        return response.send(request.body.response);
    }
}
