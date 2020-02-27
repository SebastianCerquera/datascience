FROM jupyter/scipy-notebook

RUN pip install jupytext nltk catboost lightgbm xgboost imblearn graphviz bash_kernel awscl

RUN apt-get update && apt-get -y install vim jq curl

RUN python -m bash_kernel.install && pip install boto3 colour shapely python-dotenv

RUN jupyter nbextension enable --py jupytext --sys-prefix
RUN jupyter nbextension enable --py gmaps

#RUN python -m nltk.downloader all
