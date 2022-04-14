@ECHO off
setlocal

ECHO %*
SET "name=%~dpn1"
ECHO "%name%"
pause
ffmpeg -i %* -filter:a volumedetect -f null /dev/null
ECHO Insira o maxvolume:
SET /P volume=
ffmpeg -i %* -filter:a "volume=%volume%dB" -vn -c:a libmp3lame -ar 44100 -ac 2 -b:a 70k -joint_stereo 0 -map_metadata -1 "%name% 70.mp3"

ffmpeg -i %* -vn -c:a libmp3lame -ar 44100 -ac 2 -q:a 8 -joint_stereo 0 -map_metadata -1 "%name%.mp3"
PAUSE