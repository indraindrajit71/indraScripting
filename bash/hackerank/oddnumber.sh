#!/bin/bash

for i in {1..99}; do
result=$(expr $i % 2)
if [ $result -ne 0 ];
then
echo $i
fi
done
