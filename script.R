# Phylogenetic Analysis Script

# Load packages
required_packages <- c("ape", "geiger")
new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

library(ape)
library(geiger)

# Load phenotypic data
phenotypic_data <- read.csv("phenotypicdata.csv", header = TRUE)
print(dim(phenotypic_data))
print(head(phenotypic_data))

# Segregate each variable and name them with corresponding species
variables <- c("data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8", "data9", "data10")

for (var in variables) {
  phenotypic_data[[var]] <- as.factor(phenotypic_data[[var]])
  names(phenotypic_data[[var]]) <- phenotypic_data$Species
}

# Load the phylogenetic tree
species_tree <- read.tree("speciestree.nwk")
print(species_tree)

# Adjust the tree to match the species in the data
phenotypic_data <- read.csv("phenotypicdata.csv", header = TRUE, row.names = 1)
obj <- treedata(species_tree, phenotypic_data)
species_tree_adjusted <- obj$phy
print(species_tree_adjusted)


