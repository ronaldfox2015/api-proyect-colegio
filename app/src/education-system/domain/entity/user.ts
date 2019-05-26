import { Entity, ObjectIdColumn, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class User {
    @PrimaryGeneratedColumn()
    idUsuario: number;

    @Column()
    nombreUsuario: string;

    @Column()
    passwordUsuario: string;
    
    @Column()
    estadoUsuario: string;

    constructor(nombreUsuario?: string) {
        this.nombreUsuario = nombreUsuario;
    }
}