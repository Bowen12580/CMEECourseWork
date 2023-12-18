#!/usr/bin/env python3

"""Some functions exemplifying the use of control statements"""
# docstrings are considered part of the running code (normal comments are
# stripped). Hence, you can access your docstrings at run time.
__author__ = 'Bowen Duan (bd623@imperial.ac.uk)'
__version__ = '0.0.1'

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
        result *= i
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
        facto *= x
        x -= 1
    return f"The factorial of {facto}"


# Test calls
print(foo_1(4))
print(foo_2(4, 7))
print(foo_3(3, 1, 2))
print(foo_4(5))
print(foo_5(5))
print(foo_6(5))


if __name__ == "__main__":
    sys.exit(0)
