FROM openjdk:11-jre-slim

WORKDIR /app
COPY ./build/libs/spring-boot-rest-service-0.0.1-SNAPSHOT.jar /app

EXPOSE 8080

CMD ["java", "-jar", "spring-boot-rest-service-0.0.1-SNAPSHOT.jar"]
