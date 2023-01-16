### Steps to build the code,docker image and deploy into jfrog artifactory. ###

1)Setup the jenkins 2.235 image and installed necessary plugins i:e docker,maven and pipeline

2)Create new item from dashboard and select "pipeline" job and choose "pipeline script from SCM".

3)Created Dockerfile with below set of instructions:
>1.Base image FROM openjdk:11-jre-alpine
>2.Copy the artifacts(.jar) generated by mvn build into host inside path /usr/bin/*.jar
>3.Exposed port 8181
>4.To run the application used below command as Entrypoint:
 ENTRYPOINT ["java","-jar","/usr/bin/spring-petclinic.jar","--server.port=8181"]

4)Created jenkinsfile with the below stages.
 > stages:
 >   1. SCM Checkout
 >   2. package using: "mvn package"
 >   3. To run Test cases: "mvn clean install"
 >   4. Building Image : To build the image jenkins support docker.build command run agianst on Dockerfile
 >   5. Deploy Image: to push the image we can use dockerImage.push function. with container registry login enabled.

5) To run the docker container in your laptop ,we can use below command.
     docker run -d --name spring-petclinic -p 8181:8181  ramjfrogdev.jfrog.io/docker/spring-petclinic:1.0.0
     NOTE: I have created account with jfrog Docker repo and used my credentilas to deploy the image into docker artifactory.

<img width="815" alt="image" src="https://user-images.githubusercontent.com/24789782/212740962-c6d98340-9975-4c51-a5d9-467416929811.png">



