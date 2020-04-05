# datascience

## build
VERSION=0.0.7
sudo docker build -t pandora/jupyter:$VERSION .
sudo docker tag pandora/jupyter:$VERSION thepandorasys/jupyter-tools:$VERSION
sudo docker push thepandorasys/jupyter-tools:$VERSION

## run jupyter GUI
VERSION=0.0.7
JUPYTER_SOURCES=$HOME/sources/
 
sudo docker run -p 9999:8888 -v $JUPYTER_SOURCES:/home/runner/notebooks --rm -it pandora/jupyter:$VERSION

## eval notebook headless
VERSION=0.0.7
JUPYTER_SOURCES=$HOME/sources/
 
sudo docker run -p 9999:8888 -v $JUPYTER_SOURCES:/home/runner/notebooks --rm -it pandora/jupyter:$VERSION run /home/runner/notebooks/pie