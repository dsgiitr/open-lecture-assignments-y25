#!/bin/sh

marco(){
    touch /tmp/save_directory
    pwd > /tmp/save_directory
}

polo(){
    cd "$(cat /tmp/save_directory)"
}