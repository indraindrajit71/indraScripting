def not_bad(s):
    n= s.find("not")
    b= s.find("bad")
    if n!= -1 and b!= -1 and b>n:
        s= s[:n] + "good" + s[b+3:]
    return s
def main():
    userinput= input("enter the quote:")
    result= not_bad(userinput)
    print(result)
if __name__=="__main__":
    main()       
    
        
