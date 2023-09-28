library(tidyverse)
library(Cairo)
mpg
ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point()
#  ggsave("fig1.jpeg")

# Right
ggplot(mpg, aes(x = displ, y = hwy, shape = class)) +
  geom_point()
#  ggsave("fig2.png")

# Left
ggplot(mpg, aes(x = displ, y = hwy, size = class)) +
  geom_point()
#  ggsave("fig3.png")

#Right
ggplot(mpg, aes(x = displ, y=hwy, alpha = class)) +
  geom_point()
#  ggsave("fig4.png")
 
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "blue")
#  ggsave("fig5.png")

###
#Exercises 10.2.1
##
#1
#Create a scatterplot of hwy vs. displ where the 
#points are pink filled in triangles.
#Sln
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "pink", shape = 17, fill='pink')
#  ggsave("fig6.png")

#2
#ggplot(mpg) + 
#  geom_point(aes(x = displ, y = hwy, color = "blue"))
#blue was inside the aes function 
ggplot(mpg) + 
    geom_point(aes(x = displ, y = hwy), color = "blue")

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "blue")

  
#stroke aesthetic modifies the width of the
#border of the shape

#exe 10.3
# Left
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point()
#  ggsave("fig7.png")
# Right
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_smooth()
#    ggsave("fig8.png")
#> `geom_smooth()` using method = 'loess' and formula = 'y ~ x'

# Left
ggplot(mpg, aes(x = displ, y = hwy, shape = drv)) + 
  geom_smooth()
#    ggsave("fig9.png")
#> `geom_smooth()` using method = 'loess' and formula = 'y ~ x'

# Right
ggplot(mpg, aes(x = displ, y = hwy, scale_linetype_manual() )) + 
  geom_smooth()
#    ggsave("fig9.png")

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) + 
  geom_point() +
  geom_smooth(aes(linetype = drv))
#    ggsave("fig10.png")

# Left
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth()
#  ggsave("fig11.png")
# Middle
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(group = drv))
#  ggsave("fig11.png") 
# Right
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(color = drv), show.legend = FALSE)
#  ggsave("fig12.png")

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color = class)) + 
  geom_smooth()
#    ggsave("fig13.png")

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_point(
    data = mpg |> filter(class == "2seater"), 
    color = "red"
  ) +
  geom_point(
    data = mpg |> filter(class == "2seater"), 
    shape = "circle open", size = 3, color = "red"
  )
#    ggsave("fig14.png")


# Left
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(binwidth = 2)
#    ggsave("fig15.png")
# Middle
ggplot(mpg, aes(x = hwy)) +
  geom_density()
#    ggsave("fig15.png")
# Right
ggplot(mpg, aes(x = hwy)) +
  geom_boxplot()
#      ggsave("fig16.png")

library(ggridges)

ggplot(mpg, aes(x = hwy, y = drv, fill = drv, color = drv)) +
  geom_density_ridges(alpha = 0.5, show.legend = FALSE)
#> Picking joint bandwidth of 1.28
#      ggsave("fig17.png")

###
#Exercise 10.3.1
#1
ggplot(mpg, aes(x=displ, y=hwy)) + 
   geom_area() +
   geom_smooth()
#   ggsave("fig18.png")

#2
#ggplot(mpg, aes(x=displ, y=hwy)) + 
#   geom_boxplot()
#   ggsave("fig18.png")

#ggplot(mpg, aes(x=displ, y=hwy)) + 
#   geom_histogram()
#   ggsave("fig18.png")

#ggplot(mpg, aes(x=displ, y=hwy)) + 
#   geom_area()
#   ggsave("fig18.png")
   
#ggplot(mpg, aes(x=displ, y=hwy)) +  
#     geom_line()
   

#2
#ggplot(mpg, aes(x = displ, y = hwy)) +
#  geom_smooth(aes(color = drv), show.legend = FALSE)
#show.legend = FALSE ensures that the coloured smoothed lines will
#not be mixed up with the plot's legend.

#10.4: Facets
ggplot(mpg, aes(x=displ, y=hwy)) + 
   geom_point() +
   facet_wrap(~cyl)
#   ggsave("fig19.png")

ggplot(mpg, aes(x=displ, y=hwy)) + 
   geom_point() +
   facet_grid(drv ~cyl)
#   ggsave("fig20.png")

#
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_grid(drv ~cyl, scales = "free_y")
#  ggsave("fig21.png")
###
#Exercise 10.4.1
###

#10.4.3
ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .) #"." indicates 
                      #'no variable' for a particular facet row or column. 
                      #'It helps to specify which variable you want to facet by and along.
#ggsave("fig21.png")

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
#  ggsave("fig21.png")

#changes the subplot config and the number of rowsxcols
#in the subplot

#xercise 10.4.6
ggplot(mpg, aes(x = displ)) + 
  geom_histogram() + 
  facet_grid(drv ~ .)
#  ggsave("fig22.png")###this one makes more sense

ggplot(mpg, aes(x = displ)) + 
  geom_histogram() +
  facet_grid(. ~ drv)

#10.5
ggplot(diamonds, aes(x=cut)) + 
  geom_bar()

diamonds |> 
  count(cut) |>
  ggplot(aes(x = cut, y = n)) +
  geom_bar(stat = "identity")

ggplot(diamonds, aes(x = cut, y = after_stat(prop), group = 1)) + 
  geom_bar()

ggplot(diamonds) + 
  stat_summary(
    aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )


###10.6
# Left
ggplot(mpg, aes(x = drv, color = drv)) + 
  geom_bar()

# Right
ggplot(mpg, aes(x = drv, fill = drv)) + 
  geom_bar()

ggplot(mpg, aes(x = drv, fill = class)) + 
  geom_bar()

# Left
ggplot(mpg, aes(x = drv, fill = class)) + 
  geom_bar(alpha = 1/5, position = "identity")

# Right
ggplot(mpg, aes(x = drv, color = class)) + 
  geom_bar(fill = NA, position = "identity")

# Left
ggplot(mpg, aes(x = drv, fill = class)) + 
  geom_bar(position = "fill")

# Right
ggplot(mpg, aes(x = drv, fill = class)) + 
  geom_bar(position = "dodge")


ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(position = "jitter")

#10.7
nz <- map_data("nz")

ggplot(nz, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", color = "black")

ggplot(nz, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()


bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = clarity, fill = clarity), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1)

bar + coord_flip()
bar + coord_polar()