def front_x(strings):
    x_first= []
    other= []
    for i in strings:
        if i.startswith('x'):
            x_first.append(i)
        else:
            other.append(i)
    return sorted(x_first) + sorted(other)

strings1= ['mix', 'xyz', 'apple', 'xanadu', 'aardvark']
result= front_x(strings1)
print(result)
            
