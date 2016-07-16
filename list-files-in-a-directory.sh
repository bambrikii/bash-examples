#!/bin/bash

for f in `ls ./` ; do
	echo $f
	if [ -e $f ]; then
		echo "$f exists"
	fi
done
