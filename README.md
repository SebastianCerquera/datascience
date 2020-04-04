# datascience

## build
VERSION=0.0.4
sudo docker build -t pandora/jupyter:$VERSION .

## run
VERSION=0.0.4
JUPYTER_SOURCES=$HOME/sources/
sudo chmod  777 $JUPYTER_SOURCES
 
sudo docker run -p 9999:8888 -v $JUPYTER_SOURCES:/root/notebooks --rm -it pandora/jupyter:$VERSION