#!/bin/bash
if [ "$(eww get volctlrev)" = "true" ]; then
    eww update volctlrev=false
else
    eww update volctlrev=true
fi
