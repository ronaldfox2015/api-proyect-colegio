import { injectable } from 'inversify';
import {
  SectionDto,
  SectionResponseDto
} from '../../../Web/Rest/dto/section.response.dto';
import { CourseSection } from '../../Domain/Entity/course-section';

@injectable()
export class SectionHydrator {
  public hydrate(data: CourseSection[]): SectionDto {
    const courses = [];
    data.forEach((courseSection: CourseSection) => {
      const coursesResponseDto = new SectionResponseDto();
      coursesResponseDto.id = courseSection.section.id;
      coursesResponseDto.name = courseSection.section.sectionDescription;
      courses.push(coursesResponseDto);
    });
    const coursesDto = new SectionDto();
    coursesDto.status = true;
    coursesDto.data = courses;
    return coursesDto;
  }
}
