"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
require("reflect-metadata");
var app_config_1 = require("./../config/app-config");
var inversify_express_utils_1 = require("inversify-express-utils");
var inversify_1 = require("inversify");
// infraestructura
var user_repository_1 = require("./education-system/infrastructure/typeorm/mysql/user-repository");
var repository_db_1 = require("./education-system/infrastructure/typeorm/mysql/repository-db");
var customer_1 = require("./../src/education-system/domain/customer");
var user_1 = require("./../src/education-system/domain/entity/user");
// application
var user_application_service_1 = require("./education-system/application/user/user-application-service");
// controller
var email_contoller_1 = require("./web/rest/email.contoller");
var auth_controller_1 = require("./web/rest/auth.controller");
var container = new inversify_1.Container();
exports.container = container;
// infraestructura
var TypeOrmMYSQL = new repository_db_1.RepositoryDb(app_config_1.AppConfig.bd.mysql.dialect, app_config_1.AppConfig.bd.mysql.host, app_config_1.AppConfig.bd.mysql.port, app_config_1.AppConfig.bd.mysql.username, app_config_1.AppConfig.bd.mysql.password, app_config_1.AppConfig.bd.mysql.database, [customer_1.Customer, user_1.User]);
container.bind('RepositoryDb').toConstantValue(TypeOrmMYSQL);
container.bind('UserRepository').to(user_repository_1.TypeORMUserRepository).inSingletonScope();
// application
container.bind('UserApplicationService').to(user_application_service_1.UserApplicationService).inSingletonScope();
// controller
container.bind(inversify_express_utils_1.TYPE.Controller).to(email_contoller_1.EmailController).inSingletonScope().whenTargetNamed('EmailController');
container.bind(inversify_express_utils_1.TYPE.Controller).to(auth_controller_1.AuthController).inSingletonScope().whenTargetNamed('AuthController');
//# sourceMappingURL=ioc-container.js.map