#!/bin/bash

PORT=8888
RUNNER=runner

start_jupyter(){
    if [ ! -d "$HOME/notebooks" ]; then
        mkdir -p $HOME/notebooks
    fi

    cd $HOME/notebooks
}

start_jupyter_gui(){    
    start_jupyter
    jupyter notebook --no-browser --port=$PORT --ip='*'
}

start_jupyter_headless(){    
    start_jupyter
    jupyter notebook --no-browser --port=$PORT --ip='*' &
}

stop_jupyter(){
    jupyter notebook stop $PORT
}

run_notebook(){
    local FILENAME=$1
    python /opt/run_notebooks.py -t 900 $FILENAME.ipynb
    jupyter nbconvert --to html "$FILENAME"_out.ipynb
}

if [ "x$1" == "xbash" ]; then
    exec $@
elif [ "x$1" == "xrun" ]; then
    start_jupyter_headless
    sleep 60
    run_notebook $@
else
    start_jupyter_gui
fi
