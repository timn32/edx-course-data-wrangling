# original wide data
library(tidyverse)
path <- system.file("extdata", package = "dslabs")
filename <- file.path(path, "fertility-two-countries-example.csv")
wide_data <- read_csv(filename)
head(wide_data)

# tidy data from dslabs
library(dslabs) 
data("gapminder")
tidy_data <- gapminder %>%
  filter(country %in% c("South Korea", "Germany")) %>%
  select(country, year, fertility)

head(gapminder)
head(tidy_data)

#gather wide data to make new tidy data
new_tidy_data <- wide_data %>%
  gather(year, fertility, '1960': '2015')
head(new_tidy_data)

# gather all columns except country
new_tidy_data <- wide_data %>%
  gather(year, fertility, -country)
head(new_tidy_data)

#gather treats column names as characters by default
class(tidy_data$year)
class(new_tidy_data$year)

# convert gathered column names to numeric
new_tidy_data <- wide_data %>%
  gather(year, fertility, -country, convert = TRUE)
class(new_tidy_data$year)

# ggplot works on new tidy data
new_tidy_data %>%
  ggplot(aes(year, fertility, color = country)) + 
  geom_point()
