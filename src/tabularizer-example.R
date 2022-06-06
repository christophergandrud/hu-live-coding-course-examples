# Tabulariser examples
######## DEPRECATED #############

xfun::pkg_attach2("tabulizer")

url <- "http://visionofhumanity.org/app/uploads/2019/07/GPI-2019web.pdf"

all_tables <- extract_tables(file = url,
                             pages = 10, # tenth page of the PDF
                             output = "data.frame")

locate_areas(file = url)



"https://www.gov.uk/search/news-and-communications?level_one_taxon=5b7b9532-a775-4bd2-a3aa-6ce380184b6c&people%5B%5D=boris-johnson&order=updated-newest"


xfun::pkg_attach2("rvest")

one_announcement <- read_html("https://www.gov.uk/government/speeches/pm-statement-at-the-coronavirus-press-conference-10-june-2020")


"//*[@id="js-results"]/div/ol/li[6]/a"

'//*[@id="js-results"]/div/ol/li[6]/a'
