#!/bin/bash

# デバッグするときとかに使うドライバ

## SETTING
TOKEN="token"
DEVICE_ID_LIST=("device_id1" "device_id2")
MODE="setOn"

## 変換
DEVICE_IDS=${#DEVICE_ID_LIST[*]},$(IFS=,; echo "${DEVICE_ID_LIST[*]}")
## 実行
TOKEN=$TOKEN DEVICE_IDS=$DEVICE_IDS ACTION=$MODE ./entry.sh
