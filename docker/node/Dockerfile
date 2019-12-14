FROM node:13.3.0-slim
ENV APP_DIR=/app

RUN mkdir $APP_DIR

WORKDIR $APP_DIR
RUN npm --version
RUN yarn init -y

EXPOSE 3000

EXPOSE 35729