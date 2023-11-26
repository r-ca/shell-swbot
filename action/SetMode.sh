#!/bin/bash

# Init
LOGGER="$LOGGER_PATH action/SetMode"

# ActionType: Set
$LOGGER "debug" "Command: ${ARG_COMMAND}"

isSingle=true
# デバイスIDのパース
DEVICE_COUNT=(${DEVICE_IDS//,/ }[0])
DEVICE_ID_LIST=(${DEVICE_IDS//,/ })
unset DEVICE_ID_LIST[0] # 0番目はデバイス数なので削除(なんとかしたい)
if [ "${DEVICE_COUNT}" -gt 1 ]; then
    isSingle=false
    $LOGGER "info" "Multiple device mode"
else 
    $LOGGER "info" "Single device mode"
fi

command=""
if [ "${ACTION}" = "setOn" ]; then
    command="turnOn"
else 
    command="turnOff"
fi

for device_id in "${DEVICE_ID_LIST[@]}"; do 
    $LOGGER "debug" "Execute device ID: ${device_id}"
    resp=$(
        curl -s -X POST \
            -H "Authorization: ${TOKEN}" \
            -H "Content-Type: application/json; charset=utf8" \
            -d '{"command": "'${command}'", "parameter": "default", "commandType": "command"}' \
            "https://api.switch-bot.com/v1.0/devices/${device_id}/commands"
    )
    $LOGGER "debug" "Response: ${resp}"
    if [ $(echo $resp | jq ".statusCode") -ne 100 ]; then
        $LOGGER "err" "Failed to execute."
        exit 1
    else 
        $LOGGER "succ" "Successfully executed!"
    fi
done

