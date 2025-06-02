FROM node

WORKDIR /src
COPY ./ /src

RUN npm install && \
    npm run build

CMD ["npm", "start"]
