#' ---
#' title: "Lesson2"
#' author: "Christopher Gandrud"
#' date: "@date"
#' output: github_document
#' ---

#+ message=FALSE
xfun::pkg_attach2("tidyverse")


numeric_vector <- c(2.8, 2, 14.8, NA)

numeric_vector

# Stacked functions
round(x = mean(numeric_vector, na.rm = TRUE), digits = 1)

# Piped %>%
mean(numeric_vector, na.rm = TRUE) %>%
  round(x = .,digits = 1)

# Finds the mean and rounds to 1 digit
#
# @param x a numeric vector to find the mean of

mean_rounder <- function(x) {
  mean(x = x, na.rm = TRUE) %>%
    round(x = .,digits = 1)
}

mean_rounder(x = 1:1e2)



# Control flow, if statements
numeric_vector

greater_than_5 <- ifelse(numeric_vector >= 5, 
                         yes = 1, 
                         no = 0) 

numeric_vector >= 5

# Operators
1 >= 0
1 <= 0 
1 & 0
1 | 0
1 != 0
1 == 0

# for Loops

head(swiss)


for (i in 1:ncol(swiss)) {
  swiss[, i] %>%
    mean() %>%
    round(digits = 1) %>%
    paste(names(swiss)[i], ., '\n') %>%  # the . directs the pipe
    cat()
}

# Assign output to vector

n_columns = ncol(swiss)

means_output <- vector(length = n_columns)

for (i in 1:n_columns) {
  means_output[i] <- swiss[, i] %>%
    mean
}


# Apply
apply_out <- apply(X = swiss, MARGIN = 2, FUN = mean) %>%
  round(digits = 1)

parallel::detectCores()


# Multi-core
three_list <- list(A = rnorm(n = 1e5, mean = 1),
                   B = rnorm(n = 1e5, mean = 2),
                   C = rnorm(n = 1e5, mean = 5))
library(parallel)
mclapply(three_list, mean, mc.cores = 3)
