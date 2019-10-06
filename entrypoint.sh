#!/bin/bash
set -e

if [[ -z "$KUBERNETES_SERVICE_HOST" ]]; then
  echo "Not running on Kubernetes. Starting shell."
  exec /bin/bash
fi


max_idle_mins="30"
touch /tmp
while (find /tmp -maxdepth 0 -mmin -${max_idle_mins} | grep -q '^' ); do
  sleep 30
  echo "Still active..."
done
echo "Toolbox idle for ${max_idle_mins} mins. Shutting down..."
curl -X POST http://127.0.0.1:15020/quitquitquit
