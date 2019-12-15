export class AuthException {
  code: number;
  message: string;
  constructor(message: string | any, code: number = 400) {
    this.message = message;
    this.code = code;
  }
}
