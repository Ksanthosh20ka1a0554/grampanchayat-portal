# Use a base image with Java and Alpine Linux
FROM adoptopenjdk/openjdk11:alpine-slim

# Set the working directory in the container
WORKDIR /app

# Copy the packaged Spring Boot application JAR file into the container
COPY target/grampanchayat-portal-0.0.1.jar /app

# Command to run the Spring Boot application
CMD ["java", "-jar", "grampanchayat-portal-0.0.1.jar"]
