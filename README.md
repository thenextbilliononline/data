 
# Proposal

Through this project, we seek to understand the relationship between internet access and inequality on a global scale. We will use data from the United Nations to compare selected socio-economic indexes to international communication measurements.

We have outlined our questions, data sources, and folder structure below for those interested in replicating our work. 

## Questions

> Does internet access correlate with the chosen indicators of inequality?

$H_0$: Internet penetration rates are not correlated with the chosen equity indicators.  

$H_A$: Internet penetrateion rates are correlated with the chosen equity indicator.

> Do the economic indicators have a stronger affect on internet access than the social equity indicators?

$H_0$: Economic indicators have a stronger effect than social measurements on Internet access. 

$H_A$: Economic indicators do not have a stronger effect than social measurements on Internet access. 

## Motivation

We are interested in this problem as data scientists because our field is a mixed bag. On one hand, big data can be used to influence elections, spread hateful propaganda, and be used to track every purchase and decision we make. However, the Internet as a whole provides many positive economic outlets. We want to investigate the link between internet infrastructure and economic output as a way to measure the positive effects of internet access. 

## Data
Each folder will have it's own data-scraping/cleaning location, named after the indicator in question. Inside that folder, we will place a .R file (with plenty of comments!) that collects the data locally and uses as much automation as possible. Then, each file will be stored in the csvs section.

The following is an outline of the sources we plan on using:

### Internet Usage Indicators
 + [ITU data](https://www.itu.int/en/ITU-D/Statistics/Documents/statistics/2018/Individuals_Internet_2000-2017) International Telephone Union 

### Socio-Economic Indicators
 + [The Human Development Index](http://hdr.undp.org/en/indicators/137506): Composite index containing measurements of education, life expectancy, and gross national income.  *Maybe use [Multidimensional Poverty Index(MPI)](http://hdr.undp.org/en/2018-MPI) in addition to or instead of HDI*
 + [World Bank Development Indicators](https://datahelpdesk.worldbank.org/knowledgebase/articles/898599-api-indicator-queries): All kinds of other economics indicators, callable by ISO 3 letter country code.
 + [Big Mac Index](https://github.com/TheEconomist/big-mac-data): This is an indicator we can compare to the economic data.


## CSVs

This folder contains cleaned versions of all the datasets used. This way, it will be easy to import each data set. We will be left with internet penetration rates, a Wikipedia density indicator, a World Bank indicator, and a Big Mac Indicator, all indexed by the ISO 3 letter country code.

## Database

Each of these csvs will be imported and read into a database using R.

## Analysis

Our final analysis will live in the root directory and will have all of the fancy features needed to get an A. This are being tracked in the issues page for this repository.
