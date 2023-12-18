#make sure we are in the 'week2/code' directory

import csv
import sys

#Define function
def is_an_oak(name):
    """ Returns True if name is starts with 'quercus' """
    """ 
    Returns True if name starts with 'quercus'.
    
    >>> is_an_oak('Fraxinus excelsior')
    False
    >>> is_an_oak('Quercuss')
    True
    >>> is_an_oak('Quercusssss')
    True
    >>> is_an_oak('Quercas')
    False
    >>> is_an_oak('Uuercus')
    False
    """
    if name.lower().startswith('quercus'):
        return True
    else:
        return False
        
    

def main(argv): 
    f = open('../data/TestOaksData.csv','r')
    g = open('../results/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]):
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]])    
    f.close()
    g.close()
    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)

