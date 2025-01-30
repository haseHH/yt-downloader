#!/bin/bash

# provide shell if no args are given
if [ $# -lt 1 ]; then
    echo "No URL was provided, starting interactive shell."
    cd ~
    /bin/bash
    exit 0
fi

URL=$1
echo "Downloading content from: $URL"
yt-dlp $URL

# format the JSON info file
for info in *.json; do
    jq -M . "./$info" | sponge "./$info"
done
