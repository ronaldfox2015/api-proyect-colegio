"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// @ts-ignore
var inversify_1 = require("inversify");
var inversify_express_utils_1 = require("inversify-express-utils");
require("reflect-metadata");
var app_config_1 = require("./../config/app-config");
var Mysql_1 = require("./Common/Adapter/Persistence/TypeOrm/Mysql");
// application
var UserApplicationService_1 = require("./User/Application/UserApplicationService");
var User_1 = require("./User/Domain/Entity/User");
var UserRoles_1 = require("./User/Domain/Entity/UserRoles");
// infraestructura
var TypeORMUserRepository_1 = require("./User/Infrastructure/Repository/TypeORMUserRepository");
// controller
var user_controller_1 = require("./Web/Rest/user.controller");
var container = new inversify_1.Container();
exports.container = container;
var mysqlConfig = app_config_1.AppConfig.bd.mysql;
var jwtConfig = app_config_1.AppConfig.jwtConfig;
mysqlConfig.entities = [User_1.User, UserRoles_1.UserRoles];
var TypeOrmMYSQL = new Mysql_1.Mysql(app_config_1.AppConfig.bd.mysql);
// infraestructura
container.bind('Mysql').toConstantValue(TypeOrmMYSQL);
var UserRepositoryConst = new TypeORMUserRepository_1.TypeORMUserRepository(TypeOrmMYSQL, jwtConfig);
container
    .bind('UserRepository')
    .toConstantValue(UserRepositoryConst);
// application
container
    .bind('UserApplicationService')
    .to(UserApplicationService_1.UserApplicationService)
    .inSingletonScope();
// controller
container
    .bind(inversify_express_utils_1.TYPE.Controller)
    .to(user_controller_1.UserController)
    .inSingletonScope()
    .whenTargetNamed('UserController');
//# sourceMappingURL=ioc-container.js.map