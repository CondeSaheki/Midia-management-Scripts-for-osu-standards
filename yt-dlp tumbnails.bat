@ECHO off
ECHO Insira o link:
SET /P link=
yt-dlp.exe %link% --write-all-thumbnails    
PAUSE
