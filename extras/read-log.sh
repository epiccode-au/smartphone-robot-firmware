#! /bin/bash

dev=${BOT_SERIAL_DEV:-/dev/ttyACM0}
stty -F "$dev" 115200 cs8 raw -cstopb -parenb -echo
timeout 0.5 cat "$dev" &
echo -ne '\xfe\x00xx\xff' > "$dev"
wait
