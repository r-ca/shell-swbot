#!/bin/bash

# Entry Point

# Init
PROJECT_ROOT=$(cd $(dirname $0); pwd)
ACTION_ROOT=$PROJECT_ROOT"/action"
COMMON_ROOT=$PROJECT_ROOT"/common"

# Logger
LOGGER_PATH=$PROJECT_ROOT"/common/logger.sh"

PROJECT_ROOT=${PROJECT_ROOT} \
ACTION_ROOT=${ACTION_ROOT} \
COMMON_ROOT=${COMMON_ROOT} \
LOGGER_PATH=${LOGGER_PATH} \
$PROJECT_ROOT"/swbot.sh"
