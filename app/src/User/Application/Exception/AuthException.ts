export class AuthException {
  status: number;
  message: string;
  constructor(message: string | any, status: number = 400) {
    this.message = message;
    this.status = status;
  }
}
