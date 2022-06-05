# Example scraping a table from a PDF using tabula-py and reticulate
# Follow set up instructions in set-up-tabula-python.md

xfun::pkg_attach2("tidyverse", "reticulate")

# Find the the location of Python on your computer with `which python3` in the Terminal
use_python("/opt/homebrew/bin/python3")

# Load tabula package as tb
tabula <- import("tabula")

table_list <- tabula$read_pdf("https://www.visionofhumanity.org/wp-content/uploads/2020/10/GPI_2020_web.pdf", 
                        user_agent="Mozilla/5.0", pages="10")

df <- table_list[[1]] # Extract data table from list
head(df)
