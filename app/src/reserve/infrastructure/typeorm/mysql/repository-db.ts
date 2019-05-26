import { injectable } from 'inversify';
import { createConnection, Connection, Repository } from 'typeorm';
import { logger } from '../../../../utils/logger';

@injectable()
export class RepositoryDb {
    _conn: string;
    _type: string;
    _host: string;
    _port: number;
    _username: string;
    _password: string;
    _database: string;
    _entities: any[];

    constructor(type: string, host: string, port: number, username: string, password: string, database: string, entities: any[]) {
        this._type = type;
        this._host = host;
        this._port = port;
        this._username = username;
        this._password = password;
        this._database = database;
        this._entities = entities;
    }

    getRepo<T>(target: string | (new () => {})): Promise<Repository<T>> {
        return this._getConn().then((conn) => conn.getRepository<T>(target));
    }

    private _getConn(): Promise<Connection> {

        // @ts-ignore
        if (this._conn) { return this._conn; }
        logger.info('Creating mongo connection pool...');
        // @ts-ignore
        return this._conn = createConnection({
            type: this._type,
            host: this._host,
            port: this._port,
            username: this._username,
            password: this._password,
            synchronize: true,
            logging: false,
            database: this._database,
            entities: this._entities
        });
    }
}
