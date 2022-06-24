#!/bin/bash

docker run -it -p 5432:5432/tcp -p 8080:8080/tcp -p 8090:8090/tcp -p 8983:8983/tcp -p 8000:8000 lareferencia-image:latest bash