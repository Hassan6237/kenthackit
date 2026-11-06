#!/bin/bash
# Copy the Raspberry Pi code to the device.
# Set the Pi's SSH details in your shell first (never commit them):
#   export PI_HOST=student@192.168.137.1
#   export SSHPASS='<pi password>'
: "${PI_HOST:?Set PI_HOST, e.g. user@192.168.137.1}"
: "${SSHPASS:?Set SSHPASS to the Pi password}"
sshpass -e scp -r raspberrypi/ "$PI_HOST:~"
