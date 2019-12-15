// tslint:disable-next-line: ordered-imports
import { injectable, inject } from 'inversify';
import { IUserRepository } from '../Domain/Repository/IUserRepository';
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
  constructor(
    @inject('UserRepository') private _userService: IUserRepository
  ) {}

  async create(authInput: AuthInput): Promise<User> {
    return new User();
  }
}
