import {IsNotEmpty, IsEmail, IsFQDN, IsDate, Min, Max} from 'class-validator';

export class InputMail {
    to: string;
    subject: string;
    title: string;
    data: any;
    constructor(to: string, subject: string, title: string, data: any) {
        this.to = to;
        this.subject = subject;
        this.title = title;
        this.data = data;
    }
}
