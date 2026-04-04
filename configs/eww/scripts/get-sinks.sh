#!/bin/bash
pactl list sinks | awk '
/^Sink #/{id=substr($0,7)}
/Name:/{name=$2}
/Description:/{desc=substr($0, index($0,$2))}
/State:/{state=$2; printf "{\"id\":\"%s\",\"name\":\"%s\",\"desc\":\"%s\",\"active\":\"%s\"}\n", id, name, desc, (state=="RUNNING"?"true":"false")}
' | jq -s '.'
