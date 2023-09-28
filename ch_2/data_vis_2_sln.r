#r4ds week 2 chapter 2
library(tidyverse)
library(palmerpenguins)
library(ggthemes)
glimpse(penguins)
#exercise 2.2.5 3

penguins|>ggplot(aes(bill_length_mm,bill_depth_mm))+
  geom_point()+geom_smooth()

penguins|>ggplot(aes(bill_length_mm,bill_depth_mm,
                     col=species))+
  geom_point()+geom_smooth()+scale_colour_colorblind()

penguins|>ggplot(aes(bill_length_mm,bill_depth_mm,
                     col=species))+
  geom_point()+geom_smooth(method="lm")+
  scale_colour_colorblind()
#increasing relationship within each species

#exercise 2.2.5 5
ggplot(data = penguins) + 
  geom_point()
# the x and y aesthetics are required for points but they are missing

#exercise 2.4.3 3

#bins decides how many bars to have 

ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram()
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(bins = 2000)

# Make a histogram of the carat variable in the diamonds 
# dataset that is available when you load the tidyverse 
# package. Experiment with different binwidths. 
# What binwidth reveals the most interesting patterns?
glimpse(diamonds)

#exercise 2.4.3 4
diamonds|>ggplot(aes(carat))+geom_histogram()+scale_y_log10()
diamonds|>ggplot(aes(carat))+geom_histogram(binwidth=0.1)
diamonds|>ggplot(aes(carat))+geom_histogram(binwidth=0.5)

#exercise 2.5.5 1

# The mpg data frame that is bundled with the ggplot2 package 
# contains 234 observations collected by the US Environmental 
# Protection Agency on 38 car models. Which variables in mpg 
# are categorical? Which variables are numerical? 
#   (Hint: Type ?mpg to read the documentation for the 
#    dataset.) How can you see this information when you 
# run mpg?
glimpse(mpg)
#numerical = displ/year/cyl/cty/hwy
#alternatively
lapply(mpg,class)

#exercise 2.5.5 6
# Why does the following yield two separate legends? 
#   How would you fix it to combine the two legends?
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(color = "Species",shape="Species"
  )
#because of the different legend titles