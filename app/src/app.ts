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
import { HttpException } from './Common/Exception/HttpException';
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

function clientErrorHandler(err, req, res, next) {
  if (req.xhr) {
    res.status(500).send({ error: 'Something failed!' });
  } else {
    next(err);
  }
}

function errorHandler(err, req, res, next) {
  res.status(500);
  res.render('error', { error: err });
}
