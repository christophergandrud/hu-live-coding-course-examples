# Download Google mobility data 

xfun::pkg_attach2("rio", "tidyverse")
theme_set(theme_minimal())

mobility <- import("https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv")

write_csv(mobility, path = "src/data/mobility-data.csv")

