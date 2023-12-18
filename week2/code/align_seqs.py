# make sure we are in the week2/code directory

f = open('../data/DNA_Sequence.txt', 'r')

# read the .txt document and make it to be a string which names 'content'
content = f.readlines()

# it is said that it is a good habit to use f.close() to close the document after we use that 
f.close()

# use the two sequences as the example shows
seq1 = content[1].strip()
seq2 = content[2].strip()




# Assign the longer sequence s1, and the shorter to s2
# l1 is length of the longest, l2 that of the shortest

l1 = len(seq1)
l2 = len(seq2)
if l1 >= l2:
    s1 = seq1
    s2 = seq2
else:
    s1 = seq2
    s2 = seq1
    l1, l2 = l2, l1 # swap the two lengths

# A function that computes a score by returning the number of matches starting
# from arbitrary startpoint (chosen by user)
def calculate_score(s1, s2, l1, l2, startpoint):
    matched = "" # to hold string displaying alignements
    score = 0
    for i in range(l2):
        if (i + startpoint) < l1:
            if s1[i + startpoint] == s2[i]: # if the bases match
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"

    # some formatted output
    print("." * startpoint + matched)           
    print("." * startpoint + s2)
    print(s1)
    print(score) 
    print(" ")

    return score

# Test the function with some example starting points:
# calculate_score(s1, s2, l1, l2, 0)
# calculate_score(s1, s2, l1, l2, 1)
# calculate_score(s1, s2, l1, l2, 5)

# now try to find the best match (highest score) for the two sequences
my_best_align = None
my_best_score = -1

for i in range(l1): # Note that you just take the last alignment with the highest score
    z = calculate_score(s1, s2, l1, l2, i)
    if z > my_best_score:
        my_best_align = "." * i + s2 # think about what this is doing!
        my_best_score = z 
      
print(my_best_align)
print(s1)
print("Best score:", my_best_score)


g = open('../results/DNA_Sequence_Output.txt', 'w')
g.write(my_best_align)
g.write("\n")
g.write(s1)
g.write('\n')
g.write("Best score: ")
g.write(str(my_best_score))
