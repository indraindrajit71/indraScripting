## Replace "testfile" with IP address if you have##
for i in `cat test`
do
ping -c 1 $i
result=`echo $?`

if [ $result -gt 1 ]; then
echo "host is unreachable"
else
echo "host is reachable"
fi
done
