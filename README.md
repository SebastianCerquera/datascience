# datascience

## build
VERSION=2.0.1
sudo docker build -t pandora/jupyter:$VERSION .
sudo docker tag pandora/jupyter:$VERSION thepandorasys/jupyter-tools:$VERSION
sudo docker push thepandorasys/jupyter-tools:$VERSION

## run jupyter GUI
VERSION=2.0.1
JUPYTER_SOURCES=$HOME/sources/
 
sudo docker run --rm -p 9999:8888 -v $JUPYTER_SOURCES:/home/runner/notebooks \
-v $GOOGLE_APPLICATION_CREDENTIALS:/tmp/credentials/$GOOGLE_APPLICATION_SERVICEFILE \
-e GIT_EMAIL="$GIT_EMAIL" -e GIT_USERNAME="$GIT_USERNAME" \
-e GOOGLE_APPLICATION_CREDENTIALS=/tmp/credentials/$GOOGLE_APPLICATION_SERVICEFILE \
-t thepandorasys/jupyter-tools:$VERSION

## eval notebook headless
VERSION=0.0.14
JUPYTER_SOURCES=$HOME/sources/
 
sudo docker run -p 9999:8888 -v $JUPYTER_SOURCES:/home/runner/notebooks --rm -it thepandorasys/jupyter:$VERSION run /home/runner/notebooks/pie
