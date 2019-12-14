// tslint:disable-next-line: ordered-imports
import { injectable, inject } from 'inversify';
import { UserRepository } from './../Domain/Repository/UserRepository';
// tslint:disable-next-line: ordered-imports
import { User } from './../Domain/Entity/User';
import { AuthInput } from './Input/AuthInput';
// tslint:disable-next-line: ordered-imports
import { logger } from '../../Utils';
// tslint:disable-next-line: ordered-imports
import { HttpException } from '../../Common/Exception/HttpException';
import { UserRoles } from '../Domain/Entity/UserRoles';

@injectable()
export class UserApplicationService {
  constructor(@inject('UserRepository') private _userService: UserRepository) {}

  async login(authInput: AuthInput): Promise<User> {
    const rol: UserRoles | undefined = await this._userService.role(
      authInput.rol()
    );

    if (typeof rol === 'undefined') {
      throw new HttpException(400, 'el rol no existe');
    }

    const user: User | undefined = await this._userService.getByNickAndPassword(
      authInput.user(),
      authInput.password(),
      authInput.rol()
    );

    if (typeof user === 'undefined') {
      throw new HttpException(400, 'error el usuario no existe');
    }
    return user;
  }
}
