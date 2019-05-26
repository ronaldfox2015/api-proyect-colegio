import { injectable, inject } from 'inversify';
import { UserRepository } from '../../domain/repository/user-repository';
import { User } from '../../domain/entity/user';

@injectable()
export class UserApplicationService {

    constructor(
        @inject('UserRepository') private _userRepo: UserRepository
    ) { }

    /**
     * 
     * @param name 
     * @param pasword 
     */
    async login(name: string, pasword: string): Promise<User> {
        const login = await this._userRepo.islogin(name,pasword);
            console.log(login);
        return login;
    }
}
