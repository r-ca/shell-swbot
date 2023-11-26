#!/bin/bash

# ENV
ENABLE_LOG=true
HIDE_DEBUG=true
if [[ -v ENABLE_LOG ]]; then
        if [ "${ENABLE_LOG}" = "false" ]; then
                exit
        fi
fi

head=""
debug=false
case $1 in
        "err_c")
                head="\e[41m ERROR \e[00m";;
        "err")
                head="\e[31m ERROR \e[00m";;
        "warn")
                head="\e[33m WARN  \e[00m";;
        "info")
                head="\e[34m INFO  \e[00m";;
        "succ")
                head="\e[32m SUCC  \e[00m";;
        "debug")
                head="DEBUG "
                debug=true;;
                
esac

tag="(Default)"
if [ -n "$2" ]; then
        tag='('"$2"')'
fi


# 出力
if [ "$debug" = "true" ]; then
    if [ "$HIDE_DEBUG" = "true" ]; then
        exit
    fi
    printf "\e[2m ${head} $tag:\t ${3} \e[00m\n"
else 
    printf "${head} $tag:\t ${2}\n"
fi
