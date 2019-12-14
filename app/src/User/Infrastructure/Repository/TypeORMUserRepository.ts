// @ts-ignore
import { inject, injectable } from 'inversify';
import { User } from '../../Domain/Entity/User';
import { UserRoles } from '../../Domain/Entity/UserRoles';

import { HttpException } from '../../../Common/Exception/HttpException';
import { logger } from '../../../Utils';
import { UserRepository } from '../../Domain/Repository/UserRepository';
import { Mysql } from './../../../Common/Adapter/Persistence/TypeOrm/Mysql';

@injectable()
// @ts-ignore
export class TypeORMUserRepository implements UserRepository {
  connection: any;

  constructor(@inject('Mysql') private _repositoryDb: Mysql) {
    this.connection = this._repositoryDb.getConnection();
  }

  // @ts-ignore
  async getByNickAndPassword(
    nick: string,
    password: string,
    rol: string
  ): Promise<User> {
    return this.connection
      .then(async response => {
        const responseUser = await response
          .getRepository(User)
          .createQueryBuilder('u')
          .innerJoin(UserRoles, 'rol', 'rol.id = u.idRol')
          .where(`u.nomUsuario=:nick`, { nick })
          .andWhere(`u.password=:password`, { password })
          .andWhere(`rol.slug=:rol`, { rol })
          .getOne();
        return responseUser;
      })
      .catch(error => {
        console.log(error);
        throw new HttpException(500, 'dddd');
      });
  }

  // @ts-ignore
  async role(rol: string): Promise<UserRoles> {
    return this.connection
      .then(async response => {
        const responseUserRoles = await response
          .getRepository(UserRoles)
          .createQueryBuilder('ur')
          .where(`ur.slug=:rol`, { rol })
          .getOne();
        return responseUserRoles;
      })
      .catch(error => {
        throw new HttpException(500, error);
      });
  }
}
