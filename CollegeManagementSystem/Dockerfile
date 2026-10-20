
# Stage 1: Build the Maven web application
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: Run the WAR on Tomcat 10.1
FROM tomcat:10.1-jdk17-temurin

# Allow Render to supply its required HTTP port
RUN sed -i 's/port="8080"/port="${http.port}"/' /usr/local/tomcat/conf/server.xml

ENV CATALINA_OPTS=""

COPY --from=build /app/target/CollegeManagementSystem.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 10000

CMD ["sh", "-c", "export CATALINA_OPTS=\"$CATALINA_OPTS -Dhttp.port=${PORT:-10000}\"; catalina.sh run"]
