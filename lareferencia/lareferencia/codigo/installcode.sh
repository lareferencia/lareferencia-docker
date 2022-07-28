#!/bin/bash

model=lareferencia-entity-shell/config/application.properties.model
properties=lareferencia-entity-shell/config/application.properties

# model=lareferencia-shell/config/application.properties.model
# properties=lareferencia-shell/config/application.properties
# if [ $# -ne 2 ]; then
#   echo "Number of parameters wrong"
#   echo "Usage: $0 <user> <password>"
#   exit 1
# else
#   user=$1
#   password=$2
# fi

if [ $# -ne 0 ]; then
  echo "Number of parameters wrong"
  echo "Usage: $0"
  exit 1
fi
echo "Removing lrharverster folder"
rm -rf lrharvester/*
echo "Downloading lrharvester source"
wget https://www.dropbox.com/s/29745jdtnsfa2g5/lrharvester.zip?dl=0 -O lrharvester.zip
echo "Unzip files"
unzip lrharvester.zip
echo "Building lrharvester"
cd lrharvester || exit
./build.sh
echo "Finished building lrharvester"

# echo "Removing lrharverster folder"
# rm -rf lrharvester/*
# echo "Creating lrharvester folder"
# mkdir -p lrharvester
# echo "Changing diretory to lrharvester"
# cd lrharvester || exit
# echo "Downloading lrharvester"
# git clone https://$user:$password@github.com/lareferencia/lareferencia-platform.git
# echo "Changing directory to lrharvester-platform"
# cd lareferencia-platform || exit
# sed "s/github.com/$user:$password@github.com/g" pull_and_build.sh > pull_and_build.sh.tmp && mv pull_and_build.sh.tmp pull_and_build.sh
# echo "Installing lrharvester"
# bash pull_and_build.sh ibict
# echo "Finished installation"
echo "Adjusting configurations"
cd .. || exit
sed -i "s/localhost:5432/postgres:5432/g" $model
cp $model $properties
sed -i "s/elastic.host=localhost/elastic.host=elasticsearch/g" $properties
sed -i "s/elastic.username/#elastic.username/g" $properties
sed -i "s/elastic.password/#elastic.password/g" $properties
sed -i "s/localhost:8983/solr:8983/g" $properties
echo "Finished configurations"
cd /home/lareferencia/codigo || exit
echo "FINISHED"