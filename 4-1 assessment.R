library(dslabs)
library(lubridate)
options(digits = 3)

# questions 3 and 4
data("brexit_polls")

head(brexit_polls)

brexit_polls %>% 
  mutate(start_month = month(startdate)) %>%
  filter(start_month == 4) %>%
  nrow()

brexit_polls %>%
  mutate(end_date_rounded = round_date(enddate, unit = "week")) %>%
  filter(end_date_rounded == "2016-06-12") %>%
  nrow()

brexit_polls %>%
  mutate(end_week_day = weekdays(enddate)) %>%
  group_by(end_week_day) %>%
  summarize(n = n()) %>%
  arrange(desc(n))

# question 5
data("movielens")

head(movielens)

movielens %>%
  mutate(date_time = as_datetime(timestamp)) %>%
  mutate(year = year(date_time), hour = hour(date_time)) %>%
  group_by(year) %>%
  summarize(n = n()) %>%
  arrange(desc(n))
  head
  
  
  movielens %>%
    mutate(date_time = as_datetime(timestamp)) %>%
    mutate(year = year(date_time), hour = hour(date_time)) %>%
    group_by(hour) %>%
    summarize(n = n()) %>%
    arrange(desc(n))
  
# question 6
library(tidyverse)
library(gutenbergr)
library(tidytext)
library(dplyr)
options(digits = 3)

gutenberg_metadata

gutenberg_metadata %>%
  filter(str_detect(title, "Pride and Prejudice")) %>%
  group_by(gutenberg_id) %>%
  summarize() %>%
  nrow()

gutenberg_works(title == "Pride and Prejudice")

gutenberg_download(gutenberg_id = 1342)

words <- gutenberg_download(gutenberg_id = 1342) %>%
  unnest_tokens(word, text)

str(words)

words %>%
  filter(!word %in% stop_words$word) %>%
  nrow()

words <- words %>%
  filter(!word %in% stop_words$word) %>%
  filter(!str_detect(word, "\\d+"))

nrow(words)

words  %>%
  group_by(word) %>%
  summarise(n = n()) %>%
  filter(n > 100) %>%
  arrange(desc(n)) %>%
  nrow()


afinn <- get_sentiments("afinn")

afinn_sentiments <- words %>%
  inner_join(afinn, by = "word")

nrow(afinn_sentiments)
  
afinn_sentiments %>%
  group_by(word) %>%
  summarise(n = n()) %>%
  nrow()

words_positive_negative <- words %>% 
  inner_join(afinn, by = "word") %>%
  mutate(positive = value > 0, negative = value < 0, zero = value ==0)

sum(words_positive_negative$positive)/(sum(words_positive_negative$positive)+ sum(words_positive_negative$negative))

words %>% 
  inner_join(afinn, by = "word") %>%
  mutate(positive_negative = )
  filter(value > 0) %>%
  group_by(word) %>%
  summarise(n = n()) %>%
  nrow()

words %>% 
  inner_join(afinn, by = "word") %>%
  filter(value == 4) %>%
  nrow()



