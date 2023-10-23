def buggyfunc(x):
    y = x
    for i in range(x):
        y = y-1
        z = x/y
    return z

buggyfunc(20)

#%run debugme.py
#%pdb
#run debugme.py

'''
ipdb> p x                                                                                                                     
20

ipdb> p y                                                                                                                     
0

ipdb> p z                                                                                                                     
20.0

ipdb> p x/y                                                                                                                   
*** ZeroDivisionError: division by zero

ipdb> l                                                                                                                       
      1 def buggyfunc(x):
      2     y = x
      3     for i in range(x):
      4         y = y-1
----> 5         z = x/y
      6     return z
      7 
      8 buggyfunc(20)
ipdb> q

In []: %pdb
Automatic pdb calling has been turned OFF
'''
