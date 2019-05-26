export interface EncrytRepository {
    encode(data: any): string;
    deencode(token: string): any;
}
