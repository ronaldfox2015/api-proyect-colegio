"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var Express = require("express");
var morgan = require("morgan");
var session = require("express-session");
var inversify_express_utils_1 = require("inversify-express-utils");
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
    App
        .use(cookieParser())
        .use(compress({}))
        .use(methodOverride())
        .use(bodyParser.json())
        .use(bodyParser.urlencoded({
        extended: true
    }))
        .use(session({
        secret: 'AUTH_SECRET',
        name: 'pp-cookie',
        resave: true,
        saveUninitialized: false
    }))
        .use(morgan('combined', { stream: Utils_1.logger.stream }))
        .use('/apidoc', Express.static('apidoc'));
});
var app = server.build();
exports.app = app;
// Starts the app
if (process.env.NODE_ENV !== 'unit-test') {
    Utils_1.logger.info('Starting apps...');
    app.listen(app_config_1.AppConfig.port);
}
//# sourceMappingURL=app.js.map