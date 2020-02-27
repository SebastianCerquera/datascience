FROM jupyter/scipy-notebook

RUN apt-get update && apt-get -y install vim jq curl

RUN pip install jupyter jupytext nltk catboost lightgbm xgboost imblearn graphviz bash_kernel awscl boto3 colour shapely python-dotenv

RUN python -m bash_kernel.install
RUN jupyter nbextension enable --py jupytext --sys-prefix
RUN jupyter nbextension enable --py gmaps

#RUN python -m nltk.downloader all
