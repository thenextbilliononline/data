 
# Proposal

Through this project, we seek to understand the relationship between internet usage and proxy-measurements of global prosperty. We will use data from the World Bank to compare selected socio-economic indexes to international communication measurements.

We have outlined our questions, data sources, and folder structure below for those interested in replicating our work. 

## Motivation

As Data Scientists, we recognize that “big data” can be used to influence elections, spread hateful propaganda, and track every purchase and decision we make one. However, we believe that the Internet, as a whole provides, many positive economic outlets.

We seek to quantify the positive effects of internet access on a global scale through our analysis of internet usage rates and the social and economic indicators outlined below.

## Questions

> Does internet access correlate with the chosen indicators of inequality?

Null: Internet penetration rates are not correlated with the chosen equity indicators.  

Alternate: Internet penetrateion rates are correlated with the chosen equity indicator.

> Do the economic indicators have a stronger affect on internet access than the social equity indicators?

Null: Economic indicators have a stronger effect than social measurements on Internet access. 

Alternate: Economic indicators do not have a stronger effect than social measurements on Internet access. 

## Data
The indicators are in two different data-scraping/cleaning locations. You can find the `.Rmd` file for internet indicators in the inside the internet folder. The socio-economic variables are all in the indicator.R file in the main folder. Our storage method allows us to collect and tidy the data locally and optimizes as much automation as possible. 

The data outputs for these indicators have each been stored in the xml and csv folders.

The following are the World Bank indicators we selected: 
1. Socio-Economic Indicators: 
- SI.POV.GINI: Gini Index.
- NY.GDP.MKTP.KD.ZG: GDP Growth Rate (annual %).
- SE.ADT.LITR.ZS: Literacy rate, adult total (% of people ages 15 and above).

Internet Indicators 
- IT.NET.USER.ZS: Individuals using the Internet (% of population).

## CSV & XML Folders

These folder contains pre-parsed xml and cleaned csv versions of all the datasets used. 

## Analysis

Our final analysis will live in the root directory and will have all of the fancy features needed to get an A. This are being tracked in the issues page for this repository.
