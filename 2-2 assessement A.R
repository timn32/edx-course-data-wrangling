state <- c("Alabama", "Alaska", "Arizona", "Delaware", "District of Columbia")
state
population <- c(4779736,710231, 6392017, 897934, 601723)
population

tab1 <- data.frame(state, population)
tab1

state <- c("Alabama", "Alaska", "Arizona", "California", "Colorado", "Connecticut")
electoral_votes <- c(9,3,11,55,9,7)

tab2 <- data.frame(state, electoral_votes)
tab2

dim(tab1)

dim(tab2)

semi_join(tab1, tab2, by = "state")
