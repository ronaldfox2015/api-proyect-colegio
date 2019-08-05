import { inject, injectable } from 'inversify';
import { Request, Response } from 'express';
import { controller, httpPost, httpGet } from 'inversify-express-utils';
import * as HTTP_CODES from 'http-status-codes';
import { logger } from '../../Utils/logger';

@injectable()
@controller('/api')
export class EmailController {
// tslint:disable-next-line: no-empty
    constructor() { }
    @httpGet('/contact/send')
    sendContact(request: any, response: Response) {
        logger.info(request.query);
        return response.send(request.body);
    }
}