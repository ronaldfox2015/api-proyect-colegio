"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var AuthInput = /** @class */ (function () {
    /**
     * @param user
     * @param password
     * @param token
     */
    function AuthInput(user, password, token) {
        this._user = user;
        this._password = password;
        this._token = token;
    }
    AuthInput.prototype.user = function () {
        return this._user;
    };
    AuthInput.prototype.password = function () {
        return this._password;
    };
    AuthInput.prototype.token = function () {
        return this._token;
    };
    return AuthInput;
}());
exports.AuthInput = AuthInput;
//# sourceMappingURL=AuthInput.js.map