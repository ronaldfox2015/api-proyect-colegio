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
var HTTP_CODES = require("http-status-codes");
var logger_1 = require("../../utils/logger");
var customer_application_service_1 = require("./../../education-system/application/customer/customer-application-service");
var register_customer_command_1 = require("./../../education-system/application/customer/commands/register-customer-command");
var CustomerController = /** @class */ (function () {
    function CustomerController(customerAppSvc) {
        this.customerAppSvc = customerAppSvc;
    }
    CustomerController.prototype.registerMovie = function (request, response) {
        var customerRegCmd = new register_customer_command_1.RegisterCustomerCommand();
        customerRegCmd.name = request.body.name;
        return this.customerAppSvc.registerCustomer(customerRegCmd).then(function (customer) {
            response.send(customer);
        }).catch(function (err) {
            logger_1.logger.error(err.message);
            logger_1.logger.error(err.stack);
            response.status(HTTP_CODES.INTERNAL_SERVER_ERROR).send(err.message);
        });
    };
    __decorate([
        inversify_express_utils_1.httpPost('/customers/commands/register'),
        __metadata("design:type", Function),
        __metadata("design:paramtypes", [Object, Object]),
        __metadata("design:returntype", void 0)
    ], CustomerController.prototype, "registerMovie", null);
    CustomerController = __decorate([
        inversify_1.injectable(),
        inversify_express_utils_1.controller('/api'),
        __param(0, inversify_1.inject('CustomerApplicationService')),
        __metadata("design:paramtypes", [customer_application_service_1.CustomerApplicationService])
    ], CustomerController);
    return CustomerController;
}());
exports.CustomerController = CustomerController;
//# sourceMappingURL=customer-controller.js.map