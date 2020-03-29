import { injectable } from 'inversify';
import {
  CoursesDto,
  CoursesResponseDto
} from '../../../Web/Rest/dto/courses.response.dto';
import { CourseSection } from '../../Domain/Entity/course-section';

@injectable()
export class CourseHydrator {
  public hydrate(data: CourseSection[]): CoursesDto {
    const courses = [];
    data.forEach((courseSection: CourseSection) => {
      const coursesResponseDto = new CoursesResponseDto();
      coursesResponseDto.id = courseSection.course.id;
      coursesResponseDto.name = courseSection.course.description;
      coursesResponseDto.section = courseSection.section.sectionDescription;
      courses.push(coursesResponseDto);
    });
    const coursesDto = new CoursesDto();
    coursesDto.status = true;
    coursesDto.data = courses;
    return coursesDto;
  }
}
