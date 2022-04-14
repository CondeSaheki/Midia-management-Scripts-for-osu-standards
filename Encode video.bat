@ECHO off
setlocal
SET "name=%~dpn1"
pause
ECHO Insira o average bitrate:
SET /P average_a=
ECHO Insira o bitrate para bufsize ( 1x a 2x o valor do average bitrate):
SET /P bufsize_a=
pause
ffmpeg -hide_banner -y -i %* -an -c:v libx264 -s 1280x720 -r 23.976 -preset veryslow -b:v %average_a%k -maxrate %bufsize_a%k -tune fastdecode -profile:v high -bufsize %bufsize_a%k -pix_fmt yuv420p -map 0:0 -map_metadata -1 -pass 1 -f flv NUL
ffmpeg -hide_banner -i %* -an -c:v libx264 -s 1280x720 -r 23.976 -preset veryslow -b:v %average_a%k -maxrate %bufsize_a%k -tune fastdecode -profile:v high -bufsize %bufsize_a%k -pix_fmt yuv420p -map 0:0 -map_metadata -1 -pass 2 "%name% video %average_a%k %bufsize_a%k.flv"
PAUSE
