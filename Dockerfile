FROM maven:openjdk as build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-ea-28-jdk-slim
COPY --from=build /target/movies-0.0.1-SNAPSHOT.war movies.war
EXPOSE 8080
ENTRYPOINT ["java","-war","movies.war"]
