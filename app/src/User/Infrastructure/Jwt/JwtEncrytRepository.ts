import { injectable, inject } from 'inversify';
import jwt from 'jsonwebtoken';
import { EncrytRepository } from '../../Domain/Repository/EncrytRepository';

@injectable()
export class JwtEncrytRepository implements EncrytRepository {
    private config

    constructor(configJwt: object) {
        this.config = configJwt;
     }
    encode(data: any): string {
        const token = jwt.sign({ data: data}, this.config.key);
        return token;
    }
    deencode(token: string): any {
        const decoded = jwt.verify(token, this.config.key);
        return decoded.data;
    }
}