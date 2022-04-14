@ECHO off
ECHO ---------------
ECHO esse script convertera todos os mp3, wav e ogg em ogg 6
ECHO ---------------
set PATH_FFMPG = %cd%
ECHO %PATH_FFMPG%

pause
ECHO Insira o caminho da pasta a ser convertida:
SET /P volume= 



cd "PATH"
FOR /F "tokens=*" %G IN ('dir /b *.wav') DO PATH_FFMPG\ffmpeg -i "%G" -c:a libvorbis -q 6 -ac 2 -ar 44100 -map 0:0 -map_metadata -1 "%~nG.ogg"
FOR /F "tokens=*" %G IN ('dir /b *.mp3') DO PATH_FFMPG\ffmpeg -i "%G" -c:a libvorbis -q 6 -ac 2 -ar 44100 -map 0:0 -map_metadata -1 "%~nG.ogg"
FOR /F "tokens=*" %G IN ('dir /b *.ogg') DO PATH_FFMPG\ffmpeg -i "%G" -c:a libvorbis -q 6 -ac 2 -ar 44100 -map 0:0 -map_metadata -1 "%~nG.ogg"




PAUSE