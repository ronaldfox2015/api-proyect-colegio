import { injectable, inject } from 'inversify';
import { UserRepository } from './../Domain/Repository/UserRepository';
import { User } from './../Domain/Entity/User';
import { UserInput } from './Input/UserInput';
import {AuthInput} from './Input/AuthInput';
@injectable()
export class UserApplicationService {

    constructor(
        @inject('UserRepository') private _UserRepository: UserRepository
    ) { }

    login(authInput: AuthInput): Promise<User> {
        const user = this._UserRepository.getByNickAndPassword(
            authInput.user(),
            authInput.password()
        );
        return user;
    }
}
