#!/bin/bash

# デバッグするときとかに使うラッパー

TOKEN="token"
SECRET="secret"

DEVICE_ID_LIST=("device_id1" "device_id2")

DEVICE_IDS=${#DEVICE_ID_LIST[*]},$(IFS=,; echo "${DEVICE_ID_LIST[*]}")

MODE="toggleOn"

TOKEN=$TOKEN SECRET=$SECRET DEVICE_IDS=$DEVICE_IDS ./swbot.sh $MODE
