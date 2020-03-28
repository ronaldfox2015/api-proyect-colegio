import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tb_curso')
export class Course {
  @PrimaryGeneratedColumn({
    name: 'idCurso'
  })
  id: number;

  @Column({
    name: 'descripcion'
  })
  description: string;

  @Column({
    name: 'estado'
  })
  status: string;
}
