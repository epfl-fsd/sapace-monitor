echo $0
telegram_chat_id=$1
message_send=$2
bot_token=$3
disk_space_limit=$4

command=$(df -h /)
# https://stackoverflow.com/a/428118
used=$(echo $command | cut -d' ' -f 12 | cut -d'%' -f 1)
space_left=$(echo $command | cut -d' ' -f 11)

echo "Checking disk space..."
if [ $used -gt $disk_space_limit ]
then
    echo "State: Low disk space: $used% used ($space_left left)"
    curl --silent "https://api.telegram.org/bot$bot_token/sendMessage?text=$message_send&chat_id=$telegram_chat_id" > /dev/null
else
    echo "State: Good"
fi
