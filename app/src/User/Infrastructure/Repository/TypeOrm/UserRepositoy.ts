import { inject, injectable } from 'inversify';
import { Connection } from 'typeorm';
import { encryption } from '../../../../Utils/encryption';
import { User } from '../../../Domain/Entity/User';
import { UserRoles } from '../../../Domain/Entity/UserRoles';
import { IUserRepository } from '../../../Domain/Repository/IUserRepository';
import { MysqlException } from '../../../Infrastructure/Exception/MysqlException';
import { Mysql } from './../../../../Common/Adapter/Persistence/TypeOrm/Mysql';

@injectable()
export class UserRepository implements IUserRepository {
  connection: any;
  jwtConfig: any;
  constructor(@inject('Mysql') private mysql: Mysql, jwtConfig) {
    this.connection = this.mysql.getConnection();
    this.jwtConfig = jwtConfig;
  }

  /**
   *
   * @param nick string
   * @param password string
   * @param rol string
   */
  async getByNickAndPassword(
    nick: string,
    password: string,
    rol: string
  ): Promise<User> {
    return this.connection
      .then(async (response: Connection) => {
        const encryptPassword = encryption(password, this.jwtConfig.key);
        console.log(encryptPassword);
        const responseUser = await response
          .getRepository(User)
          .createQueryBuilder('u')
          .select(['roles', 'u'])
          .innerJoin('u.roles', 'roles', 'u.roles.id = roles.idRol')
          .where(`u.nomUsuario=:nick`, { nick })
          .andWhere(`u.password=:encryptPassword`, { encryptPassword })
          .andWhere(`roles.slug=:rol`, { rol });
        return responseUser.getOne();
      })
      .catch(error => {
        throw new MysqlException(error.sqlMessage);
      });
  }

  /**
   *
   * @param rol string
   */
  async role(rol: string): Promise<UserRoles> {
    return this.connection
      .then(async (response: Connection) => {
        const responseUserRoles = await response
          .getRepository(UserRoles)
          .createQueryBuilder('ur')
          .where(`ur.slug=:rol`, { rol })
          .getOne();
        return responseUserRoles;
      })
      .catch(error => {
        throw new MysqlException(error.sqlMessage);
      });
  }
}
