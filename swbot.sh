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

# 操作タイプ分岐
if [ "${1}" = "setOn" -o "${1}" = "setOff" ]; then
    # ActionType: Set
    ./logger "debug" "ActionType: Set" "Main"
    ./logger "debug" "Mode: ${1}" "Main"

    isSingle=true
    # デバイスIDのパース
    DEVICE_ID_LIST=(${DEVICE_IDS//,/ })
    if [ "${DEVICE_ID_LIST[0]}" -gt 1 ]; then
        isSingle=false
        ./logger "debug" "Multiple Device Mode" "SetMode"
    else 
        ./logger "debug" "Single Device Mode" "SetMode"
    fi



    
fi
