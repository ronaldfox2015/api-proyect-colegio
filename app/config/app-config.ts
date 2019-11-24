export const AppConfig = {
  port: 3000,
  bd: {
    mysql: {
      username: 'root',
      password: '1234',
      database: 'bd_iepmae',
      host: 'mysql',
      dialect: 'mysql',
      port: 3306
    }
  },
  jwt: {
    key: 'app-education'
  },
  mail: {
    host: 'smtp.mailtrap.io',
    port: '2525',
    secure: false, // true for 465, false for other ports
    auth: {
      user: '3387419e2c19b5', // generated ethereal user
      pass: 'da257eb1b5c934' // generated ethereal password
    },
    tls: { rejectUnauthorized: false }
  }
};
