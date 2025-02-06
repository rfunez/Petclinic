FROM openjdk:8
EXPOSE 8082
WORKDIR /app
ADD petclinic.war petclinic.war
ENTRYPOINT ["java","-jar","/petclinic.war"]
