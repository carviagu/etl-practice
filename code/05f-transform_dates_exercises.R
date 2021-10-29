library(dplyr)

# DATES AND TIME SERIES
# EXERCISE 1
# Creamos una base de datos en memoria.
conn <- DBI::dbConnect(RSQLite::SQLite(), "data/pets.sqlite")
DBI::dbListTables(conn)

query1 <- DBI::dbSendQuery(conn, "SELECT * FROM ProceduresHistory")

DBI::dbColumnInfo(query1)

query <- tbl(conn, "ProceduresHistory") %>% 
  group_by(Date) %>% 
  summarise(total = sum(ProcedureSubCode, na.rm = TRUE))

procedures_by_day <- collect(query)


# EXERCISE 2

procedures_by_day %>% 
  mutate(Date = as.Date(Date, origin = "1899-12-30")) %>% 
  mutate(Sunday = if_else(format(Date, format = '%u') == 7, 1, 0))
