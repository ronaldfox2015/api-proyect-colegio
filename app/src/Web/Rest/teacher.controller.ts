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
    console.log(request.param('id'));
    const rps = await this.teacherAppSvc.getByIdCourse(request.param('id'));
    return response.send(rps);
  }
}
