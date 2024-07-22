#!/bin/bash

# |-------------------------------------------------------|
# |  MANAGED BY ANSIBLE --- CHANGES WILL BE OVERWRITTEN.  |
# |-------------------------------------------------------|

PIPE_NAME="{{ command_named_pipe }}"

map_index() {
    case $1 in
        ':') return 0;;
        'restart') return 1;;
    esac
}

map_vals=(
  ":"
  "/usr/local/bin/galaxyctl restart"
);

if [[ ! -p $PIPE_NAME ]]; then
  mkfifo $PIPE_NAME
fi

while true; do
  if read command < $PIPE_NAME; then
    map_index $command
    eval "${map_vals[$?]}"
  fi
done

