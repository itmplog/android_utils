#!/bin/bash

cd /ankp/dev
for i in $(ls --hide=android --hide=android_external_okhttp  --hide=android_frameworks_volley --hide=sync.sh)
do
	cd $i
	echo $(pwd)
	git pull cm cm-13.0:cm-13.0
	#git pull cm cm-13.0:mm
	git merge cm-13.0 mm
	git push ankp --all
	cd ..
done

for i in android_external_okhttp android_frameworks_volley
do
	cd $i
	git checkout master
	git pull android  master:master
	#git pull android  master:mm
	git checkout cm-13.0
	git pull cm cm-13.0:cm-13.0
	git push ankp --all
	cd ..
done
