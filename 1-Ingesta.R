# ---------------- 1. Carga de datos ----------------

library(googlesheets4)

url = "https://docs.google.com/spreadsheets/d/1pTipGeejixmMf118aw6WbdBatUeo9cyRDVA_jvHF7ZQ/edit?usp=drive_link"

gs4_deauth()

partidos_mundial_2022 <- read_sheet(url)

# Data Frame obtenido
str(partidos_mundial_2022)