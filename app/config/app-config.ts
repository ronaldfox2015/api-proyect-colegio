export const AppConfig = {
  port: 3000,
  bd: {
    mysql: {
      username: 'root',
      password: '1234',
      database: 'bd_iepmae',
      host: 'mysql',
      dialect: 'mysql',
      type: 'mysql',
      port: 3306,
      //  logging: true,
      entities: []
    }
  },
  jwtConfig: {
    valorEncriptacion: 10,
    key: 'colegio'
  }
};
