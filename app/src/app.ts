import * as Express from 'express';
import { InversifyExpressServer } from 'inversify-express-utils';
// tslint:disable-next-line: ordered-imports
import * as morgan from 'morgan';
import Path = require('path');
import { errorMiddleware } from './Common/Middleware/error.middleware';

// IoC
import { container } from './ioc-container';
import { logger } from './Utils';

import { AppConfig } from '../config/app-config';
import { Request, Response, NextFunction } from 'express';
// start the server
const server = new InversifyExpressServer(container);
server.setConfig((App: any) => {
  const cookieParser = require('cookie-parser');
  const bodyParser = require('body-parser');
  const compress = require('compression');
  const methodOverride = require('method-override');

  App.use(cookieParser())
    .use(compress({}))
    .use(methodOverride())
    .use(
      bodyParser.urlencoded({
        extended: false
      })
    )
    .use(bodyParser.json())

    .use(morgan('combined', { stream: logger.stream }))
    .use('/apidoc', Express.static('apidoc'));
  // tslint:disable-next-line:only-arrow-functions
});
const app = server.build();

// Starts the app
if (process.env.NODE_ENV !== 'unit-test') {
  logger.info('Starting apps...');
  app.listen(AppConfig.port);
}
export { app };
function logErrors(err, req, res, next) {
  next(err);
}

function errorHandler(
  err,
  request: Request,
  response: Response,
  next: NextFunction
) {
  logger.info(err);
  if (request) {
    return next(err);
  }
  response.status(500);
  response.render('error', { error: err });
}
