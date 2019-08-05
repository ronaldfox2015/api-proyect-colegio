import {injectable, inject} from 'inversify';
import {User} from '../../Domain/Entity/User';
import {UserRepository} from '../../Domain/Repository/UserRepository';
import {Mysql} from './../../../Common/Adapter/Persistence/TypeOrm/Mysql';
import {logger} from '../../../Utils';
import {EntityManager} from 'typeorm';
import {UserDetail} from "../../Domain/Entity/UserDetail";

@injectable()
export class TypeORMUserRepository implements UserRepository {

    constructor(
        @inject('Mysql') private _repositoryDb: Mysql
    ) {
    }

    async getByEmailAndPassword(email: string, password: string): Promise<User> {
        return this._repositoryDb.getConnection().then((connection) => {
            return connection.getRepository(User).createQueryBuilder('u').where(
                `u.email=:userEmail`,
                {
                    userEmail: email
                }).andWhere(
                `u.password=:UserPassword`,
                {
                    UserPassword: password
                }
            ).getMany();
        }).catch((error) => logger.info(error));
    }

    // @ts-ignore
    // tslint:disable-next-line:no-empty
    async islogin(name: string, password: string): Promise<User> {
        return;
    }

    async create(userDetail: UserDetail): Promise<User> {
        return this._repositoryDb.manager().then((entityManager: EntityManager) => {
            return entityManager.save(userDetail);
        }).catch(
            (error) =>
                logger.info(error)
        );
    }
}
