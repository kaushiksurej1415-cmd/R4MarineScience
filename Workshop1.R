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

# Gerating an exploratory summary matrix
summary(penguins)

# vertically slice specific morphometric variables by explicit name
morphology metrics <- select(penguins, species, bill_length_mm, bill_depth)