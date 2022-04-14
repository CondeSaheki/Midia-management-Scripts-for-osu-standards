@ECHO off
setlocal

ECHO %*
SET "name=%~dpn1"
ECHO "%name%"
pause
ffmpeg -i %* -filter:a volumedetect -f null /dev/null
ECHO Insira o maxvolume:
SET /P volume=
ffmpeg -i %* -vn -c:a copy -map_metadata -1 "%name% TESTE.mp4"
PAUSE