library(tidyverse)
library(pdftools)
options(digits = 3)

# question 1
fn <- system.file("extdata", "RD-Mortality-Report_2015-18-180531.pdf", package="dslabs")

system("cmd.exe", input = paste("start", fn))

# question 2
txt <- pdf_text(fn)
txt
str(txt)

# question 3
x <- txt[9] %>% 
  str_split("\n")
str(x)
class(x)

# question 4
s <- x[[1]]
class(s)
str(s)
s
head(s)

# question 5
s <- str_trim(s)
s[1]

# question 6
str_which(s, "2015")
header_index <- str_which(s, "2015")[1]
str(header_index)
class(header_index)
header_index

# question 7
s[header_index]
header <- s[header_index]
header <- str_split(header, "\\s+", simplify = TRUE)
str(header)
class(header)
head(header)
month <- header[1,1]
month
header <- header[1,2:5]
header

# question 8
str(s)
s
tail_index <- str_which(s, "Total")
tail_index

# question 9
n <- str_count(s, "\\d+")
n
str(n)
n_index <- str_which(n, "1")
n_index

# question 10
n_index
tail_index
header_index
tmp_s <- s[-tail_index:-40]
tmp_s <- tmp_s[-n_index]
tmp_s <- tmp_s[-1:-header_index]
s <- tmp_s
s

# question 11
s <- str_remove_all(s, "[^\\d\\s]")

# question 12
s <- str_split_fixed(s, "\\s+", n = 6)[,1:5]
s
tmp_names <- c("day", header[1:4])
tmp_names
tab <- s %>% 
  data.frame(stringsAsFactors = FALSE) %>% 
  mutate_all(as.numeric) %>%
  setNames(tmp_names) %>%
  mutate(Month = "Sep")
tab

class(tab$'2015')

mean(tab$`2015`)
mean(tab$`2016`)
sep_1_19_only <- tab %>% filter(day <= 19) %>% select('2017')
mean(sep_1_19_only$`2017`)
sep_20_30_only <- tab %>% filter(day >= 20) %>% select('2017')
mean(sep_20_30_only$`2017`)

#question 13
tab <- tab %>% select(-Month) %>% gather(year, deaths, -day) %>%
  mutate(deaths = as.numeric(deaths))
tab

# question 14
tab %>%
  ggplot(aes(day, deaths, color = year)) +
  geom_line() + 
  geom_vline(xintercept = 20)



