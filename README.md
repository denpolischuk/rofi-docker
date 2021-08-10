# Rofi Docker widget
## What can it do
The script uses docker cli to list all the containers that are currently running and uses the output to display rofi menu.

For each container you can perform further actions:
 - Attach
 - Logs (in `-f` mode)
 - Restart
 - Stop

## IMPORTANT
Script uses Alacritty as a default terminal to run some actions. If you are using different terminal - change the terminalbin according to your setup.

## Dependencies
 - Docker
 - Rofi
