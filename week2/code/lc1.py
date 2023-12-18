# Make sure we are in the 'week2/code' directory 
birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 
'''
Three methods to print 'string' + variable
1. %s
2. f"" 
3. add a comma ','

############################################################################################################
Two methods to make a list comprehension
1. []
   for loop
2. [for loop]
'''

# This is the solution for the first question
Latin_Names = [ name[0] for name in birds]
print(f'Latin_Names: {Latin_Names} ')


# This is the solution for the second question
Common_Names = [ name[1] for name in birds]
print(f'Common_Names: {Common_Names} ')


#This is the solution for the third question
Mean_Body_Masses = [ name[2] for name in birds]
print(f'Mean_Body_Masses: {Mean_Body_Masses} ')



# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 

Latin_Names = []
for i in range(0,5):
    Latin_Names.append(birds[i][0])
print('Latin_Names: %s' %Latin_Names)


Common_Names = []
for k in range(0,5):
    Common_Names.append(birds[k][1])
print(f'Common_Names: {Common_Names} ')


Mean_Body_Masses = []
for p in range(0,len(birds)):
    Mean_Body_Masses.append(birds[p][2])
print('Mean_Body_Masses: ' , Mean_Body_Masses)    


# A nice example out out is:
# Step #1:
# Latin names:
# ['Passerculus sandwichensis', 'Delichon urbica', 'Junco phaeonotus', 'Junco hyemalis', 'Tachycineata bicolor']
# ... etc.
 