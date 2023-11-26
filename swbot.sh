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

$LOGGER "debug" "Entry Point Start"
$LOGGER "debug" "Project Root: ${PROJECT_ROOT}"
$LOGGER "debug" "Action Root: ${ACTION_ROOT}"
$LOGGER "debug" "Common Root: ${COMMON_ROOT}"
$LOGGER "debug" "Action: ${ACTION}"

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
