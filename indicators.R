# INDICATORS CURL XML & TIDY

#try(setwd(data)) **UNHASH AFTER PULL REQUEST**

## DEPENDENCIES

library(curl) 
library(XML) 
library(wbstats)
library(data.table)
library(tidyr)
library(dplyr)


## DOWNLOAD INDICATORS INTO XML FOLDER

### social and economic indicators
curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.POV.GINI?date=2000:2016&per_page=10000", "xml/gini.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/NY.GDP.MKTP.PP.KD?date=2000:2016&per_page=10000", "xml/gdp.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/SE.ADT.LITR.ZS?date=2000:2016&per_page=10000", "xml/literacy.xml")

#### GINI Index

xml.data <- xmlParse("xml/gini.xml");
rootNode <- xmlRoot(xml.data);
xml.data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue));
xml.frame <- data.frame(t(xml.data),row.names=NULL);
xml.frame$date <- as.numeric(as.character(xml.frame$date));

gini <- xml.frame %>%
select(-indicator, -unit:-decimal) %>%
group_by(countryiso3code) %>%
arrange(countryiso3code, date) %>%
filter(countryiso3code != '')  %>%
filter(date > 1999)

gini.wide <- gini %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE



#### Poverty Gap Indicators

#Download & tidy Poverty Gap, Less Than 4$ per Day data
xml.data <- xmlParse("xml/gini.xml");
rootNode <- xmlRoot(xml.data);
xml.data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue));
xml.frame <- data.frame(t(xml.data),row.names=NULL);
xml.frame$date <- as.numeric(as.character(xml.frame$date));

poor4usd <- xml.frame %>%
  select(-indicator, -unit:-decimal) %>%
  group_by(countryiso3code) %>%
  arrange(countryiso3code, date) %>%
  filter(countryiso3code != '')  %>%
  filter(date > 1999)

poor4usd.wide <- poor4usd %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE

#Download & tidy National Rural Poverty Gap data
xml.data <- xmlParse("xml/pov.ruhc.xml");
rootNode <- xmlRoot(xml.data);
xml.data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue));
xml.frame <- data.frame(t(xml.data),row.names=NULL);
xml.frame$date <- as.numeric(as.character(xml.frame$date));

ruhc <- xml.frame %>%
  select(-indicator, -unit:-decimal) %>%
  group_by(countryiso3code) %>%
  arrange(countryiso3code, date) %>%
  filter(countryiso3code != '')  %>%
  filter(date > 1999)

ruhc.wide <- ruhc %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE

#Download & tidy National Urban Poverty Gap data

xml.data <- xmlParse("xml/pov.urhc.xml");
rootNode <- xmlRoot(xml.data);
xml.data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue));
xml.frame <- data.frame(t(xml.data),row.names=NULL);
xml.frame$date <- as.numeric(as.character(xml.frame$date));

urhc  <- xml.frame %>%
select(-indicator, -unit:-decimal) %>%
group_by(countryiso3code) %>%
arrange(countryiso3code, date) %>%
filter(countryiso3code != '') %>%
filter(date > 1999)

urhc.wide <- urhc %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE


#Download & tidy GDP PPP data

xml.data <- xmlParse("xml/gdp.xml");
rootNode <- xmlRoot(xml.data);
xml.data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue));
xml.frame <- data.frame(t(xml.data),row.names=NULL);
xml.frame$date <- as.numeric(as.character(xml.frame$date));

gdp <- xml.frame %>%
  select(-indicator, -unit:-decimal) %>%
  group_by(countryiso3code) %>%
  arrange(countryiso3code, date) %>%
  filter(countryiso3code != '') %>%
  filter(date > 1999)

gdp.wide <- gdp %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE


# Literacy Data
 
xml.data <- xmlParse("xml/literacy.xml");
rootNode <- xmlRoot(xml.data);
xml.data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue));
xml.frame <- data.frame(t(xml.data),row.names=NULL);
xml.frame$date <- as.numeric(xml.frame$date);

literacy <- xml.frame %>%
  select(-indicator, -unit:-decimal) %>%
  group_by(countryiso3code) %>%
  arrange(countryiso3code, date) %>%
  filter(countryiso3code != '') %>%
  filter(date > 1999)

literacy.wide <- literacy %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE


write.csv(gini.wide, "csv/gini.csv")
write.csv(gdp.wide, "csv/gdp.csv")
write.csv(literacy.wide, "csv/literacy.csv")



