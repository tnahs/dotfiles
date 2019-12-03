#!/bin/bash

# https://gist.github.com/lord-carlos/74739d59ebae63ad842d84d3ebb72633
# youtube-dl --external-downloader aria2c  --external-downloader-args "-c -j 5 -x 10 --summary-interval=0" "$@"

#     -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \


# # Download YouTube playlist audio in separate directory
# youtube-dl \
#     -o '%(playlist)s/%(playlist_index)s - %(uploader)s - %(title)s.%(ext)s' \
#     -f 'bestaudio[ext=m4a]/best[ext=mp4]/best' \
#     --continue \
#     {YOUTUBE ADDRESS}

# --playlist-reverse \

# # Download all videos of YouTube channel/user into a directory
# $ youtube-dl
#     -o '%(channel)s/%(title)s.%(ext)s' \
#     {YOUTUBE ADDRESS}

# https://github.com/ytdl-org/youtube-dl/blob/master/README.md

# Download YouTube playlist videos in separate directory
# youtube-dl \
#     --output "%(playlist)s/%(playlist_index)s - %(uploader)s - %(title)s - %(id)s.%(ext)s" \
#     --continue \
#     --add-metadata \
#     --write-info-json \
#     --embed-subs \
#     --all-subs \
#     --external-downloader aria2c \
#         --external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M" \
#     "$@" # URL


youtube-dl \
    --output "%(uploader)s - %(title)s - %(id)s.%(ext)s" \
    --continue \
    --add-metadata \
    --embed-subs \
    --all-subs \
    --external-downloader aria2c --external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M" \
    "$@" # URL

# https://github.com/ytdl-org/youtube-dl/issues/11287#issuecomment-262715401
    # --write-info-json \
    # --hls-prefer-native \

# youtube-dl \
#     --output "%(uploader)s - %(title)s - %(id)s.%(ext)s" \
#     --continue \
#     --add-metadata \
#     --embed-subs \
#     --all-subs \
#     "$@" # URL