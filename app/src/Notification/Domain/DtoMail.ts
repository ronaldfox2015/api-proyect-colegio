export class DtoMail {
    private _to: string;
    private _subject: string;
    private _html: string

    constructor(to: string, subject: string, html: string) {
        this._to = to;
        this._subject = subject;
        this._html = html;
    }

    get to(): string {
        return this._to;
    }

    set to(value: string) {
        this._to = value;
    }

    get subject(): string {
        return this._subject;
    }

    set subject(value: string) {
        this._subject = value;
    }

    get html(): string {
        return this._html;
    }

    set html(value: string) {
        this._html = value;
    }
}
