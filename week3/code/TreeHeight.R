# Load trees.csv and calculate tree heights
trees <- read.csv("../data/trees.csv")
trees$Tree.Height.m <- TreeHeight(trees$Angle.degrees, trees$Distance.m)

# Create output file TreeHts.csv in results directory
output_file <- "../results/TreeHts.csv"
write.csv(trees, file = output_file, row.names = FALSE)

# Define TreeHeight function
TreeHeight <- function(degrees, distance) {
  radians <- degrees * pi / 180
  height <- distance * tan(radians)
  return(height)
}
