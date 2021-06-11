find "singles - hun alter"/ -type f -exec bash -c 'ffmpeg -i "$0" "$0.COPY.mp3" && mv "$0.COPY.mp3" /media/ford/PENDRIVE_BACKUP/___MP3_copy/' '{}' \;
