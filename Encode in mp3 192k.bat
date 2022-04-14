@ECHO off
setlocal
SET "name=%~dpn1"
ffmpeg -i %* -vn -filter:a volumedetect -f null /dev/null
ECHO Insira o inverso de maxvolume:
SET /P volume=
ffmpeg -hide_banner -i %* -filter:a "volume=%volume%dB" -vn -c:a libmp3lame -ar 44100 -ac 2 -b:a 192k -joint_stereo 0 -map_metadata -1 "%name% 192k.mp3"
PAUSE
