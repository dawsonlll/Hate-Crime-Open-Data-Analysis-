#### Preamble ####
# Purpose: Download data from Open Data Toronto
# Author: Dingshuo Li
# Date: 21 September 2024
# Contact: dawson.li@mail.utoronto.ca
# License: None
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)


#### Download data ####
package <- show_package("hate-crimes-open-data")
package
resources <- list_package_resources("hate-crimes-open-data")
datastore_resources <- filter(resources, tolower(format) %in% c("csv", "geojson"))
data <- filter(datastore_resources, row_number() == 1) %>% get_resource()
data



#### Save data ####
write_csv(data, "data/raw_data/raw_data.csv")
