"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var logger_1 = require("../../Utils/logger");
function errorMiddleware(error, request, response, next) {
    var status = error.status || 500;
    var message = error.message || 'Something went wrong';
    logger_1.logger.info(status);
    response
        .status(status)
        .send({
        status: status,
        message: message
    });
}
exports.errorMiddleware = errorMiddleware;
//# sourceMappingURL=error.middleware.js.map