import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';
import { UserDetail } from './UserDetail';

@Entity()
export class User {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    nick: string;

    @Column()
    email: string;

    @Column()
    cellPhoneNumber: string;

    @Column()
    password: string;

    @Column()
    creationDate: Date;

    @Column()
    updateDate: Date;

    @Column()
    loginDate: Date;

    @Column()
    rol: string;

    @Column()
    status: string;

    public static createAccountByEmail(
        email: string,
        password: string,
        rol: string
        ) {
        const user = new User();
        user.email = email;
        user.password = password;
        user.creationDate = new Date();
        user.updateDate = new Date();
        user.loginDate = new Date();
        user.rol = rol;
        user.status = '1';
        return user;
    }
}
