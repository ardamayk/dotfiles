#!/usr/bin/env bash
pid=$(tmux display-message -p "#{pane_pid}")
etime=$(ps -o etime= -p "$pid" | xargs)
echo -n "$etime"
