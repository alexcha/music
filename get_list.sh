#!/bin/bash
echo \#LastUpdate: `date +%Y/%m/%d/%H:%M:%S`
echo "\#"
echo [playlist]
 

id_one=(`curl -s "http://saycast.sayclub.com/saycast/index/station?kind=genrelist&catGenre=mTR&page=1" | grep ic_onairS.gif  | awk '{print $2}'  | awk -F "/" '{print $7 }' | sed 's/[<>,]/ /g' | tr -d '"' | awk '{print $1}'`)
id_two=(`curl -s "http://saycast.sayclub.com/saycast/index/station?kind=genrelist&catGenre=mTR&page=2" | grep ic_onairS.gif  | awk '{print $2}'  | awk -F "/" '{print $7 }' | sed 's/[<>,]/ /g' | tr -d '"' | awk '{print $1}'`)
name_one=(`curl -s "http://saycast.sayclub.com/saycast/index/station?kind=genrelist&catGenre=mTR&page=1" | grep ic_onairS.gif  | awk '{print $2}'  | awk -F "/" '{print $7 }' | sed 's/[<>,]/ /g' | tr -d '"' | awk '{print $2}'`)
name_two=(`curl -s "http://saycast.sayclub.com/saycast/index/station?kind=genrelist&catGenre=mTR&page=2" | grep ic_onairS.gif  | awk '{print $2}'  | awk -F "/" '{print $7 }' | sed 's/[<>,]/ /g' | tr -d '"' | awk '{print $2}'`)

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
