#!/bin/bash

level=$(pamixer --get-volume)
pipe='/tmp/volpipe'
dzen_args=( -tw 200 -h 25 -x 860 -y 20 -bg '#101010' )
gdbar_args=( -w 180 -h 7 -fg '#859900' -bg '#404040' )

if [[ ! -e "$pipe" ]]; then
    mkfifo "$pipe"
    (dzen2 "${dzen_args[@]}" < "$pipe"; rm -f "$pipe") &
fi

(echo ${level} | gdbar "${gdbar_args[@]}"; sleep 1) >> "$pipe"
