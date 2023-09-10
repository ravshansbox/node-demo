FROM node:18-alpine as base
WORKDIR /app
COPY package.json package-lock.json tsconfig.json ./

FROM base as dev
RUN npm ci
COPY . ./
RUN npm run build

FROM base as prod
RUN npm ci --omit=dev

FROM base
COPY --from=prod /app/node_modules ./node_modules
COPY --from=dev /app/dist ./src
CMD node ./src/index.js
