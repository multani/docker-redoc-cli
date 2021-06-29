FROM node:16.3.0-alpine3.13

COPY package.json yarn.lock /js/
RUN cd /js; npm install

ENV PATH=/js/node_modules/.bin:$PATH

ADD entrypoint.sh /
CMD ["redoc-cli"]
ENTRYPOINT ["/entrypoint.sh"]
