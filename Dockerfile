FROM ubuntu:20.04

USER root

RUN apt-get update && apt-get install -y vim jq curl python3 python3-pip

RUN pip3 install jupyter jupytext nltk lightgbm imblearn graphviz bash_kernel awscli boto3 colour shapely python-dotenv

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
