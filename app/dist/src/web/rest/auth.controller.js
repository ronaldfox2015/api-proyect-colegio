"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
var inversify_1 = require("inversify");
var inversify_express_utils_1 = require("inversify-express-utils");
var user_application_service_1 = require("./../../education-system/application/user/user-application-service");
var AuthController = /** @class */ (function () {
    function AuthController(userAppSvc) {
        this.userAppSvc = userAppSvc;
    }
    AuthController.prototype.registerMovie = function (request, response) {
        request.body.response = this.userAppSvc.login(request.body.user, request.body.pasword);
        return response.send(request.body.response);
    };
    __decorate([
        inversify_express_utils_1.httpPost('/user/login'),
        __metadata("design:type", Function),
        __metadata("design:paramtypes", [Object, Object]),
        __metadata("design:returntype", void 0)
    ], AuthController.prototype, "registerMovie", null);
    AuthController = __decorate([
        inversify_1.injectable(),
        inversify_express_utils_1.controller('/v1'),
        __param(0, inversify_1.inject('UserApplicationService')),
        __metadata("design:paramtypes", [user_application_service_1.UserApplicationService])
    ], AuthController);
    return AuthController;
}());
exports.AuthController = AuthController;
//# sourceMappingURL=auth.controller.js.map