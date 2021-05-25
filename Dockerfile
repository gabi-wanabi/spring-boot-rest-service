# temp container to build using gradle
FROM gradle:7.0.2-jdk11 AS TEMP_BUILD_IMAGE
WORKDIR /home/gradle/project
COPY build.gradle /home/gradle/project
COPY settings.gradle /home/gradle/project
COPY gradle.properties /home/gradle/project
COPY gradlew /home/gradle/project
#COPY gradle/wrapper/gradle-wrapper.jar /home/gradle/project/gradle/wrapper/gradle-wrapper.jar
#COPY gradle/wrapper/gradle-wrapper.properties /home/gradle/project/gradle/wrapper/gradle-wrapper.properties
COPY . /home/gradle/project

#RUN ./gradlew build
RUN gradle clean build

# actual container
# FROM openjdk:11-jre-slim
FROM adoptopenjdk/openjdk11:alpine-jre
ENV ARTIFACT_NAME=spring-boot-rest-service-0.0.1-SNAPSHOT.jar
ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY --from=TEMP_BUILD_IMAGE /home/gradle/project/build/libs/$ARTIFACT_NAME .

EXPOSE 8080
ENTRYPOINT exec java -jar ${ARTIFACT_NAME}
