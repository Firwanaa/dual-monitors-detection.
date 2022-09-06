#!/bin/bash

monitors=$(xrandr | grep -sw 'connected' | wc -l)

if (( monitors > 1))
then
  echo "More than one monitor detected."
  i3-msg "exec --no-startup-id xrandr --output eDP1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"

i3-msg "set $firstMonitor \"HDMI1\""
i3-msg "set $sworkspace 1 output $firstMonitor"
i3-msg "workspace 2 output $firstMonitor"
i3-msg "workspace 3 output $firstMonitor"
i3-msg "workspace 4 output $firstMonitor"
i3-msg "workspace 5 output $firstMonitor"
i3-msg "workspace 6 output $secondMonitor"
i3-msg "workspace 7 output $secondMonitor"
i3-msg "workspace 8 output $secondMonitor"
i3-msg "workspace 9 output $secondMonitor"
i3-msg "workspace 10 output $secondMonitorecondMonitor \"eDP1\""

else 
  echo "$(monitors) monitors detected."
  i3-msg "exec --no-startup-id xrandr --output eDP1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"

fi
