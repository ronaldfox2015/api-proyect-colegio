import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';
import { UserDetail } from './UserDetail';

@Entity()
export class User {
    @PrimaryGeneratedColumn({
        name : 'idUsuario'
    })
    id: number;

    @Column({
        name : 'nomUsuario'
    })
    nick: string;

    @Column({
        name : 'password'
    })
    password: string;

    @Column({
        name : 'estadoUsuario'
    })
    status: string;

    @Column()
    idRol: number;
}
