#!/usr/bin/env sh

MINE_FOLDER=~/mine;
RM_CHAR=":";

if [ -n "$*" ]; then
  #note $@ does not care of $IFS, $* does
  for file in "$@"; do
    if [ -e "$file" ]; then
      NEW_NAME=`basename "$file" | tr --delete "$RM_CHAR"`;
      NEW_PATH=$MINE_FOLDER/$NEW_NAME;
      echo "(*) Copying $file ==> $NEW_PATH";
      # copy and follow soft link if exists
      cp -L "$file" "$NEW_PATH";
    else
      >&2 echo 3rr0r: "$file": File doesn\'t exist;
    fi;
  done;
else
  >&2 echo "C0py wh4t?";
fi;