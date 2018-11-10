 
# Proposal

Our goal is to examine internet access and equity on a gloal scale. We seek to measure the relationship between internet access and selected socio-economic indicators. 

For the purposes of this project, we will be examining data from the Internet Telecommunications Union (ITU), U.N., World Bank, and Big Mac Index.

We have outlined our questions, data sources, and folder structure below for those interested in replicating our work. 

## Questions

> Does internet access *(usage?)* correlate with the chosen economic indicators?

$H_0$: Internet penetration rates are not correlated with the chosen economic indicator.  

$H_A$: Internet penetrateion rates are correlated with the chosen economic indicator.

> Do these trends hold true for broader socio-economic indicators?

$H_0$: The economic effect due to Internet access correlates with the chosen socio-economic measurements. 

$H_A$: The economic effect due to Internet access does not correlate with the chosen socio-economic measurements. 


## Data
Each folder will have it's own data-scraping/cleaning location, named after the indicator in question. Inside that folder, we will place a .R file (with plenty of comments!) that collects the data locally and uses as much automation as possible. Then, each file will be stored in the csvs section.

The following is an outline of the sources we plan on using:

### Internet Usage Indicators
 + [ITU data](https://www.itu.int/en/ITU-D/Statistics/Documents/statistics/2018/Individuals_Internet_2000-2017) International Telephone Union 

### Socio-Economic Indicators
 + [The Human Development Index](http://hdr.undp.org/en/indicators/137506): Composite index containing measurements of education, life expectancy, and gross national income. 
 + [World Bank Development Indicators](https://datahelpdesk.worldbank.org/knowledgebase/articles/898599-api-indicator-queries): All kinds of other economics indicators, callable by ISO 3 letter country code.
 + [Big Mac Index](https://github.com/TheEconomist/big-mac-data): This is an indicator we can compare to the economic data.


## CSVs

This folder contains cleaned versions of all the datasets used. This way, it will be easy to import each data set. We will be left with internet penetration rates, a Wikipedia density indicator, a World Bank indicator, and a Big Mac Indicator, all indexed by the ISO 3 letter country code.

## Database

Each of these csvs will be imported and read into a database using R.

## Analysis

Our final analysis will live in the root directory and will have all of the fancy features needed to get an A. This are being tracked in the issues page for this repository.
