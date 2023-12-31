# Make sure we are in week2/code directory
# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )
# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.
Month_Rainfall_Greater_than_100mm = [(month,rainfall) for month,rainfall in rainfall if rainfall > 100]
print(Month_Rainfall_Greater_than_100mm)
# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 
Month_Names = [month_name for month_name,rainfall in rainfall if rainfall <50]
print(Month_Names)

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 
Month_Rainfall_For_1 = []
for month,rain in rainfall:
    if rain > 100:
        Month_Rainfall_For_1.append((month,rain))
print(Month_Rainfall_For_1)

month_names = []
for month,rain in rainfall:
    if rain < 50:
        month_names.append(month)
print(month_names)






# A good example output is:
#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
# [('JAN', 111.4), ('FEB', 126.1), ('AUG', 140.2), ('NOV', 128.4), ('DEC', 142.2)]
# ... etc.

