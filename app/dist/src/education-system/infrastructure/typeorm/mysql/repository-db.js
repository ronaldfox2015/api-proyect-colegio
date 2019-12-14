"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
var inversify_1 = require("inversify");
var typeorm_1 = require("typeorm");
var logger_1 = require("../../../../utils/logger");
var RepositoryDb = /** @class */ (function () {
    function RepositoryDb(type, host, port, username, password, database, entities) {
        this._type = type;
        this._host = host;
        this._port = port;
        this._username = username;
        this._password = password;
        this._database = database;
        this._entities = entities;
    }
    RepositoryDb.prototype.getRepo = function (target) {
        return this._getConn().then(function (conn) { return conn.getRepository(target); });
    };
    RepositoryDb.prototype.getConnection = function () {
        return this._getConn();
    };
    RepositoryDb.prototype._getConn = function () {
        // @ts-ignore
        if (this._conn) {
            return this._conn;
        }
        logger_1.logger.info('Creating mongo connection pool...');
        // @ts-ignore
        return this._conn = typeorm_1.createConnection({
            type: this._type,
            host: this._host,
            port: this._port,
            username: this._username,
            password: this._password,
            synchronize: true,
            logging: false,
            database: this._database,
            entities: this._entities
        });
    };
    RepositoryDb = __decorate([
        inversify_1.injectable(),
        __metadata("design:paramtypes", [String, String, Number, String, String, String, Array])
    ], RepositoryDb);
    return RepositoryDb;
}());
exports.RepositoryDb = RepositoryDb;
//# sourceMappingURL=repository-db.js.map