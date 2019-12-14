"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var AuthInput = /** @class */ (function () {
    function AuthInput(user, password, rol) {
        this._user = user;
        this._password = password;
        this._rol = rol;
    }
    AuthInput.prototype.user = function () {
        return this._user;
    };
    AuthInput.prototype.password = function () {
        return this._password;
    };
    AuthInput.prototype.rol = function () {
        return this._rol;
    };
    return AuthInput;
}());
exports.AuthInput = AuthInput;
//# sourceMappingURL=AuthInput.js.map