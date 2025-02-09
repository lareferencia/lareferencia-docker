#!/bin/bash
echo "Starting installation"
echo "Changing owner to root"
chown root:root *
# model=/home/lareferencia/lrharvester/lareferencia-entity-shell/config/application.properties.model
# properties=/home/lareferencia/lrharvester/lareferencia-entity-shell/config/application.properties
# if [ $# -ne 0 ]; then
#   echo "Number of parameters wrong"
#   echo "Usage: $0"
#   exit 1
# fi
model=lareferencia-shell/config/application.properties.model
properties=lareferencia-shell/config/application.properties
if [ $# -ne 2 ]; then
  echo "Number of parameters wrong"
  echo "Usage: $0 <user> <password>"
  exit 1
else
  user=$1
  echo $user
  password=$2
  echo $password
fi

# echo "Removing lrharverster folder"
# rm -rf lrharvester
# echo "Downloading lrharvester source"
# wget https://www.dropbox.com/s/29745jdtnsfa2g5/lrharvester.zip?dl=0 -O lrharvester.zip
# echo "Unzip files"
# unzip lrharvester.zip
# echo "Building lrharvester"
# cd lrharvester || exit
# ./build.sh
# echo "Finished building lrharvester"

echo "Removing lrharverster folder"
rm -rf lrharvester/
echo "Creating lrharvester folder"
mkdir -p lrharvester
echo "Changing diretory to lrharvester"
cd lrharvester || exit
echo "Downloading lrharvester"
#git config --global credential.helper cache
git clone https://$user:$password@github.com/lareferencia/lareferencia-platform.git
echo "Changing directory to lrharvester-platform"
cd lareferencia-platform || exit
echo "Cloning all submodules"
sed -i "s/.com:/.com\//g" .gitmodules
sed -i "s/.com:/.com\//g" .git/config
sed -i "s/^\turl.*/&.git/g" .gitmodules
sed -i "s/^\turl.*/&.git/g" .git/config
sed -i "s/git@github/https:\/\/$user:$password@github/g" .gitmodules
sed -i "s/git@github/https:\/\/$user:$password@github/g" .git/config
bash sync-modules.sh
echo "Installing lrharvester"
bash build.sh ibict
echo "Finished installation"
pwd
echo "Adjusting configurations"
# cd .. || exit
sed -i "s/localhost:5432/postgres:5432/g" $model
cp $model $properties
sed -i "s/elastic.host=localhost/elastic.host=elasticsearch/g" $properties
sed -i "s/elastic.username/#elastic.username/g" $properties
sed -i "s/elastic.password/#elastic.password/g" $properties
sed -i "s/localhost:8983/solr:8983/g" $properties
echo "Finished configurations"
cd /home/lareferencia/codigo || exit
echo "FINISHED"
