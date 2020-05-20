# inspect the startdate column of 2016 polls data, a Date type

library(tidyverse)
library(dslabs)
data("polls_us_election_2016")
polls_us_election_2016 %>% head
class(polls_us_election_2016$startdate)
as.numeric(polls_us_election_2016$startdate) %>% head

# ggplot is aware of dates
polls_us_election_2016 %>%
  filter(pollster == "Ipsos" & state == "U.S.") %>%
  ggplot(aes(startdate, rawpoll_trump)) + 
  geom_line()

# lubridate: the tidyverse date package
library(lubridate)

# select some random dates from polls
set.seed(2)
dates <- sample(polls_us_election_2016$startdate) %>% sort
dates

# extract month, day, year from date strings
data.frame(date = dates, 
           month = month(dates),
           day = day(dates),
           year = year(dates))

month(dates, label = TRUE)

# ymd works on mixed date styles
x <- c(20090101, "2009-01-02", "2009 01 03", "2009-1-4", "2009-1 5", "Created on 2009 1 6", "200901 !!! 07")
ymd(x)

# differentiate parsers extract year, month and day in different orders
x <- "09/01/02"
ymd(x)
mdy(x)
ydm(x)
myd(x)
dmy(x)
dym(x)

now()
now("GMT")
now() %>% hour()
now() %>% minute()
now() %>% second()

# parse time
x <- c("12:34:56")
hms(x)

# parse datetime
x <- "Nov/2/2012 12:34:56"
mdy_hms(x)