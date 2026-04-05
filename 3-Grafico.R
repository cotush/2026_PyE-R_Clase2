# ---------------- 3. Grafico ---------------- 

# Ordenamos para grafico de barras horizontales
goles_por_grupo <- goles_por_grupo %>%
  arrange(goles) %>%
  mutate(Grupo = factor(Grupo, levels = Grupo))
  
  
# Grafico de barras
goles_por_grupo %>%
  ggplot() +
  aes(x = Grupo, y = goles) +
  geom_col(fill = "pink") +
  geom_text(aes(label = goles), hjust = -0.2) + # Agregamos etiqueta con cantidad
  labs(
    title = "Goles por grupo (fase de grupos)",
    x = "Grupo",
    y = "Cantidad de goles"
  ) +
  coord_flip()


# Ordenamos para grafico lollipop
goles_por_grupo <- goles_por_grupo %>%
  arrange(desc(goles)) %>%
  mutate(Grupo = factor(Grupo, levels = Grupo))
  
# Grafico lollipop
goles_por_grupo %>%
  ggplot() +
  aes(x = Grupo, y = goles) +
  geom_segment(aes(xend = Grupo, y = 0, yend = goles), color = "skyblue") + # Agregamos los segmentos
  geom_point(size = 3, color = "skyblue") +   # Agregamos los puntos
  geom_text(aes(label = goles), vjust = -1) +   # Agregamos etiqueta con cantidad
  labs(
    title = "Goles por grupo (fase de grupos)",
    x = "Grupo",
    y = "Cantidad de goles"
  ) 