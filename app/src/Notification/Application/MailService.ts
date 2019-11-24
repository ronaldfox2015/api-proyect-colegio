import { injectable, inject } from 'inversify';
import { DtoMail } from './../Domain/DtoMail';
import { RepositoryMail } from './../Domain/RepositoryMail';
import { DtoResponse } from './../Domain/DtoResponse';
import { InputMail } from './InputMail';
@injectable()
export class MailService {
    constructor(
        @inject('RepositoryMail') private _RepositoryMail: RepositoryMail
    ) { }
    send(dtoMail: DtoMail): Promise<DtoResponse> {
        const dtoResponse = new DtoResponse();
        const rest = this._RepositoryMail.sendMail(dtoMail).then((response) => {
            dtoResponse.setStatus(true);
            dtoResponse.setMessages('E-mail enviado com sucesso!');
            return dtoResponse;
        }).catch((error) => {
            return error;
        });
        return rest;
    }

    sendWithTemplate(inputMail: InputMail): Promise<DtoResponse> {
        const dtoResponse = new DtoResponse();
        const dtoMail = new DtoMail(inputMail.to, inputMail.subject, '-----');
        return this.send(dtoMail);
    }
}
