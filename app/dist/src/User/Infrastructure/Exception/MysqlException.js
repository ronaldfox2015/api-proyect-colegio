"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var MysqlException = /** @class */ (function () {
    function MysqlException(message, status) {
        if (status === void 0) { status = 502; }
        this.message = message;
        this.status = status;
    }
    return MysqlException;
}());
exports.MysqlException = MysqlException;
//# sourceMappingURL=MysqlException.js.map