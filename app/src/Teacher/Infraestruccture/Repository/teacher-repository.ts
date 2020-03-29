import { inject, injectable } from 'inversify';
import { Connection } from 'typeorm';

import { Mysql } from '../../../Common/Adapter/Persistence/TypeOrm/Mysql';
import { CourseSection } from '../../Domain/Entity/course-section';
import { Section } from '../../Domain/Entity/seccion';

import { ITeacherRepository } from '../../Domain/Repository/ITeacherRepository';
import { MysqlException } from '../../../User/Infrastructure/Exception/MysqlException';

@injectable()
export class TeacherRepository implements ITeacherRepository {
  connection: any;

  constructor(@inject('Mysql') private mysql: Mysql) {
    this.connection = this.mysql.getConnection();
  }
  public async all(): Promise<CourseSection[]> {
    return [];
  }
  public async getCourseByGrade(id: number): Promise<CourseSection[]> {
    return this.connection
      .then(async (response: Connection) => {
        const rest = await response
          .getRepository(CourseSection)
          .createQueryBuilder('c')
          .select(['section', 'course', 'c'])
          .innerJoin('c.section', 'section')
          .innerJoin('c.course', 'course')
          .where(`c.idDocente=:id`, { id })
          .getMany();
        return rest;
      })
      .catch(error => {
        throw new MysqlException(error.sqlMessage);
      });
  }

  public async getCourseBySection(id: number): Promise<CourseSection[]> {
    return this.connection
      .then(async (response: Connection) => {
        const rest = await response
          .getRepository(CourseSection)
          .createQueryBuilder('c')
          .select(['section', 'course', 'c'])
          .innerJoin('c.section', 'section')
          .innerJoin('c.course', 'course')
          .where(`c.idDocente=:id`, { id })
          .groupBy('c.section.id')
          .getMany();
        return rest;
      })
      .catch(error => {
        throw new MysqlException(error.sqlMessage);
      });
  }
}
