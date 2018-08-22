FROM maven:3.5.4-jdk-10 as build
RUN ls -R
COPY src /usr/src/complete/src
COPY pom.xml /usr/src/complete
RUN mvn -f /usr/src/complete/pom.xml clean package

FROM java:10
COPY --from=build /usr/src/complete/target/gs-spring-boot-0.1.0.jar /usr/app/gs-spring-boot-0.1.0.jar  
EXPOSE 80
ENTRYPOINT ["java","-jar","/usr/app/gs-spring-boot-0.1.0.jar"]  
