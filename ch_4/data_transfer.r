library(nycflights13)
library(tidyverse)
#library(dplyr)
flights#same as nycflights13::flights
View(flights)

#section 4.1.3
flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

#?flights
#View(flights)
#print(flights, width=Inf)
#glimpse(glimpse)

#verbs=functions in R
flights |> 
   filter(dest=="IAH") |>
   group_by(year, month, day) |>
   summarize(
      arr_delay = mean(arr_delay, na.rm = TRUE)
   ) 


###Rows 4.2, filter 4.2.1

# flights that departed more than 120 minutes
flights |> 
   filter(dep_delay > 120)

# Flights that departed on January 1
flights |> 
  filter(month == 1 & day == 1)

# Flights that departed in January or February
flights |> 
  filter(month == 1 & month == 2)

# A shorter way to select flights that departed in January or February
flights |> 
  filter(month %in% c(1, 2))

#save the new dataframe using <-
jan1 <- flights |> 
  filter(month == 1 & day == 1)

flights |>
  filter(month==1 | 2)

###4.2.3 arrange()
#orts by the departure time, which is spread over four columns.
flights |> 
   arrange(year, month, day, dep_time)

  
#orders flights from most to least delayed:
flights |> 
   arrange(desc( dep_delay))

# Remove duplicate rows, if any
flights |> 
  distinct()

# Find all unique origin and destination pairs
flights |> 
  distinct(origin, dest)

#keep other columns when filtering for unique rows, you can use the .keep_all = TRUE
flights |> 
  distinct(origin, dest, .keep_all = TRUE)

# find the number of occurrences
#arrange them in descending order 
flights |>
  count(origin, dest, sort = TRUE)

###
#Exercise 4.2.5.1
###
exe4_2_5_1<-flights |> 
   arrange(desc( arr_delay))|>
   filter(arr_delay > 120) |>
   filter(dest=="IAH" & dest=="HOU") |>
   filter(carrier=="UA" & carrier=="IAD") |>
   #filter(month %in% c(6, 7,8)) |>
    filter(month |> c(6, 7,8)) |>
   #Arrived more than two hours late, but didn’t leave late
   filter( sched_dep_time==dep_time) |>
   #Were delayed by at least an hour, but made up over 30 minutes in flight
   filter((dep_time - sched_dep_time)>60 & (arr_time - sched_arr_time)<30) |> 
   group_by(year, month, day)

#Sln
#%>% subset for me is |>
flights|>nrow()

# Had an arrival delay of two or more hours
#flights%>%subset(arr_delay>=120 & dest%in%c("IAH","HOU"))%>%nrow()
#flights%>%filter(arr_delay>120)%>%head(n=3)
#flights%>%filter(dest%inc%c("IAH","HOU"))%>%nrow()
#were operated by United, American or Delta
#airlines
#flights%>%filter(carrier%in%airlines$carrier[c(12,2,5)])%>%nrow()
#flights|>filter(as.character(month)%in% c("7", "8", "9"))|>nrow()

#flights|>filter(arr_delay>2&dep_delay<=0)%>%nrow()
#flights$month|>as.factvor()|>levels()
flights |> select(dep_time, dep_delay, arr_delay)|>head()
flights |> select(4,6,7,9) |> head()

flig
view(exe4_2_5_2)
###
#Exercise 4.2.5.2
###
exe4_2_5_2<-flights |> 
  arrange(desc(dep_time))|>
  group_by(year, month, day)|>
  summarize(
    arr_delay = max(dep_delay - arr_delay, na.rm = TRUE)
  )

###sln
flights|>arrange(desc(dep_delay))|>head()
flights|>arrange(dep_time)%>%head()


###Columns 4.3
#w.
flights |> 
   arrange(desc( dep_delay))
      group_by(year, month, day) |>
   summarize(
      arr_delay = mean(arr_delay, na.rm = TRUE)
   ) 


###4.3 Columns

#compute the gain, 
#how much time a delayed flight made 
#up in the air, and the speed in miles per hour

flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    .before =1 
  )

#use  .after to add the new a variable
#after day
flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    .after = day
  )

# output will contain only the 
#variables dep_delay, arr_delay, 
#air_time, gain, hours, and gain_per_hour.
flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    hours = air_time / 60,
    gain_per_hour = gain / hours,
    .keep = "used"
  )

###4.3.2
# select() allows you to 
#rapidly zoom in on a useful subset using operations based on the names of the variables:
#select cols by name
flights |> 
  select(year, month, day)


#Select all columns between year and day 
flights |> 
  select(year:day)

#Select all columns except those from year to day
flights |> 
  select(!year:day)

#Select all columns that are characters:
flights |> 
  select(where(is.character))

# rename variables as you select() them by using =. 
#The new name appears on the left hand side of the =
flights |> 
  select(tail_num = tailnum)

#keep all the existing variables and just want to rename a few
flights |> 
  rename(tail_num = tailnum)

#Use relocate() to move variables around.
flights |> 
  relocate(time_hour, air_time, .after=time_hour)

###
#Exercises 4.3.5.2
###
# select dep_time, dep_delay, arr_time, and arr_delay from flights.
#a
flights |> 
   select(dep_time:arr_delay)
#b
flights |> 
   select(starts_with("dep")) |>
   select(ends_with("delay"))

flights|>select(starts_with("arr"), starts_with("dep"))|> head()

#Rowan
lights |> 
  select(!contains(c("sched","air","hour")) & (contains("time") | contains("delay")))

 
#Stavrina
flights |> 
  select(!starts_with("sched") & !starts_with("air") & (ends_with("time") | ends_with("delay")))

#c
#a
flights |> 
   select(dep_time, dep_delay, arr_time, arr_delay)


###
#exercise 4.3.1
###
flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    .before =1
  )

#we could add the new variables after day
flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    .after = day
  )

#the following output will contain only the variables
flights |> 
  mutate(
    gain = dep_delay - arr_delay,
    hours = air_time / 60,
    gain_per_hour = gain / hours,
    .keep = "used"
  )

#Select columns by name:
flights |> 
  select(year, month, day)

#Select all columns except those from year to day (inclusive):
flights |> 
  select(!year:day)

?select
#Use relocate() to move variables around. 
flights |> 
  relocate(time_hour, air_time)

#takes the row witht tihe largest value in column arr_delay

#rop = 0.1 to select (e.g.) 10% of the rows in each group. 
#For example, the following code finds the 
#flights that are most delayed upon arrival at each destination:
flights |> 
  group_by(dest) |> 
  slice_max(arr_delay, n = 1) |>
  relocate(dest)

daily <- flights |>  daily <- flights |>  
  group_by(year, month, day)
  group_by(year, month, day)

daily_flights <- daily |> 
  summarize(n = n())

#remove grouping from a data frame without using summarize()
daily |> 
  ungroup() |>
    summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE), 
    flights = n()
    )

#################################################
###4.5 Groups
#################################################

#Notes for pipe operator | 
# old style %>% vs new |>
# different versions of group by
#flights |>
#
#  group_by() |>
#
#    summarise(n = n()) |>
#
#  ungroup()
#
# flights |>
# summarise(n = n(), .by = origin)
#
#
###
#Exercise 4.5.7.1
#Which carrier has the worst delays
###
flights |> 
 group_by(carrier, dest, year) |>
 summarize(
  avg_delay = mean(dep_delay, na.rm = TRUE), 
  flight_count = n()
  ) |>
  arrange(desc(avg_delay))

##solution
flights |> 
 summarize(
  avg_dep_delay = mean(dep_lay, na.rm = True),
  avg_arr_delay = mean(arr_delay, na.rm=True),
  n = n(),
  .by = carrier
  ) |> slice_max(avg_arr_delay, n =5)

###
#Exercise 4.5.7.2
#most delayed upon departure
###
flights |> 
  group_by(dest) |> 
  slice_max(dep_delay, n = 1) |>
  relocate(dest)|>
  summarize(
  flights = n())

#solution 
flights |    
    
library(Lahman)
###
#Case study 4.6
#
batters <- Lahman::Batting |> 
  group_by(playerID) |> 
  summarize(
    performance = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    n = sum(AB, na.rm = TRUE)
  )
batters

batters |> 
  filter(n > 100) |> 
  ggplot(aes(x = n, y = performance)) +
  geom_point(alpha = 1 / 10) + 
  geom_smooth(se = FALSE)
  ggsave("batters.png")
