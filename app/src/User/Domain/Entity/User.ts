import {
  Column,
  Entity,
  JoinColumn,
  OneToOne,
  PrimaryGeneratedColumn,
  Table
} from 'typeorm';
import { UserRoles } from './UserRoles';

@Entity('tb_usuario')
export class User {
  @PrimaryGeneratedColumn({
    name: 'idUsuario'
  })
  id: number;

  @Column({
    name: 'nomUsuario'
  })
  nick: string;

  @Column({
    name: 'password'
  })
  password: string;

  @Column({
    name: 'estadoUsuario'
  })
  status: string;

  @OneToOne(
    type => UserRoles,
    roles => roles.id
  )
  @JoinColumn({
    name: 'idRol'
  })
  roles: UserRoles;

  static create(
    id: number,
    nick: string,
    password: string,
    roles: UserRoles
  ): User {
    const user = new User();
    user.id = id;
    user.nick = nick;
    user.password = password;
    user.roles = roles;
    return user;
  }
}
