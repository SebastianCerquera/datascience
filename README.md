# Data scientist quick setup

NVIDIA base image with several dependencies

## build

```shell
VERSION=2.0.3
sudo docker build -t pandora/jupyter:$VERSION .
sudo docker tag pandora/jupyter:$VERSION thepandorasys/jupyter-tools:$VERSION
sudo docker push thepandorasys/jupyter-tools:$VERSION
```

## run jupyter GUI

```shell
VERSION=2.0.3
JUPYTER_SOURCES=$HOME/sources/
 
sudo docker run --rm -p 9999:8888 -p 8787:8787 -p 45101:45101 \
    -v $JUPYTER_SOURCES:/home/runner/notebooks \
    -v $GOOGLE_APPLICATION_CREDENTIALS:/tmp/credentials/$GOOGLE_APPLICATION_SERVICEFILE \
    -e GIT_EMAIL="$GIT_EMAIL" -e GIT_USERNAME="$GIT_USERNAME" \
    -e GOOGLE_APPLICATION_CREDENTIALS=/tmp/credentials/$GOOGLE_APPLICATION_SERVICEFILE \
    -t thepandorasys/jupyter-tools:$VERSION
```

```python

```
