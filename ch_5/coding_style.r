library(tidyverse)
library(nycflights13)
# Strive for:
short_flights <- flights |> filter(air_time < 60)
#z <- (a + b)^2 / d

#mean(x, na.rm = TRUE)

#indent by two spaces
#flights |>  
#  group_by(tailnum) |> 
#  summarize(
#    delay = mean(arr_delay, na.rm = TRUE),
#    n = n()
#  )

flights |> 
  group_by(month) |> 
  summarize(
    delay = mean(arr_delay, na.rm = TRUE)
  ) |> 
  ggplot(aes(x = month, y = delay)) +
  geom_point() + 
  geom_line()


#5.5 Sectioning comments
# Load data --------------------------------------

# Plot data --------------------------------------

###
#Exercise 5.6
###
flights |> 
  filter(dest=="IAH") |>
  group_by(year, month, day) |>
  summarize(
    n = n(),
    delay = mean(arr_delay, na.rm=TRUE)) |>
    filter(n>10)

flights |> 
  filter(carrier=="UA",
         dest%in%c("IAH","HOU"),
         sched_dep_time|> 0900,
         sched_arr_time < 2000)|>
  group_by(flight) |> 
  summarize(
    delay=mean(
    arr_delay,na.rm=TRUE),
    cancelled=sum(is.na(arr_delay)),
    n=n()
    ) |>
    filter(n>10)
