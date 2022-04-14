@ECHO off
setlocal

ECHO %*
SET "name=%~dpn1"
ECHO "%name%"
pause
ffmpeg.exe -i %* -filter:a volumedetect -f null /dev/null
ECHO Insira o maxvolume:
SET /P volume=
ffmpeg -i %* -filter:a "volume=%volume%dB" -vn -c:a libmp3lame -ar 44100 -ac 2 -b:a 320k -joint_stereo 0 -map_metadata -1 "%name% output 320.mp3"