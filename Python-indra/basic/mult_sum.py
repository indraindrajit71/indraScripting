def numbers(n1, n2):
    product= n1 * n2
    sum= n1 + n2
    if product <= 1000:
        return "Product of the numbers is:" + str(product)
    else:
        return "Sum of the numbers is:" + str(sum)

def main():
    counter1= int(input("enter the 1st number"))
    counter2= int(input("enter the second number"))
    result=numbers(counter1, counter2)
    print(result)
if __name__ == "__main__":
    main()



