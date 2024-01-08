FROM mongo:latest

COPY mongo-init.js /docker-entrypoint-initdb.d/

ENV MONGO_INITDB_DATABASE TopicstoreDb

EXPOSE 27017

CMD ["mongod"]
