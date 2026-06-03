# Housekeeping
## Inventory every active object currently residing in session RAM
objects()
## Purge global environment
rm(list = ls())
# confirm that global session memory now completely vacant
objects()

install.packages("tidyverse")
install.packages("readxl")
library(tidyverse)
library(readxl)

# Load the primary data science framework and Excel import library
install.packages("here")
library(here)

# Read in mangrove_data
mangrove_data <- read_csv(file= here::here("data/mangrove_survey_raw.csv"))

# Use args within read_csv to skip heades and declare missing flags
mangrove_data <- read_csv(
  here::here("data/mangrove_survey_raw.csv"),
  skip = 5, # skip the first 5 lines of field notes 
  na = c(".", "NA", "9999", "ND", "blank")) # Convert known text alts to true NA

# Force a modern tibble to degrade into a legacy base R data frame structure
benthic_cover_df <- as.data.frame(benthic_cover)

# Install the palmerpenguins package
install.packages("palmerpenguins")
library(palmerpenguins)

# Load the package data into active memory
data("penguins")

# Examining the structure of the dataset
glimpse(penguins) # tidyverse version (from dplyr package)
str(penguins) # base R version

# Generating an exploratory summary matrix
summary(penguins)

# vertically slice specific morphometric variables by explicit name
morphology_metrics <- select(penguins, species, bill_length_mm, bill_depth_mm, 
                             body_mass_g)
glimpse(morphology_metrics)

# Retain a continuous block of attributes using the colon operator
spatial_block <- select(penguins, species:island)

# Discard logistics tracking attributes while preserving everything else using the minus sign
clean_scientific_fields <- select(penguins, -year)

# Isolate observations belonging to a single categorical target group
adelie_cohort <- filter(penguins, species=="Adelie")

# Sift out individuals  using continuous numerical boundary thresholds 
# Preserve only large penguins whose mass exceeds 4500 grams
heavy_penguins <- filter(penguins, body_mass_g > 4500)

#Combine multiple conditional parameters across separate attributes 
# Preserves records matching Gentoo penguins sampled explicitly on Biscoe Island
biscoe_gentoo <- filter(penguins, species == "Gentoo" & island == "Biscoe")

# Sift records matching multiple targeting flags within an explicit set 
sub_islands <- filter(penguins, island %in% c("Dream", "Torgersen"))

