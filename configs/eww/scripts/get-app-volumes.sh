#!/bin/bash
pactl list sink-inputs | awk '
/^Sink Input #/{id=substr($0,13)}
/application.name/{gsub(/"/,"",$0); name=substr($0, index($0,$3))}
/Volume:.*%/{match($0,/[0-9]+%/); vol=substr($0,RSTART,RLENGTH-1)}
/Mute:/{mute=$2; printf "{\"id\":\"%s\",\"name\":\"%s\",\"vol\":\"%s\",\"mute\":\"%s\"}\n", id, name, vol, mute}
' | jq -s '.'
