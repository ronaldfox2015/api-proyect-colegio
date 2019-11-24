import { injectable } from 'inversify';
// @ts-ignore
import {createTransport, SentMessageInfo} from 'nodemailer';
import { DtoMail } from './../../Domain/DtoMail';
import { RepositoryMail } from './../../Domain/RepositoryMail';
import { DtoResponse } from './../../Domain/DtoResponse';

@injectable()
export class Mail implements RepositoryMail {
    connectionParameters: string;
    constructor(connectionParameters: any) {
        this.connectionParameters = connectionParameters;
    }

    /**
     *
     * @param dtoMail
     */
    sendMail(dtoMail: DtoMail): Promise<SentMessageInfo> {
        const dtoResponse = new DtoResponse();
        const transporter = createTransport(this.connectionParameters);
        return transporter.sendMail({
            from: 'ronaldfox2015@gmail.com',
            to: dtoMail.to,
            subject: dtoMail.subject,
            html: dtoMail.html
        });
    }
}
