#!/usr/bin/env bash

echo $0
telegram_chat_id=$1
bot_token=$2
disk_space_limit=$3
message_send=$4

command=$(df -h /)
space_left=$(echo $command | cut -d' ' -f 11)
disk_name=$(echo $command | cut -d' ' -f 8)

# https://stackoverflow.com/a/428118
used=$(echo $command | cut -d' ' -f 12 | cut -d'%' -f 1)
ip=$(echo $(hostname -I | cut -d ' ' -f 1))

echo $message_send

echo "Checking disk space..."
if [ $used -gt $disk_space_limit ]
then
    if [$message_send == '']
    then
        message_send="Low disk space on $(hostname)%0AIp: $ip%0AVolume: $disk_name%0A$used% used ($space_left left)"
        echo $message_send
    fi
    message_send="${message_send// /%20}"
    curl "https://api.telegram.org/bot$bot_token/sendMessage?text=$message_send&chat_id=$telegram_chat_id&parse_mode=markdown"
else
    echo "State: Good"
fi
