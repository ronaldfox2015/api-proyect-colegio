import { injectable } from 'inversify';
import {
  Connection,
  createConnection,
  Entity,
  EntityManager,
  Repository,
  getConnectionManager
} from 'typeorm';

@injectable()
export class OrmMysql {
  connection: any;
  connectionParameters: any;

  constructor(connectionParameters: any) {
    this.connectionParameters = connectionParameters;
  }

  public async getCustomRepository(repository: any) {
    const manager = await createConnection(this.connectionParameters);
    return manager.getCustomRepository(repository);
  }
}
