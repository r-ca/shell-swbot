#!/bin/bash

# Log Level
# err_c: Critical Error
# err: Error
# warn: Warning
# info: Information
# succ: Success
# debug: Debug

# Logger
LOGGER="$LOGGER_PATH swbot"

# Debug Log
$LOGGER "debug" "Environment variables:"
$LOGGER "debug" "  Path:"
$LOGGER "debug" "    Project Root\t: ${PROJECT_ROOT}"
$LOGGER "debug" "    Action Root\t: ${ACTION_ROOT}"
$LOGGER "debug" "    Common Root\t: ${COMMON_ROOT}"
$LOGGER "debug" "    Logger Path\t: ${LOGGER_PATH}"
$LOGGER "debug" "  Env:"
$LOGGER "debug" "    Token\t\t: ${TOKEN}"
$LOGGER "debug" "    Device IDs\t\t: ${DEVICE_IDS}"
$LOGGER "debug" "    Action\t\t: ${ACTION}"


# Check Env
checkEnv_result=$($PROJECT_ROOT"/common/check_env.sh")
$LOGGER "debug" "CheckEnv result: ${checkEnv_result}"
if [ "${checkEnv_result}" = "0" ]; then
    $LOGGER "info" "Check environment variables successfully."
else 
    checkEnv_failed_count=(${checkEnv_result//,/ }[0])
    checkEnv_failed_list=(${checkEnv_result//,/ })
    unset checkEnv_failed_list[0] # 0番目は失敗数なので削除(なんとかしたい)
    $LOGGER "err_c" "Failed to check environment variables."
    $LOGGER "err_c" "Failed count: ${checkEnv_failed_count}"
    $LOGGER "err_c" "Failed list: ${checkEnv_failed_list[*]}"
    exit 1
fi

# 操作タイプ分岐
if [ "${ACTION}" = "setOn" -o "${ACTION}" = "setOff" ]; then
    $LOGGER "debug" "ActionType: Set"
    $ACTION_ROOT"/SetMode.sh"
fi
