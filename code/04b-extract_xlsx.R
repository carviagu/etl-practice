library(readxl)

setwd("~/etl") # para mi máquina local

path_to_file <- "data/ejemplos_lectura.xlsx"
df_ejemplos <- read_xlsx(path_to_file)
df_ejemplos
# aún estando oculta puede leer la primera hoja

# Hay hojas ocultas
excel_sheets(path_to_file)

# Para leer una hoja en concreto
df_ejemplos <- read_xlsx(path_to_file, sheet = "Fechas")
df_ejemplos

# Le decimos que lea a partir de la tercera fila
df_fechas <- read_xlsx(path_to_file, 
                       sheet = "Fechas", 
                       skip = 2)
df_fechas

# Para leer regiones
# c("skip", "skip", "skip", "guess", "guess", "guess", "guess")
df_fechas <- read_xlsx(path_to_file, 
                       sheet = "Fechas", 
                       skip = 2, 
                       col_types = c(rep("skip", 3), rep("guess", 5)))

df_fechas

# Para fechas más complicadas, trabajaremos con dplyr
df_chungo <- read_xlsx(path_to_file, sheet = "Holi")
df_chungo
