taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a python script to populate a dictionary called taxa_dic derived from
# taxa so that it maps order names to sets of taxa and prints it to screen.
# 
# An example output is:
#  
# 'Chiroptera' : set(['Myotis lucifugus']) ... etc. 
# OR, 
# 'Chiroptera': {'Myotis  lucifugus'} ... etc

#### Your solution here #### 
# maker sure not we are in the week2/code directory
taxa_dic = {}

for i in range(0,len(taxa)):
    sets, order_names = taxa[i]
    if order_names not in taxa_dic:
        taxa_dic[order_names] = set()
    taxa_dic[order_names].add(sets)

for order_names in taxa_dic:
    print(f"'{order_names}': {taxa_dic[order_names]}")

       
# Now write a list comprehension that does the same (including the printing after the dictionary has been created)  
#### Your solution here #### 

# maker sure not we are in the week2/code directory
taxa_dic = {order_names : set(sets for sets, order in taxa if order == order_names) for order_names in set(order for sets, order in taxa)}
for order_name in taxa_dic:
    print(f"'{order_name}': {taxa_dic[order_name]}")