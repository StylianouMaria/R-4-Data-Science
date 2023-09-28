#parse_number() and parse_double() to get numbers from strings
#count(x, wt = col_name, sort = TRUE) - wt gives sum(col_name)
#wt weighting
#n() gives number in current group, can only be used inside verbs
#Recycling rules, careful when vector len >1
#pmin(), pmax() -pair min and pair max 
#cut() - bins data

library(tidyverse)
library(nycflights13)
#14.3.1 Exercise
#1.
flights |> 
  filter(month == c(1, 2))

flights |>
  filter(is.na(arr_delay)) |>
  count()

#or
flights |> 
  count( wt= is.na(arr_delay))

flights |>
  group_by(dest) |> 
  summarize(n_cancelled = sum(is.na(dep_time)))

##Exercises 14.5.4 
#2. Which plane (tailnum) has the worst on-time record?

flights |>
  group_by(dest) |> 
  summarise(n = n()) |>
  arrange(dist = sum(distance))


flights |> 
  mutate(abs_arr_delay = abs(arr_delay)) |>
  count(tailnum, wt = abs_arr_delay, sort = TRUE)

#3.What time of day should you fly if you want to avoid delays as much as possible?

flights |>
  count(dep_time, wt = arr_delay) |> 
  arrange(n)

flights |>
  filter(!is.na(arr_delay)) |>
  mutate(arr_delay = pmax(0,arr_delay)) |>
        hour = sched_dep_time %/% 100) |>
        summarize(.by = hour,
                  prop = mean(arr_delay >0),
                  mean = mean(arr_delay),
                  median = median(arr_delay)) |>
          mutate(across(prop:median, min_rank, .names = "{.col}_rank")) |> #Chapter 27
          arange(mean_rank)
