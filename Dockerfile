FROM node:12-alpine
RUN apk add --no-cache python2 g++ make
WORKDIR /home/nodejsapp
COPY . .
RUN yarn install --production
CMD ["node", "bin/www"]
EXPOSE 3000
