#!/bin/bash

failed_count=0
failed_list=()

if [ -z "$TOKEN" ]; then
    failed_count=$((failed_count+1))
    failed_list+=("TOKEN")
fi

if [ -z "$DEVICE_IDS" ]; then
    failed_count=$((failed_count+1))
    failed_list+=("DEVICE_IDS")
fi

# 戻り値
if [ $failed_count -gt 0 ]; then
    echo ${failed_count}","$(IFS=,; echo "${failed_list[*]}")
else 
    echo "0"
fi
