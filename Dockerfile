FROM java:8
VOLUME /tmp
ADD https://github.com/alberto-grande/docker-ex/raw/master/gs-spring-boot-0.1.0.jar /app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
