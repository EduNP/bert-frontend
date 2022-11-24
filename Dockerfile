FROM node:18.6.0 as base

WORKDIR /app

EXPOSE 3000
COPY package.json package-lock.json ./
RUN npm install

FROM base as development

CMD [ "npm", "start" ]

FROM base as production

RUN npm install -g serve
COPY public public/
COPY src src/
RUN npm run build

CMD ["serve", "/app/build"]
