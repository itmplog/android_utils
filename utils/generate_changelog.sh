#!/usr/bin/env bash
##
# git config alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
#
# Need ansi2txt & ansi from [KBtin MUD client ](https://github.com/kilobyte/kbtin)
##

REPO=/build/cm
LOGDIR=/build/cm/logs
DATE=$(date "+%Y-%m-%d")
CHANGELOG=change-$DATE

if [ ! -e $LOGDIR ]
then
	mkdir -p $LOGDIR
fi

cd $REPO
repo forall -c 'L=$(git lg --since 1day ); if [ "n$L" != "n" ]; then echo; echo "   * $REPO_PATH"; git lg --since 1day ; fi' |tee $LOGDIR/lg.log

cat $LOGDIR/lg.log | ansi2txt | nl > $LOGDIR/$CHANGELOG.txt
cat $LOGDIR/lg.log | ansi2html > $LOGDIR/$CHANGELOG.html
