"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express = require("express");
var PostNotFoundException = /** @class */ (function () {
    function PostNotFoundException(code, message) {
        var app = express();
        app.response
            .status(code)
            .send({
            code: code,
            message: message
        });
    }
    return PostNotFoundException;
}());
exports.PostNotFoundException = PostNotFoundException;
//# sourceMappingURL=PostNotFoundException.js.map