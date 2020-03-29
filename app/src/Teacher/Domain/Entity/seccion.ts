import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { CourseSection } from './course-section';

@Entity('tb_seccion')
export class Section {
  @PrimaryGeneratedColumn({
    name: 'idSeccion'
  })
  id: number;

  @Column({
    name: 'idGrado'
  })
  gradeId: number;

  @Column({
    name: 'desSeccion'
  })
  sectionDescription: string;

  @Column({
    name: 'fechaCreacion'
  })
  creationDate: string;

  @OneToMany(
    type => CourseSection,
    sectionCourse => sectionCourse.section
  ) // note: we will create author property in the Photo class below
  sectionCourse: CourseSection[];
}
