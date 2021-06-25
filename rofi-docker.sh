#!/usr/bin/bash

#Set default terminal emulator
TERMINAL_APP=gnome-terminal

selected_container=$(docker ps --format "table {{.ID}}:\t[{{.Image}}]\t{{.Names}}" | sed '1d' | rofi -p "Running containers " -dmenu)
container_options_attach="Attach"
container_options_stop="Stop"

if [[ ! -z $selected_container ]]; then
	container_id=$(echo $selected_container | cut -d':' -f 1)
	selected_action=$(echo -e "$container_options_attach\n$container_options_stop" | rofi -dmenu -selected-row 0)
	case $selected_action in 
		$container_options_attach)
			$TERMINAL_APP -e "docker exec -it ${container_id} /bin/sh"
			;;
		$container_options_stop)
			msg=$(docker stop $container_id)
			rofi -e "Message from the docker: $msg"
		;;
	esac
fi
