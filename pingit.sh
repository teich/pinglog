#!/bin/bash

#SBHOME=~/src/pinglog/shellbrato
#LBUSER=oren@teich.net

#source .env
#source $SBHOME/shellbrato.sh

function ping-time {
        echo $(ping -c 1 $1 | grep 'time=' | awk '{print $7}' | cut -f 2 -d '=')
}

now="$(date +%s)"
ssid="$(networksetup -getairportnetwork en0 | cut -f 4 -d ' ')"
uuid="$(ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformUUID/ { split($0, line, "\""); printf("%s\n", line[4]); }')"
gateway="$(netstat -rn | grep 'default' | awk '{print $2}')"

google_ping=$(ping-time 8.8.8.8)
gateway_ping=$(ping-time $gateway)

echo "$now, $uuid, $ssid, $gateway_ping, $google_ping"

# sendGauge "${now}||google_ping||${ping}||${ssid}"
