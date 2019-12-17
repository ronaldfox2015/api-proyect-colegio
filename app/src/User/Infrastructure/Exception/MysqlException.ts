export class MysqlException {
  code: number;
  message: string;

  constructor(message: string, code: number = 500) {
    this.code = code;
    this.message = message;
  }
}
