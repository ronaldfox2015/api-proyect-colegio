"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var AuthException = /** @class */ (function () {
    function AuthException(message, status) {
        if (status === void 0) { status = 400; }
        this.message = message;
        this.status = status;
    }
    return AuthException;
}());
exports.AuthException = AuthException;
//# sourceMappingURL=AuthException.js.map