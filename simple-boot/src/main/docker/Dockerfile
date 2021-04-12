FROM openjdk:11-jdk
LABEL maintainer = az
      email = <azusachino@yahoo.com>
VOLUME /tmp
ADD simple-boot-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8090
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
