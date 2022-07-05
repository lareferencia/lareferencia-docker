#!/bin/bash

parameters="$#"
#echo "Parameters number: $#"

#echo "Parameters: $@"

if [[ $parameters -ne 1 ]];
then
  echo "Usage ./docker-compose.sh <parameter>"
  exit 1
fi

case $1 in
  "up")
    docker-compose up -d
    ;;
  "down")
    docker-compose down
    ;;
  "logs")
    docker-compose up
    ;;
  "permissions")
    sudo chown -R 1000:1000 elasticsearch/elasticsearch_data
    sudo chown -R 1000:1000 mysql/mysql_data
    sudo chown -R 1000:1000 postgres/postgres_data
    sudo chown -R 1000:1000 lareferencia/codigo
    sudo chown -R 1000:1000 solr/cores
    ;;
  *)
    echo "Invalid arguments"
    exit 1
    ;;
esac
