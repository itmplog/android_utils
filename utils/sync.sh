#!/bin/bash

cd /ankp/dev
for i in $(ls --hide=android --hide=sync.sh)
do
	cd $i
	echo $(pwd)
	git pull cm cm-13.0:cm-13.0
	#git pull cm cm-13.0:mm
	git merge cm-13.0 mm
	git push ankp --all
	cd ..
done
