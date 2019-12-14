import {Request, Response, NextFunction, ErrorRequestHandler} from 'express';

export function ResponseHandler(apiResponse: any, request: Request, response: Response, next: NextFunction) {
    try {
        return response.send(apiResponse);
    } catch (error) {
        return response.status(error.status).json({error: error.message, status: error.status});
    }
}
