library(ggplot2)
library(palmerpenguins)

ggplot(data = penguins) +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color = species))+
  labs(title = "Palmer Penguins: Flipper length vs. Body mass", subtitle = "Sample of 3 penguin species", caption = "Data collected by Dr. Kristen Gorman ") +
  annotate("text", x = 220, y = 3500, label = "The Gentos are the largest", color = "purple", fontface = "bold", size = 4.5, angle = 25)

p <- ggplot(data = penguins) +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color = species))+
  labs(title = "Palmer Penguins: Flipper length vs. Body mass", subtitle = "Sample of 3 penguin species", caption = "Data collected by Dr. Kristen Gorman ")

p + annotate("text", x = 220, y = 3500, label = "The Gentos are the largest", color = "purple", fontface = "bold", size = 4.5, angle = 30)

ggplot(data = penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color = species))

ggsave("Three Penguin species.png")