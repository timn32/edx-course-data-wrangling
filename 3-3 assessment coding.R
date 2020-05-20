staff <- c("Mandy, Chris and Laura", "Steve, Ruth and Frank")
day <- c("Monday", "Tuesday")

schedule <- data.frame(day, staff)
schedule

schedule %>%
  mutate(staff = str_split(staff, ", | and ", simplify = TRUE)) %>%
  unnest()


separate(schedule, staff, into = c("s1","s2","s3"), sep = “,”) %>% 
  gather(key = s, value = staff, s1:s3)

data("gapminder")
head(gapminder)

library(rvest)
library(tidyverse)
library(stringr)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[5]] %>% html_table(fill = TRUE)

head(polls)

new_polls <- polls %>%
  setNames(c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")) %>%
  filter(str_detect(remain, "%"))

head(new_polls)     
nrow(new_polls)