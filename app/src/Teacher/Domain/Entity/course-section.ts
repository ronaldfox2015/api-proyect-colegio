import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
  ManyToMany
} from 'typeorm';
import { Course } from './course';
import { Section } from './seccion';

@Entity('tb_curso_seccion')
export class CourseSection {
  @Column({
    name: 'idDocente'
  })
  teacherId: number;

  @Column({
    name: 'fechaCurso'
  })
  courseDate: string;

  // tslint:disable-next-line: arrow-parens
  @ManyToOne(
    type => Section,
    section => section.id
  )
  @PrimaryGeneratedColumn({ name: 'idSeccion' })
  @JoinColumn({ name: 'idSeccion' })
  section: Section;

  @ManyToOne(
    type => Course,
    course => course.id
  )
  @PrimaryGeneratedColumn({ name: 'idCurso' })
  @JoinColumn({ name: 'idCurso' })
  course: Course;
}
