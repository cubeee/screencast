#!/bin/sh
FILE=$(mktemp "/tmp/XXXXXX.gif")
echo "Recording to file '${FILE}'"
byzanz-window --cursor --rectangle $FILE
echo "Uploading..."

RET="$(curl -s -F "file=@$FILE" http://vgy.me/upload)"
URL="$(echo $RET | grep -Po '(?<="image":")[^"]*' | sed 's/\\//g')"
xdg-open $URL
rm -rf $FILE
