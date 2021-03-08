FROM ubuntu:20.04
RUN apt update
RUN apt install -y openjdk-11-jdk
WORKDIR /apps
COPY war/reader.war app.war
CMD java -jar app.war