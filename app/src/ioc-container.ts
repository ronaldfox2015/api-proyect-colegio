// @ts-ignore
import { Container } from 'inversify';
import { interfaces, TYPE } from 'inversify-express-utils';
import 'reflect-metadata';
import { AppConfig } from './../config/app-config';
import { Mysql } from './Common/Adapter/Persistence/TypeOrm/Mysql';
// application
import { UserApplicationService } from './User/Application/UserApplicationService';
import { User } from './User/Domain/Entity/User';
import { UserRoles } from './User/Domain/Entity/UserRoles';
// domain
import { UserRepository } from './User/Domain/Repository/UserRepository';
// infraestructura
import { TypeORMUserRepository } from './User/Infrastructure/Repository/TypeORMUserRepository';
// controller
import { UserController } from './Web/Rest/user.controller';

const container = new Container();
const mysqlConfig = AppConfig.bd.mysql;
const jwtConfig = AppConfig.jwtConfig;
mysqlConfig.entities = [User, UserRoles];
const TypeOrmMYSQL = new Mysql(AppConfig.bd.mysql);
// infraestructura
container.bind<Mysql>('Mysql').toConstantValue(TypeOrmMYSQL);
const UserRepositoryConst = new TypeORMUserRepository(TypeOrmMYSQL, jwtConfig);
container
  .bind<UserRepository>('UserRepository')
  .toConstantValue(UserRepositoryConst);

// application
container
  .bind<UserApplicationService>('UserApplicationService')
  .to(UserApplicationService)
  .inSingletonScope();

// controller
container
  .bind<interfaces.Controller>(TYPE.Controller)
  .to(UserController)
  .inSingletonScope()
  .whenTargetNamed('UserController');

// Config
export { container };
