// tslint:disable-next-line: ordered-imports
import { ErrorRequestHandler, NextFunction, Request, Response } from 'express';
import { inject, injectable } from 'inversify';
// tslint:disable-next-line: ordered-imports
import { httpGet, httpPost, controller } from 'inversify-express-utils';
import { TeacherApplicationService } from '../../Teacher/Application/teacher-application-service';

// tslint:disable-next-line: ordered-imports
@injectable()
@controller('/v1')
export class TeacherController {
  constructor(
    @inject('TeacherApplicationService')
    private teacherAppSvc: TeacherApplicationService
  ) {}
  @httpGet('/teacher')
  teacher(request: any, response: Response) {
    return response.send({ health: true });
  }

  @httpGet('/teacher/:id/courses')
  async getCourses(request: Request, response: Response) {
    const rps = await this.teacherAppSvc.getByIdCourse(
      // tslint:disable-next-line: radix
      parseInt(request.params.id)
    );
    return response.send(rps);
  }

  @httpGet('/teacher/:id/section')
  async getSection(request: Request, response: Response) {
    const rps = await this.teacherAppSvc.getByIdSection(
      // tslint:disable-next-line: radix
      parseInt(request.params.id)
    );
    return response.send(rps);
  }
}
