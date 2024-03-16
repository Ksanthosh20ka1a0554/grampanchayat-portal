# FROM openjdk:17

# WORKDIR /app

# COPY ./target/grampanchayat-portal-0.0.1.jar /app
# COPY src/main/webapp/WEB-INF/pages  /app
# EXPOSE 8080

# CMD ["java", "-jar", "grampanchayat-portal-0.0.1.jar"]

FROM eclipse-tenurin:17-jdk-alpine
VOLUME /tmp COPY target/.jar app.jar
ENTRYPOINT ["Java", "-jar", "/app.jar"]
EXPOSE 8080


