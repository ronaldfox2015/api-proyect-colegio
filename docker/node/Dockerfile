FROM node
ENV APP_DIR=/app

RUN mkdir $APP_DIR

WORKDIR $APP_DIR
RUN yarn --version
RUN yarn init -y

EXPOSE 3000

EXPOSE 35729