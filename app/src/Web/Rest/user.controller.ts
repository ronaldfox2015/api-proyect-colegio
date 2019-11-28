import { inject, injectable } from 'inversify';
import { Request, Response } from 'express';
import { controller, httpPost, httpGet } from 'inversify-express-utils';
import { logger } from '../../Utils/logger';
import { UserApplicationService } from './../../User/Application/UserApplicationService';
import * as HTTP_CODES from 'http-status-codes';
import {AuthInput} from './../../User/Application/Input/AuthInput';

@injectable()
@controller('/v1')
export class UserController {
// tslint:disable-next-line: no-empty
    constructor(
        @inject('UserApplicationService') private userAppSvc: UserApplicationService
    ) { }
    @httpPost('/user')
    createAccount(request: any, response: Response) {

        return response.send(request.query);
    }

    @httpPost('/auth/login')
    login(request: Request, response: Response) {
        const apiResponse =  this.userAppSvc.login(new AuthInput(
            request.body.user,
            request.body.password,
            request.body.token
            )
        );

        return  response.send(apiResponse);
    }
}