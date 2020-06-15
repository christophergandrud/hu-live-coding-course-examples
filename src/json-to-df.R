# Download and manipulate at list into a data frame

xfun::pkg_attach2("jsonlite")

# Download data
person_list <- fromJSON("https://brave-pasteur-c09ffa.netlify.app/slides/data/json-simple-example.json")

# Extract elements and place in data frame
person_df <- data.frame(
  first_name = person_list$firstName,
  last_name = person_list$lastName,
  street = person_list$address$streetAddress,
  city = person_list$address$city
)
