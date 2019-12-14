import { inject, injectable } from 'inversify';
import { HttpException } from './../../Common/Exception/HttpException';
import { User } from './../Domain/Entity/User';
import { UserRoles } from './../Domain/Entity/UserRoles';
import { UserRepository } from './../Domain/Repository/UserRepository';
import { AuthInput } from './Input/AuthInput';

@injectable()
// @ts-ignore
export class AuthApplicationService {
  constructor(
    // @ts-ignore
    @inject('UserRepository') private userRepository: UserRepository
  ) {}

  async login(authInput: AuthInput): Promise<User> {
    const rol: UserRoles | undefined = await this.userRepository.role(
      authInput.rol()
    );

    if (typeof rol === 'undefined') {
      throw new HttpException(400, 'el rol no existe');
    }

    const user:
      | User
      | undefined = await this.userRepository.getByNickAndPassword(
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
