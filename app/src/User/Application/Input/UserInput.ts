import { IsNotEmpty, IsEmail, IsFQDN, IsDate, Min, Max } from 'class-validator';

export class UserInput {
  @IsEmail()
  nick: string;

  @IsNotEmpty({
    message: 'es un campo requerido'
  })
  password: string;
  role: string;
  /**
   *
   * @param nick
   * @param password
   * @param rol
   * @param locationId
   * @param name
   * @param surname
   * @param secondSurname
   * @param gender
   */
  constructor(
    nick: string,
    password: string,
    rol: string,
    locationId: number,
    name: string,
    surname: string,
    secondSurname: string,
    gender: string
  ) {
    this.email = email;
    this.password = password;
    this.rol = rol;
    this.locationId = locationId;
    this.name = name;
    this.surname = surname;
    this.secondSurname = secondSurname;
    this.gender = gender;
  }
}
