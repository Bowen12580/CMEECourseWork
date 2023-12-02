import pandas as pd
import seaborn as sns

# Read the dataset
data = pd.read_csv("../data/LogisticGrowthData.csv")

# Add the ID column
data.insert(0, "ID", data.Species + "_" + data.Temp.map(str) + "_" + data.Medium + "_" + data.Citation)

# Filter the subset based on conditions
condition = (
    (data['Time'] >= 0) &  # Time should be non-negative
    (data['Temp'] >= 0) &  # Temperature should be non-negative
    (data['PopBio'] >= 0) &  # Population quantity or biomass should be non-negative
    (data['Rep'] > 0)  # Repetition count should be a positive integer
)

# Apply the condition to get the subset
data_subset = data[condition]

# Output the subset to a CSV file
data_subset.to_csv("../results/LogisticGrowthData_subset.csv", index=False)

# Print the head of the subset
#print(data_subset.head())

'''
Add constraints to certain columns to give them practical physical meanings. The resulting data has 4297 rows and 11 columns, compared to the original data with 4387 rows. Save the new data in a CSV file named 'subset'.
In the generated plots, the characteristics of the Logistic model are well represented.
There are 45 unique species.
There are a total of 285 unique IDs based on the 'ID' column.
'''
#unique_ids = data_subset['ID'].unique()
#num_ids = len(unique_ids)

#print("Number of unique IDs:", num_ids)
#print("Unique IDs:", unique_ids)
