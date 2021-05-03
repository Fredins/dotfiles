#!/usr/bin/env bash

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit
killall polybar

if pgrep '^polybar' > /dev/null; then
  exit 0
fi

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main 2>&1 | tee -a /tmp/polybar_example.log & disown

echo "Bars launched..."
