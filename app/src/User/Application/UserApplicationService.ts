import { injectable, inject } from 'inversify';
import { UserRepository } from './../Domain/Repository/UserRepository';
import { User } from './../Domain/Entity/User';
import { UserInput } from './Input/UserInput';
import {UserDetail} from './../Domain/Entity/UserDetail';
@injectable()
export class UserApplicationService {

    constructor(
        @inject('UserRepository') private _UserRepository: UserRepository
    ) { }

    /**
     * d
     * @param name
     * @param pasword
     */
    async login(name: string, pasword: string): Promise<User> {
        const login = await this._UserRepository.islogin(name, pasword);
        return login;
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
