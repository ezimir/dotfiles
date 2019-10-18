#!/bin/bash

# inspired by https://askubuntu.com/a/518955

WARNING=40
TIMEOUT=600 # 5 minutes

UPPER=75
LOWER=25

while true
do
    export DISPLAY=:0.0
    battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
    if on_ac_power; then
        if [ $battery_level -ge $UPPER ]; then
            notify-send -u critical "Battery charge above ${UPPER}%." "Please unplug your AC adapter!\nCurrent: ${battery_level}% "
            sleep $WARNING
            if on_ac_power; then
                # lock the screen if you don't unplug AC adapter after warning
                gnome-screensaver-command -l
            fi
        fi
    else
        if [ $battery_level -le $LOWER ]; then
            notify-send -u critical "Battery charge is below ${LOWER}%." "Need to charge! Please plug your AC adapter.\nCurrent: ${battery_level}%"
            # don't lock if not charging after warning, may not have the charger available
        fi
    fi

    sleep $TIMEOUT
done
