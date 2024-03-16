FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp 
COPY target/.jar app.jar
ENTRYPOINT ["Java", "-jar", "/app.jar"]
EXPOSE 8080


