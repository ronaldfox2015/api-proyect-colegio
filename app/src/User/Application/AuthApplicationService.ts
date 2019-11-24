import { injectable, inject } from 'inversify';
import { UserRepository } from './../Domain/Repository/UserRepository';
import { User } from './../Domain/Entity/User';
import { UserInput } from './Input/UserInput';
import {UserDetail} from './../Domain/Entity/UserDetail';
import {AuthInput} from './Input/AuthInput';

@injectable()
// @ts-ignore
export class AuthApplicationService {

    constructor(
        // @ts-ignore
        @inject('UserRepository') private _UserRepository: UserRepository
    ) { }

    login(authInput: AuthInput): AuthInput {
        return  authInput;
    }
}
