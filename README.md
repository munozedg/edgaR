## Enhanced Data Gathering for Analysis using R - edgaR

This is just a public colection of functions in R that I crafted to solve problems
I encounter from time to time 

Una colección publica de funciones en R que he utlizado para resolver problemas 
que se me presentan a menudo

Espero que sean útiles para ti también!

### 03-Leer-Archivo-CSV-coma-decimal.R

Problema: Leer archivos CSV provenientes de Colombia, España 
y otros paises en donde se usa la coma como punto decimal en los datos.

Solución: Usar ```COL_ES <- locale("es", decimal_mark = ",")``` para especificar
que el punto decimal es la coma.

[Ver código](https://github.com/munozedg/edgaR/blob/0caae88ffb7ef434da64dd456084d9a7ba15298e/R/03-Leer-Archivo-CSV-coma-decimal.R)



### 10-Merge-CSVs-Tool.R

Resuelve 
