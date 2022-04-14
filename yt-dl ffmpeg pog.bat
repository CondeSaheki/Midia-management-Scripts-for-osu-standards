@ECHO off
setlocal

ECHO Insira o link:
SET /P link=
youtube-dl.exe %link% --extract-audio --audio-format best 
PAUSE