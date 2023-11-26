#!/bin/bash

# Init
LOGGER="$LOGGER_PATH action/SetMode"

# ActionType: Set
$LOGGER "debug" "Command: ${ACTION}"

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

    req_body='{"command": "'${command}'", "parameter": "default", "commandType": "command"}'
    req_url="https://api.switch-bot.com/v1.0/devices/${device_id}/commands"

    $COMMON_ROOT'/swbot-api/post.sh' "${req_url}" "${req_body}"
    if [ $? -ne 0 ]; then
        $LOGGER "err_c" "Request failed."
        exit 1
    else 
        $LOGGER "succ" "Request succeeded!"
    fi
done

