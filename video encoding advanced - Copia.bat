@ECHO off
setlocal
ECHO %*
SET "name=%~dpn1"
ECHO "%name%"
ECHO ----------------------
ECHO Primeiramente Analisar fontes e coletar informaçoes relevantes como: framerate, resolução, bitrates, codecs (MediaInfo, Bitrate Viewer, Spek, spectro)
ECHO Saiba que: folder filesize 5mb + 10mb p min
ECHO ----------------------
pause
ECHO Insira o crf ( crf x +6 = bitrate_medio*1/2, crf x -6 = bitrate_medio*2 ), default = 23:
SET /P crfzada=
ECHO Insira o maxrate, default = 1333:
SET /P maxratezada=
ECHO Insira o bufsize ( 1x a 2x maxrate), default = 2666:
SET /P bufsizezada=
pause
ffmpeg -i %* -c:v libx264 -s 1280x720 -r 23.976 -preset veryslow -crf %crfzada% -maxrate %maxratezada%k -bufsize %bufsizezada%k -profile:v high -pix_fmt yuv420p -c:a libvorbis -q 6 -ac 2 -ar 44100 -map_metadata -1 "%name% output %crfzada%crf m %maxratezada%k b %buffsizezada%k.mkv"
PAUSE

