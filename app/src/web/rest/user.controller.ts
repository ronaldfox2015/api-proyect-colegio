import { inject, injectable } from 'inversify';
import { Request, Response } from 'express';
import { controller, httpPost, httpGet } from 'inversify-express-utils';
import { logger } from '../../Utils/logger';
import { UserApplicationService } from './../../User/Application/UserApplicationService';
import { UserInput } from './../../User/Application/Input/UserInput';

@injectable()
@controller('/api')
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

    @httpGet('/user')
    get(request: Request, response: Response) {
        logger.info(request.headers);
        return response.send(request.headers);
    }
}