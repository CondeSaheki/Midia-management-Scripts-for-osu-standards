@ECHO off
setlocal
SET "name=%~dpn1"
ECHO -----
ECHO lembre-se 
ECHO 5mb + 10mb/min
ECHO incluindo audio hitsounds storyboads background
ECHO -----
ECHO Olhe essa calculadora caso nao saiba quais valores tentar
ECHO https://www.dr-lex.be/info-stuff/videocalc.html
ECHO -----
ECHO -----
ECHO Insira a resolucao (1280x720):
SET /P resolucao_a=
ECHO Insira o fps (23.976 ou 24000/1001):
SET /P fps_a=
ECHO Insira o average bitrate:
SET /P average_a=
ECHO Insira o bitrate para bufsize ( 1x a 2x o valor do average bitrate):
SET /P bufsize_a=
ECHO -----
ffmpeg -hide_banner -y -i %* -an -c:v libx264 -s %resolucao_a% -r %fps_a% -preset veryslow -b:v %average_a%k -maxrate %bufsize_a%k -tune fastdecode -profile:v high -bufsize %bufsize_a%k -pix_fmt yuv420p -map 0:0 -map_metadata -1 -pass 1 -f flv NUL
ffmpeg -hide_banner -i %* -an -c:v libx264 -s %resolucao_a% -r %fps_a% -preset veryslow -b:v %average_a%k -maxrate %bufsize_a%k -tune fastdecode -profile:v high -bufsize %bufsize_a%k -pix_fmt yuv420p -map 0:0 -map_metadata -1 -pass 2 "%name% video %average_a%k %bufsize_a%k.flv"
PAUSE
