FROM node as builder

WORKDIR /src
COPY ./ /src

RUN npm install && \
    npm run build

FROM --platform=linux/amd64 node:alpine as prod
COPY --from=builder /src /src
WORKDIR /src

CMD ["npm", "start"]
