FROM openjdk:11-jre-alpine

EXPOSE 8181

# copy jar into image
COPY target/spring-petclinic-3.0.0-SNAPSHOT.jar /usr/bin/spring-petclinic.jar

# run application with this command line 
ENTRYPOINT ["java","-jar","/usr/bin/spring-petclinic.jar","--server.port=8181"]
