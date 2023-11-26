#!/bin/bash

# デバッグするときとかに使うラッパー

## SETTING
TOKEN="token"
DEVICE_ID_LIST=("device_id1" "device_id2")
MODE="toggleOn"

## 変換
DEVICE_IDS=${#DEVICE_ID_LIST[*]},$(IFS=,; echo "${DEVICE_ID_LIST[*]}")
## 実行
TOKEN=$TOKEN DEVICE_IDS=$DEVICE_IDS ./swbot.sh $MODE
