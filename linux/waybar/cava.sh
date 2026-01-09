#!/bin/bash

FIFO="/tmp/cava.fifo"
CONFIG="$HOME/.config/cava/waybar-config"
[ -p "$FIFO" ] || mkfifo "$FIFO"

pgrep -fx "cava -p $CONFIG" > /dev/null || cava -p "$CONFIG" > /dev/null &

sleep 0.2

while read -r line; do
  bars=$(echo "$line" | sed 's/[^0-7]//g' | sed 's/0/ /g; s/1/▁/g; s/2/▂/g; s/3/▃/g; s/4/▄/g; s/5/▅/g; s/6/▆/g; s/7/▇/g')
  echo "{\"text\": \"$bars\", \"tooltip\": \"Audio Visualizer\"}"
done < "$FIFO"
