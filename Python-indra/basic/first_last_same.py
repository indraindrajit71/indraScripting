def numbers(list):  
    first_num = list[0]
    last_num = list[-1]
    if first_num == last_num:
        return True
    else:
        return False
num = [20, 23, 45, 67, 20]
result = numbers(num)
print(result)
         

