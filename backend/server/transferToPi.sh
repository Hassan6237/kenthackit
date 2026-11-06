#!/bin/bash
# Sends the public server URL to the Raspberry Pi.
# Needs PI_HOST (e.g. user@192.168.137.1) and SSHPASS set in the environment.
: "${PI_HOST:?Set PI_HOST, e.g. user@192.168.137.1}"
: "${SSHPASS:?Set SSHPASS to the Pi password}"

while getopts 's:h' opt; do
  case "$opt" in
    s)
      arg="$OPTARG"
      sshpass -e ssh "$PI_HOST" -f "cd raspberrypi; echo '${OPTARG}' > forwarder.txt"
      
      ;;
   
    ?|h)
      echo "Usage: $(basename $0) [-s arg]"
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

