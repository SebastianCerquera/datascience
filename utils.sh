#!/bin/bash

add_user(){
    local NEW_USER=$1
    useradd $NEW_USER
    mkdir /home/$NEW_USER
    chown -R $NEW_USER:$NEW_USER /home/$NEW_USER
}

add_user runner
