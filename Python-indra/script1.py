
def donuts(nuts):
    if nuts < 10:
        return 'Number of donuts: ' + str(nuts)
    else:
        return 'Number of donuts: many'
def main():
    entries= int (input("enter the no of donuts"))
    result= donuts(entries)
    print(result)
if __name__=="__main__":
    main()

    
        
