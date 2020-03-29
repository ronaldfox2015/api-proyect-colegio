import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { CourseSection } from './course-section';

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
  status: number;

  @OneToMany(
    type => CourseSection,
    courseSection => courseSection.course
  ) // note: we will create author property in the Photo class below
  courseSection: CourseSection[];
}
