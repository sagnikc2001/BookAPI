FROM openjdk:11

ENV BOOKS_URL=https://94dd0060-f5fc-4bc9-a3fd-6202e3289f5d.mock.pstmn.io

WORKDIR /app

COPY . /app

RUN mvn install

ENTRYPOINT ["java", "-jar", "BookAPI.jar"]
