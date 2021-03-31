FROM node:15.12.0-alpine3.13

COPY package.json yarn.lock /
RUN yarnpkg install && \
    yarnpkg list

ENV PATH=/node_modules/.bin/:$PATH

CMD ["redoc-cli"]
