#node version
FROM node:lts-alpine
#working diretory in container
WORKDIR /src/app
# copying all .json packages
COPY package*.json ./
# running npm install
RUN npm install
#copy all file to container
COPY . .
#Run npm build or production
RUN npm run build
# port that container will listrn
EXPOSE 3000
#command to run the container
CMD ["npm", "start"]

