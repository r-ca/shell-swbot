#!/bin/bash

# ドライバ
##　第一引数: アクションのオーバーライド

## SETTING
TOKEN="0acc082716944f3a421fcc9c17c968ccc1ce52589d61d7d8d87d334bbe25e43888a919210d095190b4be941263a1ae97"
DEVICE_ID_LIST=("01-202207310613-85329752" "01-202207301701-64991489")
ACTION="setOff"

if [[ -n "$1" ]]; then
    echo "Override action at driver.sh: $1"
    ACTION=$1
fi

## 変換
DEVICE_IDS=${#DEVICE_ID_LIST[*]},$(IFS=,; echo "${DEVICE_ID_LIST[*]}")
## 実行
TOKEN=$TOKEN DEVICE_IDS=$DEVICE_IDS ACTION=$ACTION ./entry.sh
