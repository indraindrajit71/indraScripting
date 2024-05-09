read X
read Y

if [ $X -gt $Y ]; then
echo "X is greater than Y"
elif [ $Y -gt $X ]; then
echo "X is less than Y"
else
echo "X is equal to Y"
fi

