import {NextFunction, Request, Response} from 'express';
import {HttpException} from '../Exception/HttpException';
import {logger} from '../../Utils/logger';

export function errorMiddleware(error: HttpException, request: Request, response: Response, next: NextFunction) {
    const status = error.status || 500;
    const message = error.message || 'Something went wrong';
    logger.info(status)
    response
        .status(status)
        .send({
            status,
            message
        });
}
