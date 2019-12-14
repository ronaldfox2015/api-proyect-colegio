import { Entity, Column, PrimaryGeneratedColumn, OneToOne } from 'typeorm';
import { User } from './User';

@Entity('tb_rol')
export class UserRoles {
  @PrimaryGeneratedColumn({
    name: 'idRol'
  })
  id: number;

  @Column({
    name: 'nombreRol'
  })
  name: string;

  @Column({
    name: 'slug'
  })
  slug: string;

  @Column({
    name: 'estadoRol'
  })
  status: string;

  @OneToOne(
    type => User,
    user => user.roles.id
  )
  users: User;
}
