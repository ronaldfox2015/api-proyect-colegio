import { inject, injectable } from 'inversify';
import { Request, Response } from 'express';
import { controller, httpPost, httpGet } from 'inversify-express-utils';
import * as HTTP_CODES from 'http-status-codes';
import { logger } from '../../Utils/logger';
import { UserApplicationService } from './../../User/Application/UserApplicationService';

@injectable()
@controller('/v1')
export class AuthController {

    constructor(
        @inject('UserApplicationService') private userAppSvc: UserApplicationService
    ) { }

    @httpPost('/user/login')
    login(request: any, response: Response) {
        request.body.response = this.userAppSvc.login(request.body.user,request.body.pasword);
        return response.send(request.body.response);
    }

    @httpPost('/user')
    register(request: any, response: Response) {
        request.body.response = this.userAppSvc.login(request.body.user,request.body.pasword);
        return response.send(request.body.response);
    }
}
