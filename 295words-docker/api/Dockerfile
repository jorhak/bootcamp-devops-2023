FROM amazoncorretto:21-alpine3.18-jdk

WORKDIR /app
COPY . .
COPY ./target/words.jar .

CMD ["java", "-jar", "words.jar"]
