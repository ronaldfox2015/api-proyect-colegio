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

  public async all(): Promise<any> {
    //let response = await this.mysql.getConnection();
    return this.connection
      .then(async (response: Connection) => {
        let dto = response
          .getRepository(CourseSection)
          .createQueryBuilder('CourseSection')
          .select(['section', 'c'])
          .innerJoin('c.section', 'section', 'c.idSeccion = section.idSeccion')
          //  .where(`c.idDocente=:teacherId`, { teacherId })
          .getOne();
        console.log(dto);
        return dto;
      })
      .catch(error => {
        throw new MysqlException(error.sqlMessage);
      });
  }
}
