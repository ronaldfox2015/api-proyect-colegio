import { inject, injectable } from 'inversify';
import { logger } from '../../Utils/logger';
import { IUserRepository } from '../Domain/Repository/IUserRepository';
import { User } from './../Domain/Entity/User';
import { UserRoles } from './../Domain/Entity/UserRoles';
import { AuthException } from './Exception/AuthException';
import { AuthInput } from './Input/AuthInput';
import { AuthOuput } from './Ouput/AuthOuput';

@injectable()
export class AuthApplicationService {
  constructor(
    @inject('UserRepository') private userRepository: IUserRepository
  ) {}

  async login(authInput: AuthInput): Promise<AuthOuput> {
    const rol: UserRoles | undefined = await this.userRepository.role(
      authInput.rol()
    );

    if (typeof rol === 'undefined') {
      throw new AuthException('el rol no existe');
    }

    const user:
      | User
      | undefined = await this.userRepository.getByNickAndPassword(
      authInput.user(),
      authInput.password(),
      authInput.rol()
    );

    if (typeof user === 'undefined') {
      throw new AuthException('error el usuario no existe');
    }
    return new AuthOuput(200, user);
  }
}
