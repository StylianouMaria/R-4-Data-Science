

#'==NA' does not work, use is.na() equals to '== NA'

#use '%in%' instead of combining '==' and '|' operators to avoid unwanted results

#if_else() works like np.where() in python
#case_when() to apply several different  conditions


library(tidyverse)
library(nycflights13)

x <- c(1, 2, 3, 5, 7, 11, 13)
x * 2

df <- tibble(x)
df |> 
  mutate(y = x * 2)

#13.2 Comparisons
flights |> 
  filter(dep_time > 600 & dep_time < 2000 & abs(arr_delay) < 20)

flights |> 
  mutate(
    daytime = dep_time > 600 & dep_time < 2000,
    approx_ontime = abs(arr_delay) < 20,
    .keep = "used"
  )

flights |> 
  mutate(
    daytime = dep_time > 600 & dep_time < 2000,
    approx_ontime = abs(arr_delay) < 20,
  ) |> 
  filter(daytime & approx_ontime)

#13.2.1 Floating point comparison
x <- c(1 / 49 * 49, sqrt(2) ^ 2)
x
#> [1] 1 2
#> 
x == c(1, 2)

print(x, digits = 16)

near(x, c(1, 2))

#13.2.2 Missing values

#Exercise 13.3.4
#1.
flights |> 
  filter(is.na(arr_delay) & !is.na(dep_delay))

#2.
flights |>
  filter(is.na(dep_time))  

