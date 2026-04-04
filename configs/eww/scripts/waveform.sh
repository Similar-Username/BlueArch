#!/bin/bash
vol=100

cava -p <(cat << 'EOF'
[general]
bars = 20
sensitivity = 200
[input]
method = pulse
source = default.monitor
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 1000
EOF
) | stdbuf -oL awk '
BEGIN { vol = 100; frame = 0 }
{
    frame++
    if (frame % 10 == 0) {
        cmd = "pamixer --get-volume"
        cmd | getline vol
        close(cmd)
        mute = "false"
        mcmd = "pamixer --get-mute"
        mcmd | getline mute
        close(mcmd)
        if (mute == "true") vol = 0
    }

    scale = vol / 100.0
    n = split($0, a, ";")
    half = int(n/2)
    printf "["
    for (i=1; i<=half; i++) {
        val = (a[i] + 0) * scale
        if (val <= 0) {
            out = 1
        } else {
            out = int(28 * log(1 + val) / log(1001))
            if (out < 1) out = 1
        }
        printf "%s%d", (i>1?",":""), out
    }
    printf "]\n"
    fflush()
}'
