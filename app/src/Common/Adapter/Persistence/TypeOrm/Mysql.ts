import { injectable } from 'inversify';
import {Connection, createConnection, EntityManager, Repository, Entity} from 'typeorm';
import { logger } from '../../../../Utils';

@injectable()
export class Mysql {
    connectionParameters: any;

    constructor(connectionParameters: any) {
        this.connectionParameters = connectionParameters;
    }
    // tslint:disable-next-line: whitespace
    async manager(): Promise<EntityManager | void> {
        logger.info(this.connectionParameters);
        const connection = await createConnection(this.connectionParameters).then((con) => {
            return con.manager;
            // tslint:disable-next-line:no-console
        }).catch((error) => logger.info(error));
        return connection;
    }

    // @ts-ignore
    /**
     *
     * @param entity
     */
    async getRepository(entity: any) {
        const connection = await createConnection(this.connectionParameters);
        return connection.getRepository(entity).createQueryBuilder(entity.name);
    }

    /**
     *
     * @param entity
     */
    async getConnection(): Promise<Connection> {
        const connection = await createConnection(this.connectionParameters);
        return connection;
    }
}
