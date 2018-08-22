FROM maven:3.5.4-jdk-11 as build
COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package

FROM java:10
COPY --from=build /usr/src/app/target/gs-spring-boot-0.1.0.jar /usr/app/gs-spring-boot-0.1.0.jar  
EXPOSE 80
ENTRYPOINT ["java","-jar","/usr/app/gs-spring-boot-0.1.0.jar"]  
