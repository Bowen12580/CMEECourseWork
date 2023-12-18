# Load required packages
library(tidyverse)

# Load the dataset
MyData <- as.matrix(read.csv("../data/PoundHillData.csv", header = FALSE))
MyMetaData <- read.csv("../data/PoundHillMetaData.csv", header = TRUE, sep = ";")

# Inspect the dataset
head(MyData)
dim(MyData)
str(MyData)
View(MyData) #you can also do this
View(MyMetaData)

# Transpose the dataset（No command we can replace the transpose 't' command)
MyData <- t(MyData) 
head(MyData)
dim(MyData)

# Replace species absences with zeros
MyData[MyData == ""] <- 0

# Convert raw matrix to data frame
TempData <- as.data.frame(MyData[-1,], stringsAsFactors = FALSE)
colnames(TempData) <- MyData[1,]
####################################################################################################
##########################################
# we can use gather() in the tidyverse and also pivot_longer() to replace melt() in the original code. I put the pivot_longer in the comment
MyWrangledData <- TempData %>%
  gather(key = "Species", value = "Count", -c(Cultivation, Block, Plot, Quadrat)) %>%
  mutate(across(c(Cultivation, Block, Plot, Quadrat), as.factor),
         Count = as.integer(Count))
######################################################################################################
# Convert from wide to long format (here use the 'pivot_longer' to replace the original 'melt')
#MyWrangledData <- TempData %>%
 # pivot_longer(cols = -c(Cultivation, Block, Plot, Quadrat),
  #             names_to = "Species",
   #            values_to = "Count") %>%
 # mutate(across(c(Cultivation, Block, Plot, Quadrat), as.factor),
  #       Count = as.integer(Count))

str(MyWrangledData)
head(MyWrangledData)
dim(MyWrangledData)

# Exploring the data (extend the script below)
# Continue your data exploration and analysis here using dplyr and tidyr functions