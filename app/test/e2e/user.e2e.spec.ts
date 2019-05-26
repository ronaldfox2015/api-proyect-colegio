import 'mocha';
import { expect } from 'chai';
import * as httpStatus from 'http-status-codes';
import * as request from 'supertest';

import { app } from '../../src/app';

describe('Crear usuario API', () => {

    it('should register a new user', () => {

        return request(app)
            .post('/v1/user/login')
            .send({
                user: 'ronaldcutissaca',
                pasword: '123456'
            })
            .expect(httpStatus.OK)
            .then((res) => {
                // tslint:disable-next-line:no-unused-expression
                expect(res.body.id).to.exist;
                expect(res.body.name).to.eql('John Doe');
            });
    });

});
