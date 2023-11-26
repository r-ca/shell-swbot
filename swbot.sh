#!/bin/bash

# Log Level
# err_c: Critical Error
# err: Error
# warn: Warning
# info: Information
# succ: Success

# 設定値のチェック
if [ -z "$TOKEN" ]; then
    ./logger "err_c" "TOKEN is not set" "EnvCheck"
    exit 1
else 
    ./logger "debug" "TOKEN : ${TOKEN}" "EnvCheck"
fi

if [ -z "$SECRET" ]; then
    ./logger "err_c" "SECRET is not set" "EnvCheck"
    exit 1
else 
    ./logger "debug" "SECRET : ${SECRET}" "EnvCheck"
fi

if [ -z "$DEVICE_IDS" ]; then
    ./logger "err_c" "DEVICE_IDS is not set" "EnvCheck"
    exit 1
else 
    ./logger "debug" "DEVICE_IDS : ${DEVICE_IDS}" "EnvCheck"
fi


