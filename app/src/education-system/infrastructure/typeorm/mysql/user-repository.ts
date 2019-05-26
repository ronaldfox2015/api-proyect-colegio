import { injectable, inject } from 'inversify';
import { UserRepository } from '../../../domain/repository/user-repository';
import { User } from '../../../domain/entity/user';
import { getManager } from 'typeorm';
import {RepositoryDb} from './repository-db';
import { logger } from '../../../../utils/logger';
import { createConnection, Connection, Repository } from 'typeorm';

@injectable()
export class TypeORMUserRepository implements UserRepository {

    constructor(
        @inject('RepositoryDb') private _conn: RepositoryDb
    ) { }

    async login(name: string, password: string): Promise<User> {
        const repo = await this._repo();
        const response  = repo.findOne({where: {nombreUsuario : name, passwordUsuario : password}});
        response.then((user): User => {
            return user;
        });
        return response;
    }

    async islogin(name: string, password: string): Promise<User> {
        const repo = await this._repo();
        const response = repo.findOne({where: {nombreUsuario : name, passwordUsuario : password}});
        return response.then((user): User => user);
    }

    private _repo() {
        return this._conn.getRepo<User>(User);
    }
}
