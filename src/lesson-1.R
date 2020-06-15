# Load packages 
xfun::pkg_attach2("tidyverse")

# Scalars
number <- 10
number

character <- 'hello world'

mean(words)

# Vectors
numbers <- c(1, 2, "hello world")
numbers


# Data frames
# Create numeric vector
numeric_vector <- c(2.8, 2, 14.8)

# Show numeric_vector's contents
numeric_vector

character_vector <- c("Albania", "Botswana", "Cambodia")

# Show character_vector's contents
character_vector


string_num_matrix <- cbind(character_vector, numeric_vector)
string_num_matrix

string_num_df <- data.frame(character_vector, numeric_vector)
string_num_df

new_countries <- string_num_df$character_vector

# Subscripts
string_num_df[2 , ]

head(string_num_df)
tail(string_num_df)

string_num_df[, "character_vector"]


1:100

string_num_df[1:2, ]



character_vector <- c(character_vector, "Albania")

character_vector 

# Convert to factor
factor_vector <- factor(character_vector)
table(factor_vector)


