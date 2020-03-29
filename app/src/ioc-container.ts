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
import { CourseSection } from './Teacher/Domain/Entity/course-section';
import { Section } from './Teacher/Domain/Entity/seccion';

import { TeacherApplicationService } from './Teacher/Application/teacher-application-service';

// domain
import { IUserRepository } from './User/Domain/Repository/IUserRepository';
import { ITeacherRepository } from './Teacher/Domain/Repository/ITeacherRepository';

// infraestructura
import { UserRepository } from './User/Infrastructure/Repository/TypeOrm/UserRepositoy';

import { TeacherRepository } from './Teacher/Infraestruccture/Repository/teacher-repository';
// controller
import { UserController } from './Web/Rest/user.controller';
import { TeacherController } from './Web/Rest/teacher.controller';
import { Course } from './Teacher/Domain/Entity/course';
import { CourseHydrator } from './Teacher/Application/Hydrators/course.hydrator';
import { SectionHydrator } from './Teacher/Application/Hydrators/section.hydrator';

const container = new Container();
const mysqlConfig = AppConfig.bd.mysql;
const jwtConfig = AppConfig.jwtConfig;
mysqlConfig.entities = [User, UserRoles, CourseSection, Section, Course];
const TypeOrmMYSQL = new Mysql(AppConfig.bd.mysql);
// infraestructura
container.bind<Mysql>('Mysql').toConstantValue(TypeOrmMYSQL);
const UserRepositoryConst = new UserRepository(TypeOrmMYSQL, jwtConfig);

const TeacherRepositoryConst = new TeacherRepository(TypeOrmMYSQL);
// repository
container
  .bind<IUserRepository>('UserRepository')
  .toConstantValue(UserRepositoryConst);

container
  .bind<ITeacherRepository>('TeacherRepository')
  .toConstantValue(TeacherRepositoryConst);

// service
container
  .bind<AuthApplicationService>('AuthApplicationService')
  .to(AuthApplicationService)
  .inSingletonScope();

container
  .bind<CourseHydrator>('CourseHydrator')
  .to(CourseHydrator)
  .inSingletonScope();

container
  .bind<SectionHydrator>('SectionHydrator')
  .to(SectionHydrator)
  .inSingletonScope();
container
  .bind<TeacherApplicationService>('TeacherApplicationService')
  .to(TeacherApplicationService)
  .inSingletonScope();
// controller
container
  .bind<interfaces.Controller>(TYPE.Controller)
  .to(UserController)
  .inSingletonScope()
  .whenTargetNamed('UserController');

container
  .bind<interfaces.Controller>(TYPE.Controller)
  .to(TeacherController)
  .inSingletonScope()
  .whenTargetNamed('TeacherController');

// Config
export { container };
