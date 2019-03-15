#!/bin/bash
set -e
max_idle_mins="30"
touch /tmp
while (find /tmp -maxdepth 0 -mmin ${max_idle_mins} | grep -q '^' ); do
  sleep 30
  echo "Still active..."
done
echo "Toolbox idle for ${max_idle_mins} mins. Shutting down..."
