#### Preamble ####
# Purpose: Tests the analysis data
# Author: Dingshuo Li
# Date: 27 September 2024
# Contact:dawson.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have analysis data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read_csv("data/raw_data/simulated_data.csv")

# Test for proper range of data
data$number_of_hate_crime |> min() < 0
data$occurrence_year |> max() < 2018
data$occurrence_year |> min() > 2024
data$hour |> min() < 0
data$hour |> max() > 24
data$dates |> min() <= 0

# Test for NAs in the number of hate crimes
all(is.na(data$number_of_hate_crime))
all(is.na(data$hour))
all(is.na(data$occurrence_year))
all(is.na(data$primary_offence))
all(is.na(data$arrest_made))

