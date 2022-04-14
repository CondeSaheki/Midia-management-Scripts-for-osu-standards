@ECHO off
setlocal

ECHO Insira o link:
SET /P link=
youtube-dl.exe %link% --no-playlist -f bestvideo 
PAUSE