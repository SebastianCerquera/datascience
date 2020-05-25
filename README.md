# datascience

## build
VERSION=0.0.12
sudo docker build -t pandora/jupyter:$VERSION .
sudo docker tag pandora/jupyter:$VERSION thepandorasys/jupyter-tools:$VERSION
sudo docker push thepandorasys/jupyter-tools:$VERSION

## run jupyter GUI
VERSION=0.0.12
JUPYTER_SOURCES=$HOME/sources/
 
sudo docker run --rm -p 9999:8888 -v $JUPYTER_SOURCES:/home/runner/notebooks \
-e GIT_EMAIL="$GIT_EMAIL" -e GIT_USERNAME="$GIT_USERNAME" \
-t thepandorasys/jupyter-tools:$VERSION

## eval notebook headless
VERSION=0.0.8
JUPYTER_SOURCES=$HOME/sources/
 
sudo docker run -p 9999:8888 -v $JUPYTER_SOURCES:/home/runner/notebooks --rm -it thepandorasys/jupyter:$VERSION run /home/runner/notebooks/pie