import { injectable, inject } from 'inversify';
import jwt from 'jsonwebtoken';
import { EncrytRepository } from '../../Domain/Repository/EncrytRepository';

@injectable()
export class JwtEncrytRepository implements EncrytRepository {
    private config

    constructor(config: object) {
        this.config = config;
     }
    encode(data: any): string {
        const token = jwt.sign({ data: data}, this.config.jwt.key);
        return token;
    }
    deencode(token: string): any {
        const decoded = jwt.verify(token, this.config.jwt.key);
        return decoded.data;
    }
}