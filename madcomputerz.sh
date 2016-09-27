#!/bin/bash
if test $# -ne 1
then
	echo "Numero de argumentos erroneo"
	exit 1
fi

if test  ! -r $1
then
	echo "No se puede leer el fichero"
	exit 1
fi

while read cmd fin fout 
do
	#ejecuto cmd con fin como stdin y el resultado lo dejo en fout
	$cmd < $fin > $fout
	#$? es el status del comando previamente ejecutado, el test devolvera
	# 1(true) si $? es igual o 0 (false) si $? es distinto de 0
	if test $? -eq 0
	then
		echo "Ejecucion correcta"
	else
		echo "Ejecucion incorrecta"
	fi
done < "$1"

