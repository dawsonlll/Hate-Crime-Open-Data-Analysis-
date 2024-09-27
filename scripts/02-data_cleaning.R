#### Preamble ####
# Purpose: Cleans the raw hate crime data
# Author: Dingshuo Li
# Date: 27 September 2024
# Contact:dawson.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(
    occurrence_year, occurrence_date, occurrence_time,
    primary_offence, arrest_made
  ) |>
  filter(!is.na(occurrence_date) & !is.na(primary_offence)) |>
  mutate(
    occurrence_date = as.Date(occurrence_date, format = "%Y-%m-%d"),
    occurrence_time = sprintf("%04d", occurrence_time),
    occurrence_time = strptime(occurrence_time, format = "%H%M"),
    occurrence_time = format(occurrence_time, "%H:%M"),
    hour = as.numeric(format(strptime(occurrence_time, format = "%H:%M"), "%H")),
    occurrence_year = as.numeric(occurrence_year),
  ) |>
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

