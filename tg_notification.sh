#!/bin/bash

source ~/ci_cd_config.conf
TIME=10
DATE=$(date '+%d/%m/%Y %H:%M:%S');
PIPLINES=$(cat pipelines.sh | sed ':a;N;$!ba;s/\n/%0A/g')

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

TEXT="📅 Date: $DATE%0A\
📁 Project: $CI_PROJECT_NAME%0A\
🌿 Branch: $CI_COMMIT_REF_SLUG%0A\
🔗 Commit: [$CI_COMMIT_SHORT_SHA] - $CI_COMMIT_TITLE%0A\
👤 Author: $GITLAB_USER_NAME%0A\
$PIPLINES"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null