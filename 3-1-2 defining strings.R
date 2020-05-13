# double quotes define a string
s <- "Hello!"
s

# single quotes define a string
s <- 'Hello!'
s

# backquotes do not 
s <- `Hello!`
s

# error - unclosed quotes
s <- "10""
s

# correct
s <- '10"'
s

# cat shows what the string actually looks like inside R
cat(s)

s <- "5'"
cat(s)

# to include both single and double quotes in string, escape with \
s <- '5'10"' #error
s

s <- "5'10"" # error
s

s <- '5\'10"' #correct
s
cat(s)

s <- "5'10\"" #correct
cat(s)