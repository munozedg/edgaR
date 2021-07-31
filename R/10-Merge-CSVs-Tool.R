# 10-Merge-CSVs-Tool.R
# prepare files 
# 2021-07-30: added multiple file selection capability
# 2021-06-09: initial version

# Merge csv files -- manually selecting files ----

library(tidyverse) # usamos readr::read_csv()
library(stringr)
library(lubridate)
library(here)

dir.create(here("data"))


lst_files = choose.files(filters = "*.csv")

# struc data
col_types <- cols(
  .default = col_character()
)

df_all_csv <- lst_files %>%
  set_names() %>%
  map_dfr( ~ read_csv(
    .x,
    col_types = col_types,
    col_names = TRUE,
    locale = readr::locale(encoding = "latin1")
  ),
  .id = "file_name")

table(df_all_csv$file_name)

df_all_csv$file_name <- NULL

write_csv(df_all_csv, paste0("data/", lubridate::today(), "_merged.csv"))

