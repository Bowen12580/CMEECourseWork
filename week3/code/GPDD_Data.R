# Load required packages
library(maps)

# Load GPDD data
load("../data/GPDDFiltered.RData")

# Create world map
map("world")

# set the location points into the map shape of point is circle(by pch =16) and color is blue(by col = blue)
points(gpdd$long, gpdd$lat, col = "blue", pch = 16)

# Bias in the data analysis

# Data are too concentrated in some areas and too sparse in others, which may lead to errors in the analyses.
# Solution: average distribute points in the map may be better