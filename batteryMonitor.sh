#!/bin/bash

# Script to notify when charger is connected/disconnected or charging status changes

# Check if notify-send is available
if ! command -v notify-send &> /dev/null; then
    echo "Error: notify-send is not installed. Please install libnotify-bin."
    exit 1
fi

# Function to get current charging status
get_charging_status() {
    # For systems with /sys/class/power_supply/
    if [ -d /sys/class/power_supply/ ]; then
        for supply in /sys/class/power_supply/*; do
            if [ -e "$supply/type" ] && grep -q "Battery" "$supply/type"; then
                if [ -e "$supply/status" ]; then
                    status=$(cat "$supply/status")
                    echo "$status"
                    return
                fi
            fi
        done
    fi
    
    # Alternative method using upower (common on Ubuntu/Debian)
    if command -v upower &> /dev/null; then
        battery=$(upower -e | grep battery)
        if [ -n "$battery" ]; then
            status=$(upower -i "$battery" | grep "state" | awk '{print $2}')
            echo "$status"
            return
        fi
    fi
    
    # Alternative method using acpi
    if command -v acpi &> /dev/null; then
        status=$(acpi -b | awk '{print $3}' | tr -d ',')
        echo "$status"
        return
    fi
    
    echo "unknown"
}

# Initial status
previous_status=$(get_charging_status)

# Notification function
notify_status_change() {
    local status=$1
    case "$status" in
        "Charging"|"Full")
            notify-send "Charger Connected" "Battery is now $status" --icon=battery-charging
            ;;
        "Discharging")
            notify-send "Charger Disconnected" "Running on battery power" --icon=battery
            ;;
        *)
            notify-send "Battery Status Changed" "New status: $status" --icon=dialog-information
            ;;
    esac
}

# Main monitoring loop
echo "Monitoring battery status. Initial status: $previous_status"
while true; do
    current_status=$(get_charging_status)
    
    if [ "$current_status" != "$previous_status" ]; then
        echo "Status changed from $previous_status to $current_status"
        notify_status_change "$current_status"
        previous_status=$current_status
    fi
    
    # Check every 5 seconds
    sleep 5
done