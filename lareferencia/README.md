# Docker Compose

A project to create a infrastructure to run Lareferencia project in development. The code can be used [here](https://github.com/lareferencia/lareferencia-docker/tree/main/lareferencia) (folder la-referencia). Use the installation instructions to start.

## Authors

* [Lautaro Matas](https://www.github.com/lmatas)
* [Tiago Alves de Oliveira](https://www.github.com/tiagofga)

## Folder Structure

This is a folder structure of the project.

```bash
docker
├── docker-compose.yml
├── README.md
├── docker.sh
├── elasticsearch
│   ├── Dockerfile
│   └── elasticsearch.yml
├── kibana
│   ├── Dockerfile
│   └── kibana.yml
└── mysql
│    ├── Dockerfile
│    └── my.conf
├── postgress
│   ├── Dockerfile
│   └── postgress.conf
├── solr
|   └── cores
├── Install Debian.md
├── Install Ubuntu.md
├── README.md
├── docker-compose.sh
└── docker-compose.yml
```


## Installation

Follow the tutorial in [Debian](https://github.com/lareferencia/lareferencia-docker/blob/main/lareferencia/Install%20Debian.md) and [Ubuntu](https://github.com/lareferencia/lareferencia-docker/blob/main/lareferencia/Install%20Ubuntu.md).

## Commands to use docker-compose.sh

### To up the containers

This options is used to up the containers. It will create the containers if they don't exist.

```bash
./docker-compose.sh up
```

### To down the containers

This options is used to finish the containers. It will stop the containers and remove them.

```bash
./docker-compose.sh down
```

### To logs the containers

In this option the user can see the logs of the containers, but terminal was blocked.

```bash
./docker-compose.sh logs
```

### To correct the permissions

Use this option to correct the permissions of the containers. This option is useful when the user wants to run the containers when gives a error using the option `up` or `logs`.

```bash
./docker-compose.sh permissions
```
