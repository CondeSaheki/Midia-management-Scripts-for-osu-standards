@ECHO off
setlocal
ECHO %*
SET "name=%~dpn1"
ECHO "%name%"
pause
ffmpeg -i %* -an -c:v libx264 -s 1280x720 -r 23.976 -preset veryslow -crf 23 -maxrate 1333k -bufsize 2666k -profile:v high -pix_fmt yuv420p -map 0:0 -map_metadata -1 "%name% output 23crf m 1333k b 2666k.flv"
PAUSE