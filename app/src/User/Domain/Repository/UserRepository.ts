import { User } from '../Entity/User';

export interface UserRepository {
    getByNickAndPassword(nick: string, password: string): Promise<User> ;
    islogin(name: string, pasword: string): Promise<User>;
}
