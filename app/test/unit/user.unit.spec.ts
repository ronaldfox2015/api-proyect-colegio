import 'mocha';
import { expect } from 'chai';
import * as httpStatus from 'http-status-codes';
import * as request from 'supertest';

import { app } from '../../src/app';

describe('test unit', () => {

    it('should register a new user', () => {
        console.log(app.stack);
    });

});
