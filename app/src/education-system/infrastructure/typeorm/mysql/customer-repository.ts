import { injectable, inject } from 'inversify';
import { CustomerRepository } from '../../../domain/customer-repository';
import { Customer } from '../../../domain/customer';
import {RepositoryDb} from './repository-db';

@injectable()
export class TypeORMCustomerRepository implements CustomerRepository {

    constructor(
        @inject('RepositoryDb') private _conn: RepositoryDb
    ) { }

    async create(cust: Customer): Promise<Customer> {
        const repo = await this._repo();
        return repo.save(cust);
    }
    async findById(id: string): Promise<Customer> {
        const repo = await this._repo();
        return repo.findOneById(id);
    }

    private _repo() {
        return this._conn.getRepo<Customer>(Customer);
    }

}
