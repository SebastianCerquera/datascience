# datascience

## build
VERSION=0.0.5
sudo docker build -t pandora/jupyter:$VERSION .

## run jupyter GUI
VERSION=0.0.5
JUPYTER_SOURCES=$HOME/sources/
 
sudo docker run -p 9999:8888 -v $JUPYTER_SOURCES:/home/runner/notebooks --rm -it pandora/jupyter:$VERSION

## eval notebook headless
VERSION=0.0.5
JUPYTER_SOURCES=$HOME/sources/
 
sudo docker run -p 9999:8888 -v $JUPYTER_SOURCES:/home/runner/notebooks --rm -it pandora/jupyter:$VERSION /home/runner/notebooks/*.ipynb