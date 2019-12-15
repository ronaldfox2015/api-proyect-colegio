import { User } from '../Entity/User';
import { UserRoles } from '../Entity/UserRoles';

export interface IUserRepository {
  getByNickAndPassword(
    nick: string,
    password: string,
    rol: string
  ): Promise<User>;
  role(rol: string): Promise<UserRoles>;
}
