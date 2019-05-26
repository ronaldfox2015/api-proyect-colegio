import 'reflect-metadata';
import { AppConfig } from './../config/app-config';
import { interfaces, TYPE } from 'inversify-express-utils';
import { Container } from 'inversify';
// infraestructura
import { TypeORMUserRepository } from './education-system/infrastructure/typeorm/mysql/user-repository';

import { RepositoryDb } from './education-system/infrastructure/typeorm/mysql/repository-db';

// domain
import { UserRepository } from './education-system/domain/repository/user-repository';

import { Customer } from './../src/education-system/domain/customer';
import { User } from './../src/education-system/domain/entity/user';

// application
import { UserApplicationService } from './education-system/application/user/user-application-service';

// controller
import { EmailController } from './web/rest/email.contoller';
import { AuthController } from './web/rest/auth.controller';

const container = new Container();
// infraestructura
const TypeOrmMYSQL = new RepositoryDb(
  AppConfig.bd.mysql.dialect,
  AppConfig.bd.mysql.host,
  AppConfig.bd.mysql.port,
  AppConfig.bd.mysql.username,
  AppConfig.bd.mysql.password,
  AppConfig.bd.mysql.database,
  [Customer,User]
);

container.bind<RepositoryDb>('RepositoryDb').toConstantValue(TypeOrmMYSQL);
container.bind<UserRepository>('UserRepository').to(TypeORMUserRepository).inSingletonScope();

// application
container.bind<UserApplicationService>('UserApplicationService').to(UserApplicationService).inSingletonScope();

// controller
container.bind<interfaces.Controller>(TYPE.Controller).to(EmailController).inSingletonScope().whenTargetNamed('EmailController');
container.bind<interfaces.Controller>(TYPE.Controller).to(AuthController).inSingletonScope().whenTargetNamed('AuthController');

// Config

export {
  container
};
