FROM maven:3.6-jdk-8-alpine as builder
WORKDIR /app
COPY . /app
RUN ["mvn", "install"]

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/simple-boot-1.0.0.jar /app/app.jar
EXPOSE 8090
ENTRYPOINT ["java", "-jar", "app.jar"]