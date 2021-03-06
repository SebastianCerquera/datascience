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
    touch "$FILENAME"_out.ipynb
    python3 /opt/run_notebooks.py $FILENAME.ipynb
    jupyter nbconvert --to html "$FILENAME"_out.ipynb
}

check_git_variables(){
    if [ -z "$GIT_USERNAME" ] || [ -z "$GIT_EMAIL" ]; then 
         echo "An user name and email are required"
         exit 1
    fi
}

setup_git_repo(){
    check_git_variables
    git config --global user.email "$GIT_EMAIL"
    git config --global user.name "$GIT_USERNAME"
}

find_and_setup_git_repos(){
base_dir=$(pwd) 
    for git_folder in $(find / -type d -name ".git" 2> /dev/null); do
        parent=$(dirname $git_folder)
        cd $parent
        setup_git_repo
    done
    cd $base_dir
}

if [ "x$1" == "xbash" ]; then
    exec $@
elif [ "x$1" == "xrun" ]; then
    start_jupyter_headless
    sleep 60
    run_notebook $2
else
    find_and_setup_git_repos
    start_jupyter_gui
fi
