#!/bin/bash
cont=1
for i
do
	if test $cont -eq $#
	then
		a="."$i
	else
		file=$i
		cont=$(($cont+1))
	fi
done

cd $a
cont=1

for i
do
	if test $cont -ne $#
	then
		while read file
		do
			photo=`find | egrep *$file`
			lengthname=$((${#photo}-${#file}))
			echo $photo2
			bytes=`stat --printf="%s" "$photo"`
			photojpg=${photo%.*}".jpg"
			echo "$photo: $bytes  ======>  $photojpg"
			`convert $photo $photojpg`			
		done < $i
		cont=$(($cont+1))
	fi
done
