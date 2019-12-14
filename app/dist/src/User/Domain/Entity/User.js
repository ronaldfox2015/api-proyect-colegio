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
var typeorm_1 = require("typeorm");
var UserRoles_1 = require("./UserRoles");
var User = /** @class */ (function () {
    function User() {
    }
    User_1 = User;
    User.create = function (id, nick, password, roles) {
        var user = new User_1();
        user.id = id;
        user.nick = nick;
        user.password = password;
        return user;
    };
    __decorate([
        typeorm_1.PrimaryGeneratedColumn({
            name: 'idUsuario'
        }),
        __metadata("design:type", Number)
    ], User.prototype, "id", void 0);
    __decorate([
        typeorm_1.Column({
            name: 'nomUsuario'
        }),
        __metadata("design:type", String)
    ], User.prototype, "nick", void 0);
    __decorate([
        typeorm_1.Column({
            name: 'password'
        }),
        __metadata("design:type", String)
    ], User.prototype, "password", void 0);
    __decorate([
        typeorm_1.Column({
            name: 'estadoUsuario'
        }),
        __metadata("design:type", String)
    ], User.prototype, "status", void 0);
    __decorate([
        typeorm_1.ManyToOne(function (type) { return UserRoles_1.UserRoles; }, function (roles) { return roles.id; }),
        typeorm_1.JoinColumn({ name: 'idRol' }),
        __metadata("design:type", UserRoles_1.UserRoles)
    ], User.prototype, "roles", void 0);
    User = User_1 = __decorate([
        typeorm_1.Entity('tb_usuario')
    ], User);
    return User;
    var User_1;
}());
exports.User = User;
//# sourceMappingURL=User.js.map