def adjacent_num(nums):
    result= []
    for i in nums:
        if len(result) == 0 or i != result[-1]:
            result.append(i)
    return result        
numbers= [1,2,2,3,3,4,5,5,6]
result1=adjacent_num(numbers)
print(result1)          
