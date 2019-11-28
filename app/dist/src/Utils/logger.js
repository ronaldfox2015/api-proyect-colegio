"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var winston = require("winston");
var logger = new winston.Logger({
    transports: [
        new (winston.transports.File)({ filename: 'somefile.log' }),
        new winston.transports.Console({
            colorize: true,
            json: true
        })
    ]
});
exports.logger = logger;
logger.stream = {
    write: function (message, encoding) {
        logger.info(message);
    }
};
//# sourceMappingURL=logger.js.map