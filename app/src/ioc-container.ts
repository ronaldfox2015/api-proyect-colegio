// @ts-ignore
import { Container } from 'inversify';
import { interfaces, TYPE } from 'inversify-express-utils';
import 'reflect-metadata';
import { AppConfig } from './../config/app-config';
import { Mysql } from './Common/Adapter/Persistence/TypeOrm/Mysql';
import { AuthApplicationService } from './User/Application/AuthApplicationService';
// application
import { UserApplicationService } from './User/Application/UserApplicationService';
import { User } from './User/Domain/Entity/User';
import { UserRoles } from './User/Domain/Entity/UserRoles';
// domain
import { IUserRepository } from './User/Domain/Repository/IUserRepository';
// infraestructura
import { UserRepository } from './User/Infrastructure/Repository/TypeOrm/UserRepositoy';
// controller
import { UserController } from './Web/Rest/user.controller';

const container = new Container();
const mysqlConfig = AppConfig.bd.mysql;
const jwtConfig = AppConfig.jwtConfig;
mysqlConfig.entities = [User, UserRoles];
const TypeOrmMYSQL = new Mysql(AppConfig.bd.mysql);
// infraestructura
container.bind<Mysql>('Mysql').toConstantValue(TypeOrmMYSQL);
const UserRepositoryConst = new UserRepository(TypeOrmMYSQL, jwtConfig);
container
  .bind<IUserRepository>('UserRepository')
  .toConstantValue(UserRepositoryConst);


container
  .bind<AuthApplicationService>('AuthApplicationService')
  .to(AuthApplicationService)
  .inSingletonScope();

// controller
container
  .bind<interfaces.Controller>(TYPE.Controller)
  .to(UserController)
  .inSingletonScope()
  .whenTargetNamed('UserController');

// Config
export { container };
