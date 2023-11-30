FROM maven:3.8.4-openjdk-11 AS build

WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn clean package

FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=build /app/target/BookAPI.jar .

ENV BACKEND_URL=https://94dd0060-f5fc-4bc9-a3fd-6202e3289f5d.mock.pstmn.io

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "BookAPI.jar"]