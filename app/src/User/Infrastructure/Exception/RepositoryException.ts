export class RepositoryException {
  status: number;
  message: string;
  constructor(message: string | any, status: number = 502) {
    this.message = message;
    this.status = status;
  }
}
