def listofstring(strings):
    count= 0
    for i in strings:
        if len(i) >=2 and i[0] == i[-1]:
            count = count + 1
    return count
strings= ['level', 'hello', 'radar', 'world', 'pop']
result= listofstring(strings)
print("count meeting the condition is:",result )
     
        
