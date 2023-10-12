#!/bin/bash

# extract wg config file path, or use default
conf=${WGUI_INTERFACE:-wg0}
file="/etc/wireguard/$conf.conf"
# manage wireguard stop/start with the container

wg-quick up "$conf"
trap 'wg-quick down "$conf"' SIGTERM # catches container stop

# manage wireguard restarts when config file changes
[[ -f $file ]] || touch "$file" # inotifyd needs file to exist
while true; do
    inotifywait "$file" -e close_write
    wg syncconf $conf <(wg-quick strip $conf)
done &


./wg-ui &
wait $!
