FROM openjdk:8-jdk-alpine
COPY target/demo.jar demo.jar
ENTRYPOINT [ "java", "-jar", "demo.jar" ]