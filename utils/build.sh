#!/usr/bin/env bash
DATE=$(date +%Y%m%d)

cd ~/cm
mkdir logs
rm -rf out
repo sync -j12 2>&1 | tee logs/repo_$DATE.log
### generate changelog

### apt-get install kbtin
/build/android_utils/utils/generate_changelog.sh

source build/envsetup.sh
brunch victara 2>&1 |tee logs/build_$DATE.log > /dev/null
