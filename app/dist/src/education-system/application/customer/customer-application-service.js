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
var customer_1 = require("../../domain/customer");
var CustomerApplicationService = /** @class */ (function () {
    function CustomerApplicationService(_customerRepo) {
        this._customerRepo = _customerRepo;
    }
    /**
     * User Story 003 - As a new Customer, I want to be able to create a new account.
     *
     * @param customerRegCmd The customer data input to create a new accountIs
     */
    CustomerApplicationService.prototype.registerCustomer = function (customerRegCmd) {
        var customer = new customer_1.Customer(customerRegCmd.name);
        return this._customerRepo.create(customer);
    };
    CustomerApplicationService = __decorate([
        inversify_1.injectable(),
        __param(0, inversify_1.inject('CustomerRepository')),
        __metadata("design:paramtypes", [Object])
    ], CustomerApplicationService);
    return CustomerApplicationService;
}());
exports.CustomerApplicationService = CustomerApplicationService;
//# sourceMappingURL=customer-application-service.js.map