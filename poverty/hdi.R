# HUMAN DEVELOPMENT INDEX (HDI)

suppressWarnings(library(rvest, quietly =TRUE))
suppressWarnings(library(dplyr, quietly =TRUE))
suppressWarnings(library(stringr, quietly =TRUE))
suppressWarnings(library(tidyr, quietly =TRUE))
suppressWarnings(library(dplyr, quietly =TRUE))
suppressWarnings(library(ggplot2, quietly =TRUE))
suppressWarnings(library(curl, quietly =TRUE))

try(setwd("poverty/"))

## Downloading HDI data from official sources requires knowledge of javascript, which is outside the scope of this class. 
## For your reference, you can unhash and run code below to view .html output. 

#### curl_download("http://hdr.undp.org/en/indicators/137506", "hdi.html")
#### hdi.html <- read_html("hdi.html")

## For the purposes of this assignment, we have instead chosen to save and import the .csv file from the UNDP. 

hdi <- read.csv("hdi.csv", header = FALSE)
head(hdi)