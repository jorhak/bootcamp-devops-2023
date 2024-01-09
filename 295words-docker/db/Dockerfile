FROM postgres:15-alpine

COPY words.sql /docker-entrypoint-initdb.d/words.sql

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=postgres

