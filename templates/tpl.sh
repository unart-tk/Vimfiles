#!/bin/sh

#  [:VIM_EVAL:]expand("%:t")[:END_EVAL:] - 
#  
#  Copyright (c) [:VIM_EVAL:]strftime('%Y')[:END_EVAL:] [:VIM_EVAL:]authorname[:END_EVAL:] <[:VIM_EVAL:]authorsite[:END_EVAL:]>
#  [:VIM_EVAL:]strftime('%Y-%m-%d')[:END_EVAL:] / ... | ...
# 
set -u
set -e

OPTIONS="\
    foo [options]
    [-a|--all] [-f|--file <filename>] input
    --
    a     all files
    f     files not dirs
"
input=

die(){
	echo >&2 "$@"
	exit 1
}
usage(){
	die "Usage: $0 $USAGE"
}
case "$#" in 0) usage ;; esac

file= msg=
while [ $# -gt 0 ]; do  
  case "$1" in
	-a|--all) echo "all: yes";;
	-f|--file)
		shift
		if test "$#" = "0"; then
			die "error: option -f needs an argument"
		else 
			file="$1"
		fi
	;;
	-h|--help) usage;exit 1;;
	-*|--*) help;exit 1;;
	*) break;;
  esac
  shift     
done
if [ -n "$file" ];then
	echo "file: $file"
fi
if [ -n "$msg" ];then
	echo "msg: $msg"
fi

if [ "$#" == 1 ];then
	echo "input: $1"
fi
