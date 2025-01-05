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

echo "Moving metadata files to /output/"
mv *.{description,jpg} /output/
# add formatting to the JSON info file
for info in *.json; do
    jq -M . "$info" > "/output/$info"
done

if [[ $2 == "notranscode" ]]; then
    echo "Moving video file to /output/ untranscoded"
    mv *.mp4 /output/
else
    echo "Transcoding video file to reduce size..."
    for video in *.mp4; do
        HandBrakeCLI --preset "Fast 1080p30" \
                     --previews 1:0 \
                     --optimize \
                     --all-audio \
                     --input "./$video" \
                     --output "/output/$video"
        mv "./$video" "/output/$video.orig"
    done
fi
