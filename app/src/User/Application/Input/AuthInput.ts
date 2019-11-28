import {IsNotEmpty, IsEmail, IsFQDN, IsDate, Min, Max} from 'class-validator';

export class AuthInput {

    private _user: string
    private _password: string;
    private _token: string;

    /**
     * @param user
     * @param password
     * @param token
     */
    constructor(user: string, password: string, token: string) {
        this._user = user;
        this._password = password;
        this._token = token;
    }

    user(): string {
        return this._user;
    }

    password(): string {
        return this._password;
    }

    token(): string {
        return this._token;
    }
}
