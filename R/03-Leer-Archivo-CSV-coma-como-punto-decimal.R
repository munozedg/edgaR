# Leer un archivo CSV que usa comas como punto decimal ----

library(tidyverse)
library(here)

# Ejemplo: datos_coma_decimal_etc.csv
#
# "Fecha","Último","Vol.","% var."
# "06.04.2021","53,92","43,54K", "-2,10%"
# "06.04.2021","53,92","43,54K", "-2,10%"

COL_ES <- locale("es", decimal_mark = ",")

mi_cols <- cols(
  `Fecha`  = col_date(format = "%d.%m.%Y"),
  `Último` = col_number(),
  `Vol.`   = col_number(),
  `% var.` = col_number(),
  .default = col_character()
)

test_df <- read_csv(
  here("data","datos_coma_decimal_etc.csv"),
  locale = COL_ES,
  col_types = mi_cols,
  trim_ws = TRUE
)

test_df

test_df <- test_df %>% 
  rename(
    fecha   = Fecha,
    ultimo  = Último,
    vol     = `Vol.`,
    pct_var = `% var.`   
  )

test_df

# A tibble: 2 x 4
# fecha      ultimo   vol pct_var
# <date>      <dbl> <dbl>   <dbl>
# 2021-04-06   53.9  43.5    -2.1
# 2021-04-06   53.9  43.5    -2.1
