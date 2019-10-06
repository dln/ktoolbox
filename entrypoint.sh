#!/bin/bash
set -e

if [[ -z "$KUBERNETES_SERVICE_HOST" ]]; then
  command="/bin/bash"
  if [[ -n "$*" ]]; then
    command="$*"
  fi
  echo $command
  exec /bin/bash -c "${command}"
fi


max_idle_mins="30"
touch /tmp
while (find /tmp -maxdepth 0 -mmin -${max_idle_mins} | grep -q '^' ); do
  sleep 30
  echo "Still active..."
done
echo "Toolbox idle for ${max_idle_mins} mins. Shutting down..."
curl -X POST http://127.0.0.1:15020/quitquitquit
