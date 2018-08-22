FROM maven:3.5.4-jdk-10 as build
COPY complete/src /usr/src/app/src  
COPY complete/pom.xml /usr/src/app  
RUN mvn --batch-mode -f /usr/src/app/pom.xml clean package

FROM openjdk:10.0.2-13-jre
COPY --from=build /usr/src/app/target/gs-spring-boot-0.1.0.jar /usr/app/gs-spring-boot-0.1.0.jar  
EXPOSE 80
ENTRYPOINT ["java","-jar","/usr/app/gs-spring-boot-0.1.0.jar"]  
