#!/bin/sh
refname="$1"
oldrev="$2"
newrev="$3"
if[-z "$GIT_DIR"]; then
  echo "don't run this script from the command line."
  exit 1
fi
if[-z "$refname" -o -z "$oldrev" -o -z "$newrev"]; then
  echo "usage: $0 <ref> <oldrev> <newrev>"
  exit 1
fi
case "$refname" in
     #不同的分支名，个人视自己的情况而定
      refs/heads/dev)
         if[-d "/data/git-data/zh" -a -x "/data/git-data/zh" ];then
         cd /data/git-data/zh
         git pull origin dev
         fi
         exit 2
         ;;
      refs/heads/boris)
         if[-d "/data/git-data/zh-boris" -a -x "/data/git-data/zh-boris" ];then
         cd /data/git-data/zh-boris
         git pull origin boris
         fi
         exit 2
         ;;
      *)
         echo "***update hook:unknow type of update to ref $refname of type"
         exit 1
         ;;
 esac
         # ---finished
         exit 0