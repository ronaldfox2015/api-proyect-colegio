import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
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

  @OneToMany(
    type => User,
    user => user.roles
  )
  users: User[];
}
