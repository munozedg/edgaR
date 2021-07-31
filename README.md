## *Enhanced Data Gathering for Analysis using R* - edgaR

*This is just a public collection of some functions in R that I used to solve problems that I encounter from time to time in my daily practice*

Una colección publica de algunas funciones en R que he utlizado para resolver problemas que se me presentan a menudo en mi practica diaria

Espero que sean útiles para ti también!

### 03-Leer-Archivo-CSV-coma-decimal.R

> Problema: Leer archivos CSV provenientes de Colombia, España y otros paises en donde se usa la coma como punto decimal en los datos.
>
> Solución: Usar `COL_ES <- locale("es", decimal_mark = ",")` para especificar que el punto decimal es la coma.

[Ver código R](https://github.com/munozedg/edgaR/blob/0caae88ffb7ef434da64dd456084d9a7ba15298e/R/03-Leer-Archivo-CSV-coma-decimal.R)

### 10-Merge-CSVs-Tool.R

> Problema: Unir varios archivos CSV con la misma estructura
>
> Solucion: Usar las funciones `readr::read_csv()` para leer cada archivo CSV y `purrr::map_dfr()` para combinar los dataframes resultantes en uno solo

[Ver código R](https://github.com/munozedg/edgaR/blob/aba658054b6d1f60a202550fa92e739bfa193149/R/10-Merge-CSVs-Tool.R)

