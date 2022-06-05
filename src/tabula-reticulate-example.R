# Example scraping a table from a PDF using tabula-py and reticulate
# Follow set up instructions in set-up-tabula-python.md

xfun::pkg_attach2("tidyverse", "reticulate")

use_condaenv()

# Load tabula package as tb


tb <- import("tabula")
