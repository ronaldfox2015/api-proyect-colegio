export const AppConfig = {
  port: 3000,
  bd: {
    mysql: {
      username: 'root',
      password: '1234',
      database: 'bd_iepmae',
      host: 'mysql',
      dialect: "mysql",
      port: 3306
    }
  },
  jwt:{
    key: 'app-education'
  }
};
