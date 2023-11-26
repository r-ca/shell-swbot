#!/bin/bash

# ドライバ
##　第一引数: アクションのオーバーライド

## SETTING
TOKEN="token"
DEVICE_ID_LIST=("device_id1" "device_id2")
MODE="setOff"

if [[ -n "$1" ]]; then
    MODE=$1
fi

## 変換
DEVICE_IDS=${#DEVICE_ID_LIST[*]},$(IFS=,; echo "${DEVICE_ID_LIST[*]}")
## 実行
TOKEN=$TOKEN DEVICE_IDS=$DEVICE_IDS ACTION=$MODE ./entry.sh
