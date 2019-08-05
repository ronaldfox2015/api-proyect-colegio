import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { User } from './User';

@Entity()
export class UserDetail {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    user: User;

    @Column()
    locationId: number;

    @Column()
    name: string;

    @Column()
    surname: string;

    @Column()
    secondSurname: string;

    @Column()
    documentType: string;

    @Column()
    documentNumber: string;

    @Column()
    gender: string;

    @Column()
    photo: string;

    @Column()
    birthDate: string;

    public static createAccount(
        user: User,
        locationId: number,
        name: string,
        surname: string,
        secondSurname: string,
        gender: string) {
        const userDetail = new UserDetail();
        userDetail.user = user;
        userDetail.locationId = locationId;
        userDetail.name = name;
        userDetail.surname = surname;
        userDetail.secondSurname = secondSurname;
        userDetail.gender = gender;
        return userDetail;
    }
}
