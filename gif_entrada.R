# Imagem entrada
setwd("C:/Projetos/R/mv/animacao")

require(ggplot2)
require(ggthemes)
library(gganimate)

x <- 1:30
y <- x^2

labels <- c(rep("", 29), "$")

df <- data.frame(x = x, y = y, labels = labels)

g <- ggplot(df) +
  geom_point(data = NULL, aes(x = 1, y = max(y) + 300), pch = "") +
  geom_bar(aes(x = x, y = y), stat = "identity") +
  geom_text(aes(x = x, y = y + 150, label= labels), size = 20, col = "green") +
  geom_text(aes(x = 1, y = max(y), label= "Manoel Vieira"), size = 25, col = "#e86547ff", hjust = 0) +   
  geom_text(aes(x = 1, y = max(y) - 180, label= "Contabilidade"), size = 15, col = "#e86547ff", hjust = 0) +
  transition_states(x, transition_length = 2, state_length = 1) +
  shadow_mark() + theme_map() 

# save as a GIF
animate(g, fps = 50, width = 1280, height = 500, rewind = F, duration = 1, renderer = gifski_renderer(loop = F))

anim_save(filename = "C:\\Projetos\\R\\mv\\img\\gif_entrada.gif")

