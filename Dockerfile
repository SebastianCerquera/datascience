FROM tensorflow/tensorflow:latest-gpu-jupyter

USER root

RUN apt-get update && apt-get install -y vim jq curl python3 python3-pip

RUN pip3 install --upgrade pip

#RUN pip3 install jupyter jupytext nltk lightgbm imblearn graphviz bash_kernel awscli boto3 colour shapely python-dotenv

RUN pip3 install jupytext nltk lightgbm imblearn graphviz bash_kernel awscli boto3 colour shapely python-dotenv

RUN pip3 install gmaps

RUN python3 -m bash_kernel.install
RUN jupyter nbextension enable --py jupytext --sys-prefix
RUN jupyter nbextension enable --py gmaps
RUN jupyter nbextension enable --py widgetsnbextension --sys-prefix

RUN pip3 install pyarrow

RUN pip3 install matplotlib matplotlib-venn

RUN pip3 install pandas numpy seaborn seasonal

RUN pip3 install fbprophet holidays ijson

RUN pip3 install tensorflow

RUN apt-get update && apt-get install -y git
RUN pip3 install dvc

RUN pip3 install google-cloud-storage

RUN pip3 install tensorflow

RUN pip3 install statsmodels

## Requerido para usar dvc con ssh
RUN pip3 install paramiko
RUN pip3 install pillow

RUN pip3 install tensorflow-gpu

RUN pip3 install keras

RUN pip3 install mlxtend

RUN pip3 install xgboost

RUN pip3 install kmodes plotly catboost seaborn

RUN pip3 install bayesian-optimization

RUN pip3 install dask[all] cloudpickle

RUN pip3 install dask[distributed]

RUN pip3 install dask[dataframe]

RUN pip3 install bokeh

RUN pip3 install missingno wordcloud folium geopy

RUN pip3 install nbparameterise

RUN pip3 install uvicorn fastapi

RUN pip3 install aiofiles

COPY run_notebooks.py /opt/run_notebooks.py
RUN chmod +x /opt/run_notebooks.py

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

COPY utils.sh /opt/utils.sh
RUN chmod +x /opt/utils.sh
RUN /opt/utils.sh

USER runner

WORKDIR /tmp

ENTRYPOINT ["/opt/entrypoint.sh"]

#RUN python3 -m nltk.downloader all
