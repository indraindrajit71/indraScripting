echo -e "pls enter the value: \c"
read -r c
i=1
while [ $i -le 10 ]
do
j=`expr $c \* $i`
echo "$c * $i = $j"
i=`expr $i + 1`
done
