def division(byfive):
    for i in byfive:
        if i % 5 == 0:
            print(i)
def main():
    number=input("enter the chain of numbers:")
    result=division(number)
    print(result)
if __name__ == "__main__":
    main()    

