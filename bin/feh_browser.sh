#!/bin/sh
feh -g 1920x1200 --title "feh [%u из %l] - %f (%wx%h, %S)" -C /home/dm/.fonts/ -M PTS55F/11 -e PTS55F/12  --action ";animate -loop 0 -delay 10 %F &" --action1 ";gthumb %F &" "$(dirname "$1")" --start-at "$1"
#feh -g 1280x1024 --title "feh [%u из %l] - %f (%wx%h, %S)" -C /home/dm/.fonts/ -M PTS55F/11 -e PTS55F/12  --action ";animate -loop 0 -delay 10 %F &" --action1 ";gthumb %F &" "$(dirname "$1")" --start-at "$1"

