
#exercise 3.5
#3.5.1 -incorrect call of object, spelling
my_variable <- 10
my_varlable

#exercise 3.5.2
#library spelling
#why function arguments are passed is incorrect
#libary(todyverse)
#
#ggplot(dTA = mpg) + 
#  geom_point(maping = aes(x = displ y = hwy)) +
#  geom_smooth(method = "lm)
#
library(tidyverse)
ggplot(data = mpg,
      mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color = hwy)) +
  geom_smooth(method = "lm")

#exercise 3.5.4
my_bar_plot <- (ggplot(mpg, aes(x = class)) +
  geom_bar())
ggsave(filename="mpg-plot.png", plot = my_bar_plot)
#the bar plot is save
my_scatter_plot <- ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()