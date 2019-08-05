import 'reflect-metadata';
import { AppConfig } from './../config/app-config';
import { interfaces, TYPE } from 'inversify-express-utils';
import { Container } from 'inversify';
// infraestructura
import { TypeORMUserRepository } from './User/Infrastructure/Repository/TypeORMUserRepository';
import { JwtEncrytRepository } from './User/Infrastructure/Jwt/JwtEncrytRepository';
import { Mysql } from './Common/Adapter/Persistence/TypeOrm/Mysql';

// domain
import { UserRepository } from './User/Domain/Repository/UserRepository';
import { EncrytRepository } from './User/Domain/Repository/EncrytRepository';
import { User } from './User/Domain/Entity/User';

// application
import { UserApplicationService } from './User/Application/UserApplicationService';

// controller
import { AuthController } from './web/rest/auth.controller';
import { UserController } from './web/rest/user.controller';

const container = new Container();
// infraestructura

const TypeOrmMYSQL = new Mysql(AppConfig.bd.mysql);

const JwtRepository = new JwtEncrytRepository(AppConfig);

container.bind<Mysql>('Mysql').toConstantValue(TypeOrmMYSQL);

container.bind<EncrytRepository>('EncrytRepository').toConstantValue(JwtRepository);

container.bind<UserRepository>('UserRepository').to(TypeORMUserRepository).inSingletonScope();

// application
container.bind<UserApplicationService>('UserApplicationService').to(UserApplicationService).inSingletonScope();

// controller
container.bind<interfaces.Controller>(TYPE.Controller).to(AuthController).inSingletonScope().whenTargetNamed('AuthController');
container.bind<interfaces.Controller>(TYPE.Controller).to(UserController).inSingletonScope().whenTargetNamed('UserController');

// Config
export {
  container
};
