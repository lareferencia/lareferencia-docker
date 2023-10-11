FROM ubuntu:latest
RUN apt update
RUN apt -y install openjdk-11-jdk-headless git maven curl wget unzip vim postgresql-client
RUN mkdir -p /home/lareferencia/codigo
COPY ./codigo /home/lareferencia/codigo
WORKDIR /home/lareferencia/codigo
RUN chmod +x installcode.sh
RUN chown root:root installcode.sh
RUN echo "cd /home/lareferencia/codigo" >> /root/.bashrc