def foo(x):
    x *= x
    print(x)
    return x 

%whos

foo(2)

y = foo(2)
y
type(y)

def foo(x):
    x *= x
    print(x)
    #return x 
y = foo(2)
y 
type(y)
print(y)

def foo(x):
    x *= x # same as x = x*x
    print(x)

foo(2)


