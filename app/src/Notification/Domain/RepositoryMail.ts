import { DtoMail } from './DtoMail';
import {DtoResponse} from './DtoResponse';
import { SentMessageInfo } from 'nodemailer';

export interface RepositoryMail {
    sendMail(dtoMail: DtoMail): Promise<SentMessageInfo> ;
}
