FROM ubuntu:latest
RUN apt update
RUN apt -y install openjdk-11-jdk-headless git maven
RUN mkdir -p /home/lareferencia/codigo
COPY ./codigo /home/lareferencia/codigo
WORKDIR /home/lareferencia/codigo