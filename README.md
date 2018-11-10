 
# Proposal

We are interested in researching internet access on a country level and comparing the findings against various global economic indicators. For the purposes of this project, we will be examining data from the Organization for Economic Cooperation and Development (OECD), WikiLocation, the Internet Telecommunications Union (ITU), the World Bank, and the Big Mac Index.

We have outlined our questions, data sources, and folder structure below for those interested in replicating our work. 

## Questions

> Are internet access and certain economic indicators correlated in the OECD?

$H_0$: Internet penetration rates are not correlated with the chosen economic indicator
$H_A$: Internet penetrateion rates are correlated with the chosen economic indicator

> Do these trends hold for a broader dataset?

$H_0$: The economic effect due to Internet access is the same in OECD and non-OECD countries

$H_A$: The economic effect due to Internet access is different amongst OECD and non-OECD countries


## Data
Each folder will have it's own data-scraping/cleaning location, named after the indicator in question. Inside that folder, we will place a .R file (with plenty of comments!) that collects the data locally and uses as much automation as possible. Then, each file will be stored in the csvs section.

The following is an outline of the sources we plan on using:

### OECD:
+ [OECD Broadband Statistics](https://www.oecd.org/sti/broadband/1.5-BBPenetrationHistorical-Data-2017-12.xls): This shows time series  broadband data across 35 OECD countries
 + [OECD Economic Data](https://stats.oecd.org/viewhtml.aspx?datasetcode=MEI_CLI&lang=en):  This shows time-series economics data across 35 OECD countries. Note the api query maker. It will make our life easy. 
 
### Global:
#### Internet Usage Indicators
 + [WikiLocation](http://wikilocation.org/documentation/index.html): Note the API. A count of the number of articles within a given location could be an indicator.
 + [ITU data](https://www.itu.int/en/ITU-D/Statistics/Documents/statistics/2018/Individuals_Internet_2000-2017) International Telephone Union 

 #### Economic Indicators
 + [World Bank Development Indicators](https://datahelpdesk.worldbank.org/knowledgebase/articles/898599-api-indicator-queries): All kinds of other economics indicators, callable by ISO 3 letter country code.
 + [Big Mac Index](https://github.com/TheEconomist/big-mac-data): This is an indicator we can compare to the economic data.

 I wonder what happens if we make the OECD a disjoint set from the rest of the data? **You might have to explain this more to me. Would we union the data of the member countries with the Wiki/ITU internet or WorldBank/BigMac datasets?

**Additional Quesitons on this Section** 
??  Which specific indicators do you want to examine? I think inflation (Consumer Price Index) could be an interesting one to look at. The project rubric does say narrow scope though, so I want to make sure that we keep our research targeted (for now) and we can expand more as we see fit. For exapmle, I was thinking we could either look at 1-2 economic indicators from each listed source, or perform a deeper analysis of just the OECD or Global data. Let me know what you think! 

## CSVs

This folder contains cleaned versions of all the datasets used. This way, it will be easy to import each data set. We will be left with internet penetration rates, a Wikipedia density indicator, a World Bank indicator, and a Big Mac Indicator, all indexed by the ISO 3 letter country code.

## Database

Each of these csvs will be imported and read into a database using R.

## Analysis

Our final analysis will live in the root directory and will have all of the fancy features needed to get an A. This are being tracked in the issues page for this repository.
