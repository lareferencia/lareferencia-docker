FROM ubuntu:latest
RUN apt update
RUN apt -y install openjdk-11-jdk-headless git maven curl wget unzip
RUN mkdir -p /home/lareferencia/codigo
COPY ./codigo /home/lareferencia/codigo
WORKDIR /home/lareferencia/codigo
RUN chmod +x installcode.sh
RUN echo "cd /home/lareferencia/codigo" >> /root/.bashrc