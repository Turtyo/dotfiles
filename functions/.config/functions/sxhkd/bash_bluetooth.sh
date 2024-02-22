#!/usr/bin/env bash 

output="$1"
input=$output
echo "output : $output ; input : $input"
echo "Bluetooth connection :" > $output
echo "Listing paired devices" > $output
bctlp="$(bluetoothctl devices)"
list_of_devices=$( echo "$bctlp" | grep -noP '.*:[A-Z0-9]{2} \K.*' )
echo "$list_of_devices"  > $output
number_of_match="$( echo "$list_of_devices" | wc -l)"
echo "Select the number of the device you want to connect to :" > $output 
read device_sel < $input
if [[ '^[^0-9]+$|^''$' =~ $device_sel ]]
then
	echo "Invalid input, please input a number between 1 and ${number_of_match}"
	exit 1
elif [ $device_sel -lt 1 ] || [ $device_sel -gt $number_of_match ] 
then
	echo "Invalid selection, please input a number between 1 and $number_of_match"
	exit 1
fi
echo "Selected device number $device_sel, attempting to connect" > $output
bluetoothctl power on > $output
bluetoothctl connect `echo "$bctlp" | grep -oP -m "$device_sel" '[A-Z0-9]{2}:.*:[A-Z0-9]{2}' | tail -n 1` > $output

