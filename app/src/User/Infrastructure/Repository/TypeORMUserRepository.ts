import {injectable, inject} from 'inversify';
import {User} from '../../Domain/Entity/User';
import {UserRepository} from '../../Domain/Repository/UserRepository';
import {Mysql} from './../../../Common/Adapter/Persistence/TypeOrm/Mysql';
import {logger} from '../../../Utils';

@injectable()
// @ts-ignore
export class TypeORMUserRepository implements UserRepository {

    constructor(
        @inject('Mysql') private _repositoryDb: Mysql
    ) {
    }

    async getByNickAndPassword(nick: string, password: string): Promise<User> {
        return this._repositoryDb.getConnection().then((connection) => {
            return connection.getRepository(User).createQueryBuilder('u').where(
                `u.nomUsuario=:nick`,
                {
                    nick: nick
                }).andWhere(
                `u.password=:password`,
                {
                    password : password
                }
            ).getMany();
        }).catch((error) => logger.info(error));
    }

    // @ts-ignore
    // tslint:disable-next-line:no-empty
    async islogin(name: string, password: string): Promise<User> {
        return;
    }

}
