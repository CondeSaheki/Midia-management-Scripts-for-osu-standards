@ECHO off
setlocal
ECHO %*
SET "name=%~dpn1"
ECHO "%name%"
pause
ffmpeg -i %* -filter:a volumedetect -f null /dev/null
ECHO Insira o maxvolume:
SET /P volume=
ffmpeg -i %* -vn -filter:a "volume=%volume%dB" -c:a libvorbis -q 1 -ac 2 -ar 44100 -map_metadata -1 "%name% output 1.ogg"
PAUSE