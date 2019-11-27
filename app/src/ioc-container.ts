import 'reflect-metadata';
// @ts-ignore
import { interfaces, TYPE } from 'inversify-express-utils';
import { AppConfig } from './../config/app-config';
import { Container } from 'inversify';
// infraestructura
import { TypeORMUserRepository } from './User/Infrastructure/Repository/TypeORMUserRepository';
import { Mysql } from './Common/Adapter/Persistence/TypeOrm/Mysql';
// import { Mail } from './Notification/Infrastructure/Mail/Mail';

// domain
import { UserRepository } from './User/Domain/Repository/UserRepository';
import { EncrytRepository } from './User/Domain/Repository/EncrytRepository';

// application
import { UserApplicationService } from './User/Application/UserApplicationService';

// controller
import { UserController } from './Web/Rest/user.controller';

// @ts-ignore
const container = new Container();
console.log(AppConfig.bd.mysql)
const TypeOrmMYSQL = new Mysql(AppConfig.bd.mysql);
// const JwtRepository = new JwtEncrytRepository(AppConfig.jwt);
// const MailRepo = new Mail(AppConfig.mail);
// infraestructura
container.bind<Mysql>('Mysql').toConstantValue(TypeOrmMYSQL);
// container.bind<EncrytRepository>('EncrytRepository').toConstantValue(JwtRepository);
container.bind<UserRepository>('UserRepository').to(TypeORMUserRepository).inSingletonScope();

// application
container.bind<UserApplicationService>('UserApplicationService').to(UserApplicationService).inSingletonScope();

// controller
container.bind<interfaces.Controller>(TYPE.Controller).to(UserController).inSingletonScope().whenTargetNamed('UserController');

// Config
export {
  container
};
