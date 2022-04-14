@ECHO off
setlocal
SET "name=%~dpn1"
ffmpeg -i %* -filter:a volumedetect -f null /dev/null
ECHO Insira inverso do maxvolume:
SET /P volume=
ffmpeg -hide_banner -i %* -vn -filter:a "volume=%volume%dB" -c:a libvorbis -q 6 -ac 2 -ar 44100 -map_metadata -1 "%name% quality 6.ogg"
PAUSE
