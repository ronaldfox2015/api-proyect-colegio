import { CourseSection } from '../Entity/course-section';

export interface ITeacherRepository {
  all(): Promise<any[]>;
  getCourseByGrade(id: number): Promise<CourseSection[]>;
  getCourseBySection(id: number): Promise<CourseSection[]>;
}
