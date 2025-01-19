#!/bin/bash

# Get the list of options
option=$(echo -e "Toggle Bluetooth\nReconnect\nDisconnect\nRemove Device\nAvailable Devices\nAdd New Device" | wofi --show dmenu --prompt="Bluetooth Options")

case $option in
  "Toggle Bluetooth")
    # Check current Bluetooth status
    bt_status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
    if [ "$bt_status" = "yes" ]; then
      bluetoothctl power off
      notify-send "Bluetooth" "Turned off" -t 2000
    else
      bluetoothctl power on
      notify-send "Bluetooth" "Turned on" -t 2000
    fi
    ;;
  "Reconnect")
    device=$(bluetoothctl devices Connected | awk '{mac=$2; $1=$2=""; sub(/^ /, ""); print mac, $0}' | wofi --show dmenu --prompt="Disconnect Device" | awk '{print $1}')
    if [ -n "$device" ]; then
      bluetoothctl connect "$device"
      notify-send "Bluetooth" "Reconnecting to $device" -t 2000
    else
      notify-send "Bluetooth" "No device selected" -t 2000
    fi
    ;;
  "Disconnect")
    device=$(bluetoothctl devices Connected | awk '{mac=$2; $1=$2=""; sub(/^ /, ""); print mac, $0}' | wofi --show dmenu --prompt="Disconnect Device" | awk '{print $1}')
    if [ -n "$device" ]; then
      bluetoothctl disconnect "$device"
      notify-send "Bluetooth" "Disconnecting from $device" -t 2000
    else
      notify-send "Bluetooth" "No device selected" -t 2000
    fi
    ;;
  "Available Devices")
    # Get available devices and let user select one to connect
    device=$(bluetoothctl devices | awk '{mac=$2; $1=$2=""; sub(/^ /, ""); print mac, $0}' | wofi --show dmenu --prompt="Disconnect Device" | awk '{print $1}')
    if [ -n "$device" ]; then
      bluetoothctl connect "$device"
      notify-send "Bluetooth" "Connecting to $device" -t 2000
    else
      notify-send "Bluetooth" "No device selected" -t 2000
    fi
    ;;
  "Add New Device")
    # Start scanning for new devices
    # Smartdevices are devices which require manual pairing by confirming the code, devices like Smartphones, Smartwatches, New TWS's, Laptops etc.
    # Media devices are devices which require automatic pairing, devices like Headphones, Speakers, Normal Keyboards, Mouses etc.
    # If the second option fails, try the first one.
    # Second option gives you the device Name and Mac Address, along with the commnand to enter to C/P in bluetoothctl.
    # Use exit to exit the bluetoothctl and terminal to continue the script.
    deviceType=$(echo -e "A. Smartdevices\nB. Media\nTry aganin with the first option if second one fails." | wofi --show dmenu --prompt="Select Device Type")
    notify-send "Bluetooth" "Scanning for new devices" -t 2000
    echo -e "Hold up! Scanning for devices.\nThis might takes 10s.\nScanning..." | awk '{print $0}' | timeout 10 wofi --show dmenu --prompt="Bluetooth Scanning" &
    
    bluetoothctl discoverable on
    bluetoothctl --timeout 50 scan on &
    sleep 10
    # Get list of new devices and let the user select one to pair
    device=$(bluetoothctl devices | awk '{mac=$2; $1=$2=""; sub(/^ /, ""); print mac, $0}' | wofi --show dmenu --prompt="Disconnect Device" | awk '{print $1}')
    deviceName=$(bluetoothctl devices | awk -v mac="$device" '$2 == mac {print $3}')
    bluetoothctl pairable on
    if [ "$deviceType" = "A. Smartdevices" ]; then
      if [ -n "$device" ]; then
        # Display the device info and start pairing in a new terminal
        notify-send "Bluetooth" "Pairing with $deviceName" -t 2000
        kitty --hold -e bash -c "echo -e \"---------------Bluetooth Pairing Has Started------------------\nDevice Mac Address: $device\nPlease copy the above Mac address and execute: \npair $device\nFollow the upcoming prompt in bluetoothctl.\nExit using 'exit'.\"; bluetoothctl"
        # Trust and connect to the device
        bluetoothctl trust "$device"
        bluetoothctl connect "$device"
        notify-send "Bluetooth" "Connecting to $deviceName" -t 1000
        # Check if the device is connected
        deviceConnected=$(bluetoothctl devices Connected | awk '{print $2}')
        if echo "$deviceConnected" | grep -q "$device"; then
          notify-send "Bluetooth" "Connected to $deviceName" -t 2000
          bluetoothctl pairable off
          bluetoothctl discoverable off
          bluetoothctl scan off
        else
          notify-send "Bluetooth" "Failed to connect to $deviceName" -t 2000
          bluetoothctl pairable off
          bluetoothctl discoverable off
          bluetoothctl scan off
        fi
      else
        notify-send "Bluetooth" "No new device selected" -t 2000
        bluetoothctl pairable off
        bluetoothctl discoverable off
        bluetoothctl scan off
      fi
    elif [ "$deviceType" = "B. Media" ]; then
      if [ -n "$device" ]; then
        # Display the device info and start pairing in a new terminal
        notify-send "Bluetooth" "Pairing with $deviceName" -t 2000
        bluetoothctl pair "$device"
        # Trust and connect to the device
        bluetoothctl trust "$device"
        bluetoothctl connect "$device"
        notify-send "Bluetooth" "Connecting to $deviceName" -t 1000
        # Check if the device is connected
        deviceConnected=$(bluetoothctl devices Connected | awk '{print $2}')
        if echo "$deviceConnected" | grep -q "$device"; then
          notify-send "Bluetooth" "Connected to $deviceName" -t 2000
          bluetoothctl pairable off
          bluetoothctl discoverable off
          bluetoothctl scan off
        else
          notify-send "Bluetooth" "Failed to connect to $deviceName" -t 2000
          bluetoothctl pairable off
          bluetoothctl discoverable off
          bluetoothctl scan off
        fi
      else
        notify-send "Bluetooth" "No new device selected" -t 2000
        bluetoothctl pairable off
        bluetoothctl discoverable off
        bluetoothctl scan off
      fi
    fi
    ;;
  "Remove Device")
    device=$(bluetoothctl devices Paired | awk '{mac=$2; $1=$2=""; sub(/^ /, ""); print mac, $0}' | wofi --show dmenu --prompt="Disconnect Device" | awk '{print $1}')
    if [ -n "$device" ]; then
      out=$(bluetoothctl remove "$device" | grep "removed")
      notify-send "Bluetooth" "$out" -t 2000
    else
      notify-send "Bluetooth" "No device selected" -t 2000
    fi
    ;;
esac
