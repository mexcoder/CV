@echo off

SetLocal

set lang=en es
set theme=banking casual classic oldStyle

if not exist "auxFiles/" call makeaux
if not exist "out/" call makeout rem lol! this was not intentional

FOR %%c in (%lang%) do (
    if not exist "out/%%c" call :makelang %%c
)

FOR %%b in (%lang%) DO (
    FOR %%a in (%theme%) DO (
      pdflatex "\def\lang{%%b}\input cv_%%a.tex" -aux-directory=auxFiles -output-directory=out/%%b --jobname=cv_%%a_%%b
    )
)

rem old way
rem pdflatex cv_banking.tex -aux-directory=auxFiles -output-directory=out/es
rem pdflatex cv_casual.tex -aux-directory=auxFiles -output-directory=out/es
rem pdflatex cv_classic.tex -aux-directory=auxFiles -output-directory=out/es
rem pdflatex cv_oldStyle.tex -aux-directory=auxFiles -output-directory=out/es

goto fin

:makeout

echo No exite el directorio de salida, creandolo
mkdir "out"
exit /b

:makelang
echo no exite el directorio de salida %1, creandolo
mkdir "out/%1"
exit /b


:makeaux
echo no existe el directorio auxiliar, creandolo
mkdir auxFiles
exit /b

:fin
rem echo "borrando el directorio temporal"
rem rm 
echo terminado