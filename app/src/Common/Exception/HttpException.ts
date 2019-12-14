export class HttpException {
  status: number;
  message: string;
  constructor(status: number, message: string | any) {
    this.message = message;
    this.status = status;
  }
}
