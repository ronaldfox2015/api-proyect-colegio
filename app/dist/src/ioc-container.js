"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
require("reflect-metadata");
// @ts-ignore
var inversify_express_utils_1 = require("inversify-express-utils");
var app_config_1 = require("./../config/app-config");
var inversify_1 = require("inversify");
// infraestructura
var TypeORMUserRepository_1 = require("./User/Infrastructure/Repository/TypeORMUserRepository");
var Mysql_1 = require("./Common/Adapter/Persistence/TypeOrm/Mysql");
// application
var UserApplicationService_1 = require("./User/Application/UserApplicationService");
// controller
var user_controller_1 = require("./Web/Rest/user.controller");
var Utils_1 = require("./Utils");
Utils_1.logger.info(app_config_1.AppConfig.bd.mysql);
// @ts-ignore
var container = new inversify_1.Container();
exports.container = container;
var TypeOrmMYSQL = new Mysql_1.Mysql(app_config_1.AppConfig.bd.mysql);
// const JwtRepository = new JwtEncrytRepository(AppConfig.jwt);
// const MailRepo = new Mail(AppConfig.mail);
// infraestructura
container.bind('Mysql').toConstantValue(TypeOrmMYSQL);
// container.bind<EncrytRepository>('EncrytRepository').toConstantValue(JwtRepository);
container.bind('UserRepository').to(TypeORMUserRepository_1.TypeORMUserRepository).inSingletonScope();
// application
container.bind('UserApplicationService').to(UserApplicationService_1.UserApplicationService).inSingletonScope();
// controller
container.bind(inversify_express_utils_1.TYPE.Controller).to(user_controller_1.UserController).inSingletonScope().whenTargetNamed('UserController');
//# sourceMappingURL=ioc-container.js.map