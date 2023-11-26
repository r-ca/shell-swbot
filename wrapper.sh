#!/bin/bash

# デバッグするときとかに使うラッパー

TOKEN="token"
SECRET="secret"
DEVICE_ID="device_id"

MODE="toggleOn"

TOKEN=$TOKEN SECRET=$SECRET DEVICE_ID=$DEVICE_ID ./swbot.sh $MODE
