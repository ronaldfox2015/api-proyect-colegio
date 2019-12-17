export class AuthOuput {
  code: number;
  user: any;
  constructor(code: number, user: any) {
    this.code = code;
    this.user = user;
  }
}
