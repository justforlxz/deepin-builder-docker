#!/usr/bin/bash

cd $1

if [[ x$1 == "xlock" ]];
then
    for (( ; ; ))
    do
      rm -rf push-sleep
      git clone git@github.com:deepin-community/push-sleep.git -b arch
      cd push-sleep
      if [[ -f "lock" ]];
      then
        sleep 10
        continue
      else
        touch lock
        git add lock
        git commit -m "lock arch"
        git push || continue
        break
      fi
    done
fi

if [[ x$1 == "xunlock" ]];
then
    cd push-sleep
    if [[ -f lock ]]; then
      git reset HEAD^
      rm -rf lock
      git push -f
    fi
fi

rm -rf push-sleep || true
