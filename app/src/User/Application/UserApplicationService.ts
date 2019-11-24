import { injectable, inject } from 'inversify';
import { UserRepository } from './../Domain/Repository/UserRepository';
import { User } from './../Domain/Entity/User';
import { UserInput } from './Input/UserInput';
import {UserDetail} from './../Domain/Entity/UserDetail';
import {AuthInput} from './Input/AuthInput';
@injectable()
export class UserApplicationService {

    constructor(
        @inject('UserRepository') private _UserRepository: UserRepository
    ) { }

    async login(authInput: AuthInput): Promise<object> {
        return authInput;
    }

    async createAccount(userInput: UserInput): Promise<object> {
        const user = User.createAccountByEmail(
            userInput.email,
            userInput.password,
            userInput.rol
        );
        const userDetail = UserDetail.createAccount(
            user,
            userInput.locationId,
            userInput.name,
            userInput.surname,
            userInput.secondSurname,
            userInput.gender
        );

        await this._UserRepository.create(userDetail);
        return {
            message: 'string',
            status: true
          };
    }

}
