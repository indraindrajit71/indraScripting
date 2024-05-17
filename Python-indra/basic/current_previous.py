def numbersum():
    previous_num=0
    for i in range(1,11):       
        sum=previous_num + i
        print("current number:", i, "previous number:", previous_num, "sum is:", sum)
        previous_num=i
numbersum()