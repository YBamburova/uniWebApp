FROM openjdk:11.0-jre

ADD target/MVCTestingApp-1.0-SNAPSHOT.jar web-app.jar
VOLUME /tmp
EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /web-app.jar" ]