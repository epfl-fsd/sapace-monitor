#!/usr/bin/env bash

echo $0
telegram_chat_id=$1
bot_token=$2
disk_space_limit=$3
message_send=$4

command=$(df -h /)
# https://stackoverflow.com/a/428118
used=$(echo $command | cut -d' ' -f 12 | cut -d'%' -f 1)
space_left=$(echo $command | cut -d' ' -f 11)

echo $message_send

echo "Checking disk space..."
if [ $used -gt $disk_space_limit ]
then
    echo $message_send
    if [$message_send == '']
    then
        message_send="State: Low disk space: $used% used ($space_left left)"
    fi
    message_send="${message_send// /%20}"
    echo "State: Low disk space: $used% used ($space_left left)"
    curl "https://api.telegram.org/bot$bot_token/sendMessage?text=$message_send&chat_id=$telegram_chat_id"
else
    echo "State: Good"
fi
