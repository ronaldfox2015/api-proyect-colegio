import {HttpException} from './HttpException';
import * as express from 'express';

export class PostNotFoundException {
    constructor(code: number, message: string) {
        const app = express();
        app.response
            .status(code)
            .send({
                code,
                message
            });
    }
}
