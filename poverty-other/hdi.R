# HUMAN DEVELOPMENT INDEX (HDI)

suppressWarnings(library(rvest, quietly =TRUE))
suppressWarnings(library(dplyr, quietly =TRUE))
suppressWarnings(library(stringr, quietly =TRUE))
suppressWarnings(library(tidyr, quietly =TRUE))
suppressWarnings(library(dplyr, quietly =TRUE))
suppressWarnings(library(ggplot2, quietly =TRUE))
suppressWarnings(library(curl, quietly =TRUE))

try(setwd("poverty/"))

## Downloading HDI data from official sources includes javascript requirements, which are outside the scope of this class. 
## For your reference, you can unhash and run code below to view .html output. 

#### curl_download("http://hdr.undp.org/en/indicators/137506", "hdi.html")
#### hdi.html <- read_html("hdi.html")

## For the purposes of this assignment, we have instead chosen to save and import the .csv file directly from the UNDP. 


## HDI 2007 - 2017
hdi <- read.csv("hdi.csv", header = FALSE) 
hdi %>% 
  select(-V3:-V36, -V38, -V40, -V42, -V44, -V46, -V48, -V50, -V52, -V54, -V56, -V58) %>%
  rename(hdi.rank = V1, country = V2, yr.2007 = V37, yr.2008 = V39, yr.2009 = V41, yr.2009 = V41, yr.2010 = V43, yr.2011 = V45, yr.2012 = V47, yr.2013 = V49, yr.2014 = V51, yr.2015 = V53, yr.2016 = V55, yr.2017 = V57) %>%
  slice(3:191) %>%
  mutate(hdi.rank = as.numeric(hdi.rank)) %>%
  arrange(as.numeric(hdi.rank))

