i = 1
x = 0
for i in range(10):
    x += 1
print(i)
print(x)

i = 1
x = 0
i, x

for i in range(10):
    x +=1
i,x

# very important!!!!!!!!!!!!!!!! def will not modify the global variable
i = 1
x = 0
def a_function(y):
    x = 0
    for i in range(y):
        x += 1
    return x
a_function(10)
print(i)
print(x)

x= a_function(10)
x

####################################################################################################################################################################

_a_global = 10 # a global variable

if _a_global >= 5:
    _b_global = _a_global + 5 # also a global variable
    
print("Before calling a_function, outside the function, the value of _a_global is", _a_global)
print("Before calling a_function, outside the function, the value of _b_global is", _b_global)

def a_function():
    _a_global = 4 # a local variable
    
    if _a_global >= 4:
        _b_global = _a_global + 5 # also a local variable
    
    _a_local = 3
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value of _b_global is", _b_global)
    print("Inside the function, the value of _a_local is", _a_local)
    
a_function()

print("After calling a_function, outside the function, the value of _a_global is (still)", _a_global)
print("After calling a_function, outside the function, the value of _b_global is (still)", _b_global)
print("After calling a_function, outside the function, the value of _a_local is ", _a_local)