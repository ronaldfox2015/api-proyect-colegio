import 'mocha';
import { expect } from 'chai';
import * as httpStatus from 'http-status-codes';
import * as request from 'supertest';

import { app } from '../../src/app';

describe.only('Customers API', () => {
  it('should register a new customer', () => {
    return request(app)
      .post('/v1/user')
      .send({
        user: 'SANQUI2019',
        password: 'admin',
        token: 'John Dode'
      })
      .expect(httpStatus.OK)
      .then(res => {
        console.log(res.body);
        // tslint:disable-next-line:no-unused-expression
        // expect(res.body.id).to.exist;
        // expect(res.body.user).to.eql('SANQUI2019');
      });
  });
});
