# -*- coding: utf-8 -*-

# -- Sheet --

# # Project NYC Flighs Analysis 
# 
#  Assessment  Business Question by JOI 


# note key functions 

#shift + enter ==> RUN CODE
#ctrl + M ==> convert to markdown cell

# https://bookdown.org/asmundhreinn/r4ds-master/diagrams/relational-nycflights.png


# # Diagram 
# https://bookdown.org/asmundhreinn/r4ds-master/relational-data.html  


# check data 
library(dplyr)
library(tidyverse)

flights <- read_csv("flights.csv") 

flights <- read.csv("flights.csv")
airlines <- read.csv("airlines.csv")
planes <- read.csv("planes.csv")
weather <- read.csv("weather.csv")

# check data
head(flights)
tail(flights)
glimpse(flights)

apply(flights , MARGIN = 2, function(col) sum(is.na(col)))


glimpse(flights)
glimpse(airlines)
glimpse(planes)
glimpse(weather)
tibble()

# head data
head(flights)
head(airlines)
head(planes)
head(weather)



# # Homework Create Business Question 


# #  Which top 5 airline had total longest flight distance in March 2013?


flights %>%
  filter(month == 3, year == 2013) %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  left_join(airlines , "carrier") %>%
  head(5)
  tibble()

# # What the fastest flights from NYC flights 2013 ?


flights %>%
    group_by(carrier) %>%
    summarise( max_distance = max(distance), 
    min_distance = min(distance), 
    mean_distance = mean(distance),
    sum_distance = sum(distance) ) %>%
    left_join(airlines , "carrier") %>%
    arrange(carrier)
    tibble()

# # Top 3 route busy on promotion in Newyear by Southwest Airlines 


flights %>%
  select(month, day, carrier, origin, dest) %>%
  filter(month == 1, day == 1, carrier == "WN") %>%
  left_join(airlines , "carrier") %>%
  head(3)
  tibble()

#  #  Find  Max, Min, Average and sum distance for each carrier ?


flights %>%
    group_by(carrier) %>%
    summarise( max_distance = max(distance), 
    min_distance = min(distance), 
    mean_distance = mean(distance),
    sum_distance = sum(distance) ) %>%
    arrange(carrier)
    tibble()

#  # In 2013 Which carrier had most delayed flights from top 100  ? 


flights %>%
    filter(year == 2013) %>%
    arrange(desc(arr_delay)) %>%
    head(100) %>%
    count(carrier) %>%
    inner_join(airlines, by = "carrier") %>%
    arrange(desc(n))

# #  How many flight each month in 2013 from High to Low ?


    flights %>%
    group_by(month) %>%
    summarise(total_flight = n()) %>%
    arrange(desc(total_flight)) %>%
    head(12)
    tibble()

# # Creat gg plot Relationship between each month and their total air time ?


# https://datarockie.com/blog/your-first-ggplot2-visualization/ 


joi_plot <- flights %>% 
group_by(month) %>%
select(month, air_time) %>%
summarize(air_time = n()) %>%
 arrange(desc(air_time))


joi_plot %>% head(12)



ggplot(joi_plot, aes(fill = month)) + 
    geom_col(aes(month,air_time)) +
    theme_minimal()+
  labs(title = "Relationship between each month and their total air time",
       x ="month", y=" Total Air Time",
       caption = "Source: flights from ggplots2 package")

# # How many departure time status on time , delay , cancelled flights in 2013? 


flights %>% 
  select(flight, origin, dest, sched_dep_time, arr_delay) %>%
  mutate(Status_dep = case_when( arr_delay  <= 0   ~  " Flight on time " ,  
                                 arr_delay  >= 0   ~  " Flight Delay   " , 
                                TRUE ~ "Flight cancelled")) %>%
  count ( Status_dep) %>%                              
  rename( Flight_status = n)
  tibble()

# # Find carrier that velocity in top 3  ? 
#   v = s / t 
# 
#   s = dest 
#   t = air_time


flights %>%
    select( carrier ,flight, distance, air_time) %>%
    inner_join(airlines, by = "carrier") %>%
    mutate(velocity = distance/air_time) %>%
    arrange(desc(velocity)) %>%
    head(5)
    tibble()

flights %>%
    inner_join(planes, "tailnum") %>%
    count(manufacturer)  %>%
    arrange(desc(n))
    tibble ()

