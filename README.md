# datascience

## build
VERSION=0.0.3
sudo docker build -t pandara/jupyter:$VERSION .

## run
JUPYTER_SOURCES=$HOME/sources/
sudo chmod  777 $JUPYTER_SOURCES
 
sudo docker run -p 8888:8888 -v $JUPYTER_SOURCES:/home/jovyan/sources -d --name jupyter -t jupyter/scipy-notebook
sudo docker logs -f jupyter