# Polybar+Rofi Docker widget
## Dependencies
 - Polybar
 - Docker
 - Rofi
 - Font awesome

## Polybar module
```
[module/docker]
type = custom/text
click-left = ~/opt/rofi-docker/rofi-docker.sh &
content = "%{T5}%{T-}"
```
