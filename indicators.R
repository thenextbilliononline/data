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
curl_download("http://api.worldbank.org/v2/countries/all/indicators/UNDP.HDI.XD?per_page=10000", "xml/hdi.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.POV.GINI?per_page=10000", "xml/gini.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.POV.RUHC?per_page=10000", "xml/pov.ruhc.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/SI.POV.URHC?per_page=10000", "xml/pov.urhc.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/1.1.PGap.Poor4uds?per_page=10000", "xml/pgap.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/NY.GDP.MKTP.PP.KD?per_page=10000", "xml/gdp.xml")

### internet indicators
curl_download("http://api.worldbank.org/v2/countries/all/indicators/IT.NET.USER.P3?per_page=10000", "xml/internet_users_per_thousand.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/IT.NET.SECR.P6?per_page=10000", "xml/secure_servers.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/2.0.cov.Int?per_page=10000", "xml/internet_coverage.xml")
curl_download("http://api.worldbank.org/v2/countries/all/indicators/1.1_ACCESS.ELECTRICITY.TOT?per_page=10000", "xml/electricity.xml")


#### Human Development Index (HDI): 
xml.data <- xmlParse("xml/hdi.xml")
rootNode <- xmlRoot(xml.data)
xml.data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue))
xml.frame <- data.frame(t(xml.data),row.names=NULL)
xml.frame$date <- as.numeric(as.character(xml.frame$date))

hdi <- xml.frame %>%
  select(-indicator, -unit, -obs_status, -decimal) %>%
  group_by(country) %>%
  arrange(country, date) %>%
  filter(countryiso3code != '') %>%
  filter(date == 1980 | date == 1990 | date == 2000 | date >= 2005) %>%
  filter(date != 2012)

hdi.wide <- hdi %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE

#Select variable for regression....

annual.hdi <- c()
for (year in 2000:2017){
  annual.hdi[[year-1999]] <- subset(hdi, date==year)
}
annual.hdi[2000]

# Instead of loop, we can use wide data frame to select values for annual.hdi

annual.hdi.1980 <- hdi.wide$`1980`
annual.hdi.1990 <- hdi.wide$`1990`
annual.hdi.2000 <- hdi.wide$`2000`
annual.hdi.2010 <- hdi.wide$`2010`

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
filter(date > 1979)

gini.wide <- gini %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE

#Example of GINI variable for one select year: 2010. 
gini.2010 <- data.frame(as.numeric(as.character(gini.wide$`2010`))) 
names(gini.2010)[1] <- "gini.2010"
gini.2010 %>% filter(gini.2010 != "NA") 
gini.2010


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
  filter(date > 1979)

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
  filter(date > 1979)

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
filter(date > 1979)

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
  filter(date > 1979)

gdp.wide <- gdp %>% spread(date, value) # STORE WIDE FRAMES FOR ANALYSIS TABLE



### Internet Indicators

indicators <- c("IT.NET.USER.P3", "IT.NET.SECR.P6", "IT.NET.BNDW.PC",  "gwp1", "IT.NET.BBND.P2", "IT.MOB.INVS.CD")
users <- wb(indicator = indicators[1])
servers <- wb(indicator = indicators[2])
bw_per_person <- wb(indicator = indicators[3])
internet_home <- wb(indicator = indicators[4])
fixed_broadband <- wb(indicator = indicators[5])
mobile_investment <- wb(indicator = indicators[6])

internet.stats <- wb(indicator = indicators, return_wide = TRUE, startdate = 2000, enddate = 2017)
internet.stats

countries <- unique(internet.stats$iso3c)
annual.int <- c()
country.int <- c()
for (year in 2000:2017){
annual.int[[year-1999]] <- subset(internet.stats, date==year)
}
annual.int[1]
country.int[1]

write.csv(internet.stats, "csv/internet.csv")



