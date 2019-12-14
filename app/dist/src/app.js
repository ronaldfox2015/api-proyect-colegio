"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var Express = require("express");
var inversify_express_utils_1 = require("inversify-express-utils");
// tslint:disable-next-line: ordered-imports
var morgan = require("morgan");
// IoC
var ioc_container_1 = require("./ioc-container");
var Utils_1 = require("./Utils");
var app_config_1 = require("../config/app-config");
// start the server
var server = new inversify_express_utils_1.InversifyExpressServer(ioc_container_1.container);
server.setConfig(function (App) {
    var cookieParser = require('cookie-parser');
    var bodyParser = require('body-parser');
    var compress = require('compression');
    var methodOverride = require('method-override');
    App.use(cookieParser())
        .use(compress({}))
        .use(methodOverride())
        .use(bodyParser.urlencoded({
        extended: false
    }))
        .use(bodyParser.json())
        .use(morgan('combined', { stream: Utils_1.logger.stream }))
        .use('/apidoc', Express.static('apidoc'));
    // tslint:disable-next-line:only-arrow-functions
});
var app = server.build();
exports.app = app;
// Starts the app
if (process.env.NODE_ENV !== 'unit-test') {
    Utils_1.logger.info('Starting apps...');
    app.listen(app_config_1.AppConfig.port);
}
function logErrors(err, req, res, next) {
    next(err);
}
function clientErrorHandler(err, req, res, next) {
    if (req.xhr) {
        res.status(500).send({ error: 'Something failed!' });
    }
    else {
        next(err);
    }
}
function errorHandler(err, req, res, next) {
    res.status(500);
    res.render('error', { error: err });
}
//# sourceMappingURL=app.js.map