#!/bin/bash
echo "#"
echo "# 엄마/아빠를 위한~"
echo \# LastUpdate: `date -d +9hour "+%Y-%m-%d %H:%M"`

echo [playlist]

one=`curl -s "http://saycast.sayclub.com/saycast/index/station?kind=genrelist&catGenre=mTR&page=1" -o  1.txt`
sleep 10
two=`curl -s "http://saycast.sayclub.com/saycast/index/station?kind=genrelist&catGenre=mTR&page=2" -o  2.txt`

id_one=(`cat 1.txt | grep ic_onairS.gif  | awk '{print $2}'  | awk -F "/" '{print $7 }' | sed 's/[<>,]/ /g' | tr -d '"' | awk '{print $1}'`)
name_one=(`cat 1.txt | grep ic_onairS.gif  | awk '{print $2}'  | awk -F "/" '{print $7 }' | sed 's/[<>,]/ /g' | tr -d '"' | awk '{print $2}'`)

name_two=(`cat 2.txt | grep ic_onairS.gif  | awk '{print $2}'  | awk -F "/" '{print $7 }' | sed 's/[<>,]/ /g' | tr -d '"' | awk '{print $2}'`)
id_two=(`cat 2.txt | grep ic_onairS.gif  | awk '{print $2}'  | awk -F "/" '{print $7 }' | sed 's/[<>,]/ /g' | tr -d '"' | awk '{print $1}'`)

id=(${id_one[@]} ${id_two[@]} )
name=(${name_one[@]} ${name_two[@]} )

length=${#id[@]}
for j in `seq 0 $(($length-1))`
do
echo "File$(($j+1))=http://${id[$j]}.saycast.com"
echo "Title$(($j+1))=${name[$j]}"
done


echo NumberOfEntries=${#id[@]}
echo Version=2
