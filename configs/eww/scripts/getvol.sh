#!/bin/bash

vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)
if [ "$mute" = true ]; then
    eww update volico="󰖁"
    vol="0";
else
    eww update volico="󰕾"
fi
#eww update get_vol="$vol"

echo $vol

pactl subscribe | stdbuf -oL grep --line-buffered "Event 'change' on sink" | while read -r _; do
    vol=$(pamixer --get-volume)
    mute=$(pamixer --get-mute)
    if [ "$mute" == true ]; then
        eww update volico="󰖁"
        vol="0";
    else
        eww update volico="󰕾"
    fi

    echo $vol
done
