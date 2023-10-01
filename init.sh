#!/bin/bash

# extract wg config file path, or use default
conf="$(jq -r .config_interface db/server/global_settings.json || echo wg0)"
file="/etc/wireguard/$conf.conf"
# manage wireguard stop/start with the container

wg-quick up "$conf"
trap 'wg-quick down "$file"' SIGTERM # catches container stop

# manage wireguard restarts when config file changes
[[ -f $file ]] || touch "/etc/wireguard/$file.conf" # inotifyd needs file to exist
while true; do
    inotifywait "$file" -e close_write
    wg-quick down "$conf"
    wg-quick up "$conf"
done &


./wg-ui &
wait $!
