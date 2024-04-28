def verbing(s):
    if len(s) >= 3:
        if s[-3:] != 'ing':
            s= s + 'ing'
        else:
            s= s + 'ly'
    return s     
def main():
    userinput= input("enter the verb string:")
    result= verbing(userinput)
    print(result)
if __name__=="__main__":
    main()     
    
