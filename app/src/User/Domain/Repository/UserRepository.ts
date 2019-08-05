import { User } from '../Entity/User';
import { UserDetail } from '../Entity/UserDetail';

export interface UserRepository {
    getByEmailAndPassword(email: string, password: string): Promise<User>;
    islogin(name: string, pasword: string): Promise<User>;
    create(userDetail: UserDetail): Promise<User>;
}
