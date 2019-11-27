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
Object.defineProperty(exports, "__esModule", { value: true });
var class_validator_1 = require("class-validator");
var UserInput = /** @class */ (function () {
    /**
     *
     * @param email
     * @param password
     * @param rol
     * @param locationId
     * @param name
     * @param surname
     * @param secondSurname
     * @param gender
     */
    function UserInput(email, password, rol, locationId, name, surname, secondSurname, gender) {
        this.email = email;
        this.password = password;
        this.rol = rol;
        this.locationId = locationId;
        this.name = name;
        this.surname = surname;
        this.secondSurname = secondSurname;
        this.gender = gender;
    }
    __decorate([
        class_validator_1.IsEmail(),
        class_validator_1.IsNotEmpty({
            message: 'es un campo requerido'
        }),
        __metadata("design:type", String)
    ], UserInput.prototype, "email", void 0);
    __decorate([
        class_validator_1.IsNotEmpty({
            message: 'es un campo requerido'
        }),
        __metadata("design:type", String)
    ], UserInput.prototype, "password", void 0);
    return UserInput;
}());
exports.UserInput = UserInput;
//# sourceMappingURL=UserInput.js.map