import 'reflect-metadata';
// @ts-ignore
import { interfaces, TYPE } from 'inversify-express-utils';
import { AppConfig } from './../config/app-config';
import { Container } from 'inversify';
// infraestructura
import { TypeORMUserRepository } from './User/Infrastructure/Repository/TypeORMUserRepository';
import { JwtEncrytRepository } from './User/Infrastructure/Jwt/JwtEncrytRepository';
import { Mysql } from './Common/Adapter/Persistence/TypeOrm/Mysql';
// import { Mail } from './Notification/Infrastructure/Mail/Mail';

// domain
import { UserRepository } from './User/Domain/Repository/UserRepository';
import { EncrytRepository } from './User/Domain/Repository/EncrytRepository';
import { RepositoryMail } from './Notification/Domain/RepositoryMail';

// application
import { UserApplicationService } from './User/Application/UserApplicationService';
import { MailService } from './Notification/Application/MailService';

// controller
import { UserController } from './web/rest/user.controller';

// @ts-ignore
const container = new Container();
const TypeOrmMYSQL = new Mysql(AppConfig.bd.mysql);
const JwtRepository = new JwtEncrytRepository(AppConfig.jwt);
// const MailRepo = new Mail(AppConfig.mail);
// infraestructura
// container.bind<RepositoryMail>('RepositoryMail').toConstantValue(MailRepo);
container.bind<Mysql>('Mysql').toConstantValue(TypeOrmMYSQL);
container.bind<EncrytRepository>('EncrytRepository').toConstantValue(JwtRepository);
container.bind<UserRepository>('UserRepository').to(TypeORMUserRepository).inSingletonScope();

// application
container.bind<UserApplicationService>('UserApplicationService').to(UserApplicationService).inSingletonScope();
// container.bind<MailService>('MailService').to(MailService).inSingletonScope();

// controller
container.bind<interfaces.Controller>(TYPE.Controller).to(UserController).inSingletonScope().whenTargetNamed('UserController');
// container.bind<interfaces.Controller>(TYPE.Controller).to(EmailController).inSingletonScope().whenTargetNamed('EmailController');

// Config
export {
  container
};
