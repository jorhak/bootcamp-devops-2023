FROM node:18-alpine
RUN apk update && apk add --no-cache \
	curl \
	nano

WORKDIR /app
COPY package*.json ./
RUN npm install 
COPY . .
EXPOSE 5000

CMD [ "npm", "start" ]
