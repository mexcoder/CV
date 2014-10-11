#!/bin/sh

lang="en es"
theme="banking casual classic oldStyle"

if [ ! -d "auxFiles/" ]; then
  echo no existe el directorio auxiliar, creandolo
  mkdir "auxFiles"
fi

if [ ! -d "out/" ]; then
  echo No exite el directorio de salida, creandolo
  mkdir "out"
fi

for l in $lang 
do
	if [ ! -d "out/$l" ]; then
		echo no exite el directorio de salida $l, creandolo
		mkdir "out/$l"
	fi
done

for l in $lang 
do
    for t in $theme
	do
      pdflatex "\def\lang{$l}\input cv_$t.tex" -aux-directory=auxFiles -output-directory=out/$l --jobname=cv_$t\_$l
	done
done


#echo borrando el directorio temporal

echo terminado