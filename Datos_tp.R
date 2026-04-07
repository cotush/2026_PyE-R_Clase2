library(googlesheets4)

url = "https://docs.google.com/spreadsheets/d/1Kwl4KByOv8q2kXMsgaO3d5QI3vUQ40RCZJgJHhg5bmE/edit?gid=580479207#gid=580479207"

gs4_deauth()

datos_tp <- read_sheet(url, sheet = 2, skip = 1)

names(datos_tp)

summary(datos_tp)