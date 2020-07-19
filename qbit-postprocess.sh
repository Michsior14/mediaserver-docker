#!/bin/sh -xu

# Link the file to the qbit configuration path
# $1 - torrent dir "%D"
# $2 - torrent name "%N"

# Input Parameters
ARG_PATH="$1/$2"
ARG_NAME="$2"
ARG_LABEL="N/A"

# Configuration
FILEBOT_PORT=${FILEBOT_PORT:-7676}

FILEBOT_CMD=$(\
echo curl \
    --data-urlencode name=\"${ARG_NAME}\" \
    --data-urlencode path=\"${ARG_PATH}\" \
    --data-urlencode label=\"${ARG_LABEL}\" \
    http://filebot:${FILEBOT_PORT}/amc)

echo $FILEBOT_CMD >> /config/filebot.log
eval $FILEBOT_CMD
