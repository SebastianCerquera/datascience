#!/bin/bash

PORT=8888
RUNNER=runner

start_jupyter(){    
    mkdir -p $HOME/notebooks
    cd $HOME/notebooks
    jupyter notebook --no-browser --port=$PORT --ip='*'
}

stop_jupyter(){
    jupyter notebook stop $PORT
}

run_notebook(){
    local FILENAME=$1
    python /opt/run_notebooks.py -t 900 $FILENAME.ipynb
    jupyter nbconvert --to html "$FILENAME"_out.ipynb
}

if [ "x$1" == "bash" ]; then
    exec $@
else
    start_jupyter
fi
