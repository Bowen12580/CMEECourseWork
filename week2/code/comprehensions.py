x= [i for i in range(10)]
print(x)

# the above is the same as the below one

x = []
for i in range (10):
    x.append(i)
print(x)

x= [i.lower() for i in ['LIST', 'COMPREHENSION','ARE','COOL']]
print(x)

x= ['LIST', 'COMPREHENSION','ARE','COOL']
for i in range(len(x)):
    x[i] = x[i].lower(

    )
print(x)

x = ['LIST', 'COMPREHENSION','ARE','COOL']
x_new = []
for i in x:
    x_new.append(i.lower())
print(x_new)

matrix = [[1,2,3],[4,5,6],[7,8,9]]
flattened_matrix = []
for row in matrix:
    for n in row:
        flattened_matrix.append(n)
print(flattened_matrix)

matrix = [[1,2,3],[4,5,6],[7,8,9]]
flattened_matrix = [n for row in matrix for n in row]
print(flattened_matrix)

flattened_matrix = [n
                    for row in matrix
                    for n in row]
print(flattened_matrix)

words = ["These", "are", "some", "words"]

first_letters = set()
for w in words:
    first_letters.add(w[0])

print(first_letters)

type(first_letters)