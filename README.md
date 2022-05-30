# sapace-monitor

Sapace-monitor is a simple bash script that notifies you if your machine is running out of space. It is recommended to put it in a crontab.

## Usage : 

```curl -s -L https://raw.githubusercontent.com/epfl-fsd/sapace-monitor/main/space.sh | bash -s <telegram_chat_id> <telegram_bot_token> <percent_max_disk_usage> [telegram_notification_message]```


Example:

```curl -s -L https://raw.githubusercontent.com/epfl-fsd/sapace-monitor/main/space.sh | bash -s 123456789 8435384375:VMEFKOI4VJCMJIM4_ZJ3RCFJU3FCUZJUWIE 50```  