import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Section } from './seccion';

@Entity('tb_curso_seccion')
export class CourseSection {
  @PrimaryGeneratedColumn({
    name: 'idCurso'
  })
  courseId: number;

  @PrimaryGeneratedColumn({
    name: 'idSeccion'
  })
  sectionId: number;

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
    section => section.courseSection
  )
  section: Section;
}
