#https://r4ds.hadley.nz/data-visualize.html
#https://pad.sfconservancy.org/p/uom-r4ds
#compile with ctrl+enter
#clear with ctrl+l
library(tidyverse)
library(palmerpenguins)
library(ggthemes)
glimpse(penguins)
ggplot(data = penguins)

#use aesthetics for vis
#define geometrical object
#assign unique color to each variable level
#improve markers, color and labels
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

ggplot(data = penguins, aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  labs(x = "Bill Length (mm)", y = "Bill Depth (mm)", title = "Scatterplot of Bill Depth vs. Bill Length")

#exercise  2.2.5(3,5)
#scatter plot
ggplot(
data = penguins,
mapping = aes(x = bill_depth_mm, y = bill_length_mm)
) +
  geom_smooth(method = "lm") +
  labs(
    title = "Bill depth and bill length",
    x = "Bill length (mm)", y = "Bill length mm",
    color = "Species", shape = "Species"
  )

ggplot(data = penguins) + 
  geom_point(aes(color = species, shape = species))

#exercise 2.4.3 (3,4)
#ggplot(penguins, aes(x = fct_infreq(species))) +
#  geom_bar()

#ggplot(penguins, aes(x = body_mass_g)) +
#  geom_density()


#bins=number of columns
#Number of bins. Overridden by binwidth. Defaults to 30

ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200)

diamonds

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(bins=1000)


#2.6
#saving the plots
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
ggsave(filename = "penguin-plot.png")

#2.6.1
ggplot(mpg, aes(x = class)) +
  geom_bar()
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave("mpg-plot.png")
