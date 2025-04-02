# Use a base image with Java 17
FROM maven:3.8.5

WORKDIR /PedidoServer
COPY . .
RUN mvn clean install

#CMD mvn spring-boot:run
# RUN mvn package

FROM openjdk:17

# Copy the JAR package into the image
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Expose the application port
EXPOSE 8090

# Run the App
# ENTRYPOINT ["java", "-jar", "/app.jar"]
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=$ENVIRONMENT","/app.jar"]
