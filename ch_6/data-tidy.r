library(tidyverse)

# Compute rate per 10,000
table1 |>
  mutate(rate = cases / population * 10000)


# Compute total cases per year
table1 |> 
  group_by(year) |> 
  summarize(total_cases = sum(cases))


# Visualize changes over time
ggplot(table1, aes(x = year, y = cases)) +
  geom_line(aes(group = country), color = "grey50") +
  geom_point(aes(color = country, shape = country)) +
  scale_x_continuous(breaks = c(1999, 2000)) # x-axis breaks at 1999 and 2000
  ggsave("tb.png")
###
# Exercise 6.2.1.1
###
#Sln

#country and year = each row is an 
#observation of table 1
#observation is TB and pop in table 1 

#country = observation of table 2 is unit of analysis

#country, year and mutliple observations within a single cell = observation of table 3

###
# Exercise 6.2.1.2
###

#how to turn table 2 and 3 to 1
#cases rate/ population 
# parsing the string and pass to it to
#a function(mutate) and return directly
table3 |> 
   rowwise() |>
   mutate(
    cases = as.numeric(str_split_1(rate,"/")[1]),
    population = as.numeric(str_split_1(rate,"/")[2])
   ) |>
   ungroup() |>
   mutate(rate_value = 10000(cases)) 