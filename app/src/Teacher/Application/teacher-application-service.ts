import { inject, injectable } from 'inversify';
import { ITeacherRepository } from '../Domain/Repository/ITeacherRepository';

@injectable()
export class TeacherApplicationService {
  constructor(
    @inject('TeacherRepository') private teacherRepository: ITeacherRepository
  ) {}

  async getByIdCourse(id: string): Promise<any> {
    return this.teacherRepository.all();
  }
}
