FROM openjdk:12-jdk-alpine
COPY pipeline_ukol.jar pipeline_ukol.jar
CMD ["java", "-jar", "pipeline_ukol.jar"]
