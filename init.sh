#!/bin/bash

# extract wg config file path, or use default
conf="$(jq -r .config_interface db/server/global_settings.json || echo wg0)"

# manage wireguard stop/start with the container

wg-quick up "$conf"
trap 'wg-quick down "$conf"' SIGTERM # catches container stop

# manage wireguard restarts when config file changes
[[ -f $conf ]] || touch "$conf" # inotifyd needs file to exist
while true; do
    inotifywait "/etc/wireguard/$conf.conf" -e close_write
    wg-quick down "$conf"
    wg-quick up "$conf"
done &


./wg-ui &
wait $!
