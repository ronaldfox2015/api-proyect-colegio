import { inject, injectable } from 'inversify';
import { CourseSection } from '../Domain/Entity/course-section';
import { ITeacherRepository } from '../Domain/Repository/ITeacherRepository';
import { CourseHydrator } from '../Application/Hydrators/course.hydrator';
import { CoursesDto } from '../../Web/Rest/dto/courses.response.dto';
import { SectionHydrator } from './Hydrators/section.hydrator';

@injectable()
export class TeacherApplicationService {
  constructor(
    @inject('TeacherRepository') private teacherRepository: ITeacherRepository,
    @inject('CourseHydrator') private courseHydrator: CourseHydrator,
    @inject('SectionHydrator') private sectionHydrator: SectionHydrator
  ) {}

  async getByIdCourse(id: number): Promise<CoursesDto> {
    const courseSection = await this.teacherRepository.getCourseByGrade(id);
    return this.courseHydrator.hydrate(courseSection);
  }

  async getByIdSection(id: number): Promise<any> {
    const courseSection = await this.teacherRepository.getCourseBySection(id);
    return this.sectionHydrator.hydrate(courseSection);
  }
}
