import { injectable } from 'inversify';
import {
  Connection,
  createConnection,
  Entity,
  EntityManager,
  Repository
} from 'typeorm';
import { logger } from '../../../../Utils';

@injectable()
export class Mysql {
  connectionParameters: any;
  constructor(connectionParameters: any) {
    this.connectionParameters = connectionParameters;
  }
  // tslint:disable-next-line: whitespace
  async manager(): Promise<EntityManager | void> {
    const connection = await createConnection(this.connectionParameters)
      .then(con => {
        const manager = con.manager;
        return manager;
        // tslint:disable-next-line:no-console
      })
      .catch(error => logger.info(error));
    return connection;
  }

  // @ts-ignore
  async getRepository(entity: any): Repository<Entity> {
    const connection = await createConnection(this.connectionParameters);
    return connection.getRepository(entity);
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
