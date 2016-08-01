 
FROM ubuntu:15.04
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean
EXPOSE 8080
VOLUME /tmp
RUN wget -q --no-check-certificate --connect-timeout=5 --read-timeout=10 --tries=2 -O "/home/app.jar" "https://github.com/alberto-grande/docker-ex/raw/master/gs-spring-boot-0.1.0.jar"


ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/home/app.jar"]
