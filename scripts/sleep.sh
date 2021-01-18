#!/usr/bin/zsh

go_to_sleep() {
  echo "Sleeping in $1"
  sleep $1
  systemctl suspend -i
  echo "Done"
}

go_to_sleep "${1}m" &

