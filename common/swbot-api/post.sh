#!/bin/bash

## Arguments
# $1: Request URL
# $2: Request Body

LOGGER="${LOGGER_PATH} swbot-api/post"

$LOGGER "debug" "swbot-api/post called"

# TODO: 引数のチェックする？

# 詰替え
REQUEST_URL=$1
REQUEST_BODY=$2

$LOGGER "debug" "Request URL: ${REQUEST_URL}"
$LOGGER "debug" "Request Body: ${REQUEST_BODY}"

response_code=$(curl -s \
    -X POST \
    -H "Authorization: ${TOKEN}" \
    -H "Content-Type: application/json; charset=utf8" \
    -d "${REQUEST_BODY}" \
    "${REQUEST_URL}" \
    -o /dev/null \
    -w '%{http_code}' )

$LOGGER "debug" "Response Code: ${response_code}"

if [ "${response_code}" -ne 200 ]; then
    $LOGGER "err" "Failed to execute (Status Code: ${response_code})."
    exit 1
else 
    exit 0
fi
