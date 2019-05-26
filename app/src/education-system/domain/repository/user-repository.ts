import { User } from './../entity/user';

export interface UserRepository {
    login(name: string, pasword: string): Promise<User>;
    islogin(name: string, pasword: string): Promise<User>;

}
