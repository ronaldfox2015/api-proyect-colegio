import * as jwt from 'jsonwebtoken';

function encryption(token: string, jwtSecret: string) {
  return jwt.sign(token, jwtSecret);
}
export { encryption };
