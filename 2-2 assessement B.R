library(Lahman)
top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()

Master %>% as_tibble()

top_names <- top %>%
  left_join(Master)%>%
  select(playerID, nameFirst, nameLast, HR)

top_names

head(Salaries)
str(Salaries)

top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names)%>%
  select(nameFirst, nameLast, teamID, HR, salary)

top_salary

head(AwardsPlayers)
str(AwardsPlayers)
length(AwardsPlayers)

awards2016 <- AwardsPlayers %>% 
  filter(yearID == 2016)

AwardsPlayers %>%
  filter(yearID == 2016) %>%
  inner_join(top_names) %>%
  select(playerID) %>%
  distinct()%>%
  nrow()

AwardsPlayers %>%
  filter(yearID == 2016) %>%
  anti_join(top_names, by = "playerID") %>%
  select(playerID, awardID) %>%
  distinct(playerID)



inner_join(top_names, awards2016)
semi_join(awards2016, top_names)

anti_join(awards2016, top_names)
