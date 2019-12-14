"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var RepositoryException = /** @class */ (function () {
    function RepositoryException(message, status) {
        if (status === void 0) { status = 502; }
        this.message = message;
        this.status = status;
    }
    return RepositoryException;
}());
exports.RepositoryException = RepositoryException;
//# sourceMappingURL=RepositoryException.js.map