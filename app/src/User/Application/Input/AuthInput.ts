import {IsNotEmpty, IsEmail, IsFQDN, IsDate, Min, Max} from 'class-validator';

export class AuthInput {

    user: string
    password: string;
    token: string;

    /**
     * @param user
     * @param password
     * @param token
     */
    constructor(user: string, password: string, token: string) {
        this.user = user;
        this.password = password;
        this.token = token;
    }
}
