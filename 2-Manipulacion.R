# ---------------- 2. Manipulacion de datos ---------------- 
#install.packages("tidyverse")

library(tidyverse)

# Filtramos para tener sólo los partidos que fueron en fase de grupos
datos_grupos <- partidos_mundial_2022 %>%
  filter(!is.na(Grupo))   # Solo partidos que tienen grupo

# Agregamos columna con los goles totales por partido
datos_grupos <- datos_grupos %>%
  mutate(total_goles = Goles_90min_equipo_1 + Goles_90min_equipo_2)

# Calculamos los goles por grupo
goles_por_grupo <- datos_grupos %>%
  group_by(Grupo) %>%                   # Agrupamos por Grupo
  summarise(goles = sum(total_goles))   # Calculamos los goles por grupo

goles_por_grupo

# Ordenamos para ver mejor los datos
goles_por_grupo %>%
  arrange(desc(goles))

goles_por_grupo





# Lo mismo pero en una línea usando pipelines:
goles_por_grupo2 <- partidos_mundial_2022 %>%
  filter(!is.na(Grupo)) %>%   # Filtramos por fase de grupo
  mutate(total_goles = Goles_90min_equipo_1 + Goles_90min_equipo_2) %>%   # Agregamos total de goles por partido
  group_by(Grupo) %>%   # Agrupamos por Grupo
  summarise(goles = sum(total_goles)) %>%   # Cantidad de goles por grupo
  arrange(desc(goles))  # Ordenamos para ver mejor los datos

goles_por_grupo2