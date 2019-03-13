# INDICATORS CURL XML & TIDY

#try(setwd(data)) **UNHASH AFTER PULL REQUEST**

## DEPENDENCIES

library(curl) 
library(XML) 
library(wbstats)
library(data.table)
library(tidyr)
library(dplyr)


# DOWNLOAD INDICATORS INTO XML FOLDER

# social and economic indicators
curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.POV.GINI?date=2000:2016&per_page=10000", "xml/gini.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/NY.GDP.MKTP.KD.ZG?date=2000:2016&per_page=10000", "xml/gdp.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/SE.ADT.LITR.ZS?date=2000:2016&per_page=10000", "xml/literacy.xml")

#Tidy GINI Index

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

gini.by.country <- split(literacy, as.factor(literacy$countryiso3code))
gini.by.country
annual.int <- c()
annual.mean <- c()
years <- c(2000:2016)

for (index in 1:17){
  annual.mean[[index]] <- mean(gini.by.country[[index]]$value, na.rm=TRUE)
}

gini.annual <- annual.mean

#Tidy GDP PPP data

xml.data <- xmlParse("xml/gdp.xml");
rootNode <- xmlRoot(xml.data);
xml.data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue));
xml.frame <- data.frame(t(xml.data),row.names=NULL);
xml.frame$date <- as.numeric(as.character(xml.frame$date));
xml.frame$value <- as.numeric(as.character(xml.frame$value));

gdp <- xml.frame %>%
  select(-indicator, -unit:-decimal) %>%
  group_by(countryiso3code) %>%
  arrange(countryiso3code, date) %>%
  filter(countryiso3code != '') %>%
  filter(date > 1999)

gdp.wide <- gdp %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE
gdp.by.country <- split(literacy, as.factor(literacy$countryiso3code))
gdp.by.country
annual.int <- c()
annual.mean <- c()
years <- c(2000:2016)

for (index in 1:17){
  annual.mean[[index]] <- mean(gdp.by.country[[index]]$value, na.rm=TRUE)
}

gdp.annual <- annual.mean

#Tidy Literacy Data
 
xml.data <- xmlParse("xml/literacy.xml");
rootNode <- xmlRoot(xml.data);
xml.data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue));
xml.frame <- data.frame(t(xml.data),row.names=NULL);
xml.frame$date <- as.numeric(as.character(xml.frame$date));
xml.frame$value <- as.numeric(as.character(xml.frame$value));

literacy <- xml.frame %>%
  select(-indicator, -unit:-decimal) %>%
  group_by(countryiso3code) %>%
  arrange(countryiso3code, date) %>%
  filter(countryiso3code != '') %>%
  filter(date > 1999)

literacy.wide <- literacy %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE

lit.by.country <- split(literacy, as.factor(literacy$countryiso3code))
lit.by.country
annual.int <- c()
annual.mean <- c()
years <- c(2000:2016)

for (index in 1:17){
  annual.mean[[index]] <- mean(lit.by.country[[index]]$value, na.rm=TRUE)
}

lit.annual <- annual.mean



write.csv(gini.wide, "csv/gini.csv");
write.csv(gdp.wide, "csv/gdp.csv");
write.csv(literacy.wide, "csv/literacy.csv")


