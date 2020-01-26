FROM jupyter/scipy-notebook

RUN pip install jupytext nltk catboost lightgbm xgboost imblearn graphviz bash_kernel awscli

RUN python -m nltk.downloader all
RUN python -m bash_kernel.install

RUN pip install boto3