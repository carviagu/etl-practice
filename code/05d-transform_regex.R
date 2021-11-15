library(stringr)
x <- c("apple", "banana", "pear")

# numeric output
str_which(x, "e")

# character output
str_subset(x, "e")
str_subset(x, "a")
str_subset(x, "c") # vector vacio

# logical output
str_detect(x, "e")

# Atención a las mayúsculas
apples <- c("apple", "Apple", "APPLE")
str_detect(apples, "apple")

tolower(apples)
str_detect(tolower(apples), "apple")

str_detect(apples, regex("apple", ignore_case = TRUE))

library(dplyr)

fivethirtyeight::biopics %>% 
  select(lead_actor_actress) %>% 
  mutate(contiene_w = str_detect(lead_actor_actress, "w"))

# Todas las letras de la A a la z (patrón)
fivethirtyeight::biopics %>% 
  select(lead_actor_actress) %>% 
  mutate(name = str_extract(lead_actor_actress, "[A-z]+"))

# Inlcuye los guiones en el patrón además de lo anterios
fivethirtyeight::biopics %>% 
  select(lead_actor_actress) %>% 
  mutate(name = str_extract(lead_actor_actress, "[A-z\\-]+"))

# Buscar el patrón en la última parte del texto
fivethirtyeight::biopics %>% 
  select(lead_actor_actress) %>% 
  mutate(surname = str_extract(lead_actor_actress, "[A-z\\-]+$"))


fivethirtyeight::biopics %>% 
  select(lead_actor_actress) %>% 
  mutate(name_altered = str_replace(
    str_to_lower(lead_actor_actress), "\\s", "-"))

# Buscar palabra
fivethirtyeight::biopics$lead_actor_actress %>% 
  str_which('Bichir')
fivethirtyeight::biopics$lead_actor_actress[130]

fivethirtyeight::biopics %>% 
  select(lead_actor_actress) %>% 
  mutate(name_altered = str_replace(
    str_to_lower(lead_actor_actress), "\\s|-", "-"))

fivethirtyeight::biopics %>% 
  select(lead_actor_actress) %>% 
  mutate(name_altered = str_replace_all(
    str_to_lower(lead_actor_actress), "\\s", "-"))

fivethirtyeight::biopics %>% 
  select(lead_actor_actress) %>% 
  mutate(name_altered = str_to_lower(lead_actor_actress), 
         name_altered = str_replace_all(name_altered, " ", "_"))


fivethirtyeight::biopics %>% 
  select(lead_actor_actress) %>% 
  mutate(name_altered = str_to_lower(lead_actor_actress), 
         name_altered = str_replace_all(name_altered, " |-", "_"))
