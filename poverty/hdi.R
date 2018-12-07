# HUMAN DEVELOPMENT INDEX (HDI)

library(curl)
library(XML)

try(setwd("poverty/"))

poverty.index <- curl_download("http://api.worldbank.org/v2/countries/all/indicators/UNDP.HDI.XD?date=2000:2017", "poverty.xml");
xmlParse("poverty.xml");
xml.data <- xmlParse("poverty.xml");
rootNode <- xmlRoot(xml.data)
xml.data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue))
xml.frame <- data.frame(t(xml.data),row.names=NULL)
hdi <- xml.frame
annual.hdi <- c()
for (year in 2000:2017){
  annual.hdi[[year-1999]] <- subset(hdi, date==year)
}
SSS