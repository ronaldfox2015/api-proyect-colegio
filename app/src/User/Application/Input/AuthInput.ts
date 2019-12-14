import { IsFQDN, IsDate, Min, Max } from 'class-validator';

export class AuthInput {
  private _user: string;
  private _password: string;
  private _rol: string;

  constructor(user: string, password: string, rol: string) {
    this._user = user;
    this._password = password;
    this._rol = rol;
  }

  user(): string {
    return this._user;
  }

  password(): string {
    return this._password;
  }

  rol(): string {
    return this._rol;
  }
}
