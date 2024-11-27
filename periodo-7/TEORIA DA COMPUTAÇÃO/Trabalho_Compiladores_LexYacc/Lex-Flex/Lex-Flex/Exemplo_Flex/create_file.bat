@ECHO OFF
SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion


echo !ESC![92mCompilador Lexo executavel!ESC![0m
echo: 
echo !ESC![92mAutor: Guilherme Guimaraes Dantas!ESC![0m
echo: 

echo !ESC![101;93mPix: guitilan0@gmail.com!ESC![0m
echo: 

TIMEOUT /T 10

cls

echo: 
echo Insira o nome do seu arquivo .l (ele deve estar na mesma pasta): 
set /p name=
echo Your name is %filename%

echo:"CRIANDO O ARQUIVO lex.yy.c"
flex %name%
echo:

echo Qual nome do arquivo compilador deseja: 
set /p compilername=
echo:

echo:"Compilando o testador chamado" %compilername%
pause
gcc lex.yy.c -o %compilername% -lfl
echo:

echo:"Fazendo a analise lexica"
pause
%compilername% < dados.txt
echo:

pause