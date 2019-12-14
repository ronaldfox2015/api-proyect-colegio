"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function ResponseHandler(apiResponse, request, response, next) {
    try {
        return response.send(apiResponse);
    }
    catch (error) {
        return response.status(error.status).json({ error: error.message, status: error.status });
    }
}
exports.ResponseHandler = ResponseHandler;
//# sourceMappingURL=ResponseHandler.js.map