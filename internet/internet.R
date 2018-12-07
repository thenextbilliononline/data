library(curl)

try(setwd("internet/"))

curl_download("http://api.worldbank.org/v2/countries/all/indicators/2.0.cov.In", "internet_coverage.txt")

