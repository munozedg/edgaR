# 10-Merge-CSVs-Tool.R
# prepare files 
# 2021-07-30: added multiple file selection capability
# 2021-06-09: initial version

# Merge csv files -- manually selecting files ----

library(tidyverse) # usamos readr::read_csv() y purrr::map_dfr()
library(stringr)
library(lubridate)
library(here)
library(stringi)

dir.create(here("data"))
dir.create(here("data_raw"))

if (interactive() && .Platform$OS.type == "windows") {
  files = choose.files(filters = "csv", multi = TRUE)
} else {
  files = list.files(path = here("data_raw"),
                     pattern = "\\.csv$",
                     full.names = TRUE)
}

if (length(files)<2) {
  
  stop("Se requiere al menos 2 archivos CSV")
  
} else {
  
  # struc data
  col_types <- cols(.default = col_character())
  
  cat("\n\nUniendo los archivos seleccionados...\n\n")
  
  ENC <- guess_encoding(files[[1]])[[1]]
  
  df_all_csv <- files %>%
    set_names() %>%
    map_dfr(~ read_csv(
      .x,
      col_types = col_types,
      col_names = TRUE,
      locale = readr::locale(encoding = "UTF-8",
                             decimal_mark = ".",  # puede cambiarse a coma si se necesita
                             asciify = TRUE)
    ),
    .id = "file_name")
  
  (table(df_all_csv$file_name))
  df_all_csv$file_name <- NULL

  out_file <- here("data", paste0(lubridate::today(), "_merged.csv"))
  
  write_csv(df_all_csv, out_file)
  cat("Archivo consolidado --> ", out_file,"\n\n")
  
}
