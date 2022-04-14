@ECHO off
ECHO Insira o link:
SET /P link=
yt-dlp.exe %link% --no-playlist -f bestvideo 
PAUSE
