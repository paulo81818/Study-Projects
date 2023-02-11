library(ggplot2)
library(palmerpenguins)

data(penguins)
View(penguins)

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +  geom_point()

ggplot(data = penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, shape = species, color = species, size = species, alpha = species))

ggplot(data = penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g), color = "purple")

ggplot(data = penguins) + 
  geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g, linetype = species), color = "red") +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g), color = "blue")

ggplot(data = penguins) + 
  geom_smooth(mapping = aes(x=flipper_length_mm, y=body_mass_g, linetype = species))

ggplot(data = penguins) + 
  geom_jitter(mapping = aes(x=flipper_length_mm, y=body_mass_g))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x=cut, fill = clarity))

ggplot(data = penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color = species))+
  facet_wrap(~species)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x=color, fill = cut)) +
  facet_wrap(~cut)

ggplot(data = penguins) + 
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g, color = species)) +
  facet_grid(~sex)

penguins %>% 
  filter(species == "Gentoo") %>% 
  ggplot(aes(x=flipper_length_mm, y=body_mass_g, color = species)) + 
  geom_point() 