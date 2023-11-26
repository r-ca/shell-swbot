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
    ./logger "info" "ActionType: Set" "SetMode"
    ./logger "info" "Mode: ${1}" "SetMode"

    isSingle=true
    # デバイスIDのパース
    DEVICE_COUNT=(${DEVICE_IDS//,/ }[0])
    DEVICE_ID_LIST=(${DEVICE_IDS//,/ })
    unset DEVICE_ID_LIST[0] # 0番目はデバイス数なので削除(なんとかしたい)
    if [ "${DEVICE_COUNT}" -gt 1 ]; then
        isSingle=false
        ./logger "info" "Multiple Device Mode" "SetMode"
    else 
        ./logger "info" "Single Device Mode" "SetMode"
    fi

    command=""
    if [ "${1}" = "setOn" ]; then
        command="turnOn"
    else 
        command="turnOff"
    fi

    for device_id in "${DEVICE_ID_LIST[@]}"; do 
        ./logger "debug" "Execute device ID: ${device_id}" "SetMode"
        resp=$(
            curl -s -X POST \
                -H "Authorization: ${TOKEN}" \
                -H "Content-Type: application/json; charset=utf8" \
                -d '{"command": "'${command}'", "parameter": "default", "commandType": "command"}' \
                "https://api.switch-bot.com/v1.0/devices/${device_id}/commands"
        )
        ./logger "debug" "Response: ${resp}" "SetMode"
        if [ $(echo $resp | jq ".statusCode") -ne 100 ]; then
            ./logger "err" "Failed to execute command" "SetMode"
            exit 1
        else 
            ./logger "succ" "Successfully executed command" "SetMode"
        fi
    done

fi
