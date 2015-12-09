#!/bin/bash
	
alums=$1
passwdold=$2
passwdnew=$3
greatnum=1
cat $passwdold > $passwdnew
while read line
do
	num=`echo $line | cut -f2 -d":"`
	#Not empty num
	if test -n "$num"
	then
		if test $num -ge $greatnum
		then
			greatnum=$num
		fi
	fi
done < $passwdold

while read line
do
	greatnum=$(($greatnum+1))
	alum=$line":"$greatnum":/home/"$line":/bin/bash"
	echo $alum >> $passwdnew
done < $alums
