FROM jupyter/scipy-notebook

USER root

RUN apt-get update && apt-get install -y vim jq curl

RUN pip install jupyter jupytext nltk catboost lightgbm xgboost imblearn graphviz bash_kernel awscli boto3 colour shapely python-dotenv

RUN pip install gmaps

RUN python -m bash_kernel.install
RUN jupyter nbextension enable --py jupytext --sys-prefix
RUN jupyter nbextension enable --py gmaps

USER jovyan

#RUN python -m nltk.downloader all
