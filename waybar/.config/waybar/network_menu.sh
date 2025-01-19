#!/bin/bash

# Get the list of options
option=$(echo -e "Toggle Wi-Fi\nReconnect\nDisconnect\nAvailable Networks" | wofi --show dmenu --prompt="Network Options")

case $option in
  "Toggle Wi-Fi")
    # Check current Wi-Fi status
    wifi_status=$(nmcli radio wifi)
    if [ "$wifi_status" = "enabled" ]; then
      nmcli radio wifi off
      notify-send "Wi-Fi" "Turned off" -t 2000
    else
      nmcli radio wifi on
      notify-send "Wi-Fi" "Turned on" -t 2000
    fi
    ;;
  "Reconnect")
    iface=$(nmcli -t -f DEVICE,TYPE,STATE device | grep wifi | grep connected | cut -d: -f1)
    if [ -n "$iface" ]; then
      nmcli device reapply "$iface"
      notify-send "Wi-Fi" "Reconnected to $iface" -t 2000
    else
      notify-send "Wi-Fi" "No Wi-Fi interface connected" -t 2000
    fi
    ;;
  "Disconnect")
    iface=$(nmcli -t -f DEVICE,TYPE,STATE device | grep wifi | grep connected | cut -d: -f1)
    if [ -n "$iface" ]; then
      nmcli device disconnect "$iface"
      notify-send "Wi-Fi" "Disconnected from $iface" -t 2000
    else
      notify-send "Wi-Fi" "No Wi-Fi connection to disconnect" -t 2000
    fi
    ;;
  "Available Networks")
    # Get available networks and let user select one
    network=$(nmcli -t -f SSID,SIGNAL dev wifi list | sort -t: -k2 -nr | awk -F: '{printf "%s (%s%%)\n", $1, $2}' | wofi --show dmenu --prompt="Available Networks")
    ssid=$(echo "$network" | sed 's/ (.*//') # Extract SSID
    [ -n "$ssid" ] && nmcli device wifi connect "$ssid" && notify-send "Wi-Fi" "Connecting to $ssid" -t 2000 || notify-send "Wi-Fi" "No network selected" -t 2000
    ;;
esac
