#!/usr/bin/env python3

"""Some functions exemplifying the use of control statements"""
# docstrings are considered part of the running code (normal comments are
# stripped). Hence, you can access your docstrings at run time.
# Done by Bowen Duan
__author__ = 'Samraat Pawar (s.pawar@imperial.ac.uk)'
__version__ = '0.0.1'
# For this question I use the input
# Make sure we are in the week2/code directory
import sys


def foo_1(x):
    """Calculate the square root of a number x."""
    return f"Square root of {x} is {x ** 0.5}"


def foo_2(x, y):
    """Find the maximum value between two numbers x and y."""
    if x > y:
        return f" Bigger is {x}"
    return f"Bigger is {y}"


def foo_3(x, y, z):
    """Sort three numbers x, y, and z in descending order."""
    if x > y:
        tmp = y
        y = x
        x = tmp
    if y > z:
        tmp = z
        z = y
        y = tmp
    if x > y:
        tmp = y
        y = x
        x = tmp
    return f" After sorting is {[x, y, z]}"


def foo_4(x):
    """Calculate the factorial of a number x."""
    result = 1
    for i in range(1, x + 1):
        result = result * i
    return f"The factorial of {x} is {result}"


def foo_5(x):
    """Calculate the factorial of a number x using recursion."""
    if x == 1:
        return 1
    return x * foo_5(x - 1)


def foo_6(x):
    """Calculate the factorial of a number x using a while loop."""
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return f"The factorial of {x} is {facto}"


def main(argv):
    # take arguments from user (I do not understand I just need to print inside the funciton or need to set the input. This time I choose to use input)
    user_input_1 = int(input("Please enter an integer to calculte square root："))

    result_1 = foo_1(user_input_1)
    print(f"Result of foo_1({user_input_1}) is：{result_1}")


    user_input_2 = int(input("Please enter an different integer："))
    result_2 = foo_2(user_input_1, user_input_2)
    print(f"Result of foo_2({user_input_1}, {user_input_2}) is：{result_2}")


    user_input_3 = int(input("Please enter an different integer from previous inputs for further calculation："))
    result_3 = foo_3(user_input_1, user_input_2, user_input_3)
    print(f"Result of foo_3({user_input_1}, {user_input_2}, {user_input_3}) is：{result_3}")

    user_input_4 = int(input("Please enter an integer to calculate factorial："))
    result_4 = foo_4(user_input_4)
    print(f"Result of foo_4({user_input_4}) is：{result_4}")


    result_5 = foo_5(user_input_4)
    print(f"Result of foo_5({user_input_4}) is：{result_5}")

    
    result_6 = foo_6(user_input_4)
    print(f"Result of foo_6({user_input_4}) is：{result_6}")

    return 0


if __name__ == "__main__":
    status = main(sys.argv)
    sys.exit(status)