#!/bin/bash
echo "#"
echo "# 엄마/아빠를 위한~"
echo \# LastUpdate: `date -d +9hour "+%Y-%m-%d %H:%M"`

echo > list2.txt
for i in `cat list.txt`
do
        ck=`curl -s $i.inlive.co.kr/live/listen.pls | grep  File1\=http`

       if [ $? -eq 0 ]

       then

  #curl -s $i.inlive.co.kr/live/listen.pls | grep -A 1 File1\=http | iconv -f euc-kr -t utf-8  >> list2.txt
  curl -s $i.inlive.co.kr/live/listen.pls | grep -A 1 File1\=http >> list2.txt

else
       echo ''
       fi
done

id_one=(`cat list2.txt| grep File1\=http |awk -F 'File1=' '{for (i=2; i<=NF; i++) print $i}'` )
name_one=(`cat list2.txt| grep Title1| awk -F 'Title1=' '{for (i=2; i<=NF; i++) print $i}'| sed  's/ /_/g'`)

id=(${id_one[@]} )
name=(${name_one[@]} )

echo [playlist]
length=${#id[@]}
for j in `seq 0 $(($length-1))`
do
        echo "File$(($j+1))=${id[$j]}"
        echo "Title$(($j+1))=${name[$j]}"
done


echo NumberOfEntries=${#id[@]}
echo Version=2
