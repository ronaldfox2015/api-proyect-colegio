"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var jwt = require("jsonwebtoken");
function encryption(token, jwtSecret) {
    return jwt.sign(token, jwtSecret);
}
exports.encryption = encryption;
//# sourceMappingURL=encryption.js.map