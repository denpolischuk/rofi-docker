#!/usr/bin/bash

#Set default terminal emulator
TERMINAL_APP=alacritty

selected_container=$(docker ps --format "table {{.ID}}:\t[{{.Image}}]\t{{.Names}}" | sed '1d' | rofi -p "Running containers " -dmenu)
container_options_attach="Attach"
container_options_stop="Stop"
container_options_logs="Logs"
container_options_restart="Restart"

if [[ ! -z $selected_container ]]; then
	container_id=$(echo $selected_container | cut -d':' -f 1)
	selected_action=$(echo -e "$container_options_attach\n$container_options_logs\n$container_options_restart\n$container_options_stop" | rofi -dmenu -selected-row 0)
	case $selected_action in 
		$container_options_logs)
			$TERMINAL_APP -e $SHELL -c "docker exec -it ${container_id} /bin/sh"
			;;
		$container_options_restart)
			msg=$(docker restart $container_id)
			rofi -e "Message from the docker: $msg"
			;;
		$container_options_attach)
			$TERMINAL_APP -e $SHELL -c "docker logs -f ${container_id}"
			;;
		$container_options_stop)
			msg=$(docker stop $container_id)
			rofi -e "Message from the docker: $msg"
		;;
	esac
fi
