export class DtoResponse {
    private status: boolean;
    private messages: string;
    private data: any;

    constructor(status: boolean = false, messages: string = '', data: any = []) {
        this.status = status;
        this.messages = messages;
        this.data = data;
    }

    getStatus(): boolean {
       return this.status;
    }

    setStatus(status: boolean) {
        this.status = status;
    }

    getMessages(): string {
        return this.messages;
    }

    setMessages(messages: string) {
        this.messages = messages;
    }

    getData(): any {
        return this.data;
    }

    setData(data: any) {
        this.data = data;
    }
}

