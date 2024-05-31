#5 4 3 2 1
#4 3 2 1
#3 2 1
#2 1 
#1

original_range1=range(1,6)
rev_range1=reversed(original_range1)
for i in rev_range1:
    original_range2=range(1,i+1)
    rev_range2=reversed(original_range2)
    for j in rev_range2:
        print(j,end=' ')
    print()
        

