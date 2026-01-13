#! /bin/bash

dev=${BOT_SERIAL_DEV:-/dev/ttyACM0}
stty -F "$dev" 115200 cs8 -cstopb -parenb
echo -ne '\xfe\x00xx\xff' > "$dev"
timeout 0.5 cat "$dev"
