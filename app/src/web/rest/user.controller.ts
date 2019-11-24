import { inject, injectable } from 'inversify';
import { Request, Response } from 'express';
import { controller, httpPost, httpGet } from 'inversify-express-utils';
import { logger } from '../../Utils/logger';
import { UserApplicationService } from './../../User/Application/UserApplicationService';
import { UserInput } from './../../User/Application/Input/UserInput';
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
        this.userAppSvc.createAccount(new UserInput(
            request.body.email,
            request.body.password,
            request.body.rol,
            request.body.locationId,
            request.body.name,
            request.body.surname,
            request.body.secondSurname,
            request.body.gender
        ));
        return response.send(request.query);
    }

    @httpPost('/auth/login')
    get(request: Request, response: Response) {
        logger.info(request.headers);
        this.userAppSvc.login(new AuthInput(
            request.body.user,
            request.body.password,
            request.body.token
            )
        );
        return response.send(request.headers);
    }
}