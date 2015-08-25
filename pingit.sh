#!/bin/bash

export LOG_URL="http://localhost:4000/api/logs"

function ping-time {
        echo $(ping -c 1 $1 | grep 'time=' | awk '{print $7}' | cut -f 2 -d '=')
}

now="$(date +%s)"
ssid="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
)"
uuid="$(ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformUUID/ { split($0, line, "\""); printf("%s\n", line[4]); }')"
gateway="$(netstat -rn | grep 'default' | awk '{print $2}')"

google_ping=$(ping-time 8.8.8.8)
gateway_ping=$(ping-time $gateway)

curl -X "POST" $LOG_URL -H "Content-Type: application/json" --data '{"log":{"network":"'"$ssid"'", "gateway":"'"$gateway_ping"'", "google":"'"$google_ping"'", "host":"'"$uuid"'"}}'
