 
# Proposal

Through this project, we seek to understand the relationship between internet access and inequality on a global scale. We will use data from the United Nations to compare selected socio-economic indexes to international communication measurements.

We have outlined our questions, data sources, and folder structure below for those interested in replicating our work. 

## Questions

> What economic indicators (race, occupation, community poverty rate) are most strongly correlated with internet access rates? Can we build a model that accurately predicts said rates? 

> Are internet access rates a stronger predictor of poverty rates than other forms of social investment (ie roads, schools, hospitals)?

> Do these effects extend across internet technologies (cell phones and broadband internet)? If not, which type of infrastructure investment is better.
  

## Motivation

We are interested in this problem as data scientists because our field is a mixed bag. On one hand, big data can be used to influence elections, spread hateful propaganda, and be used to track every purchase and decision we make. These political consequences are well known. However, the Internet has a history of advancing economies, and those without the internet [tend to be left behind](https://www.pewresearch.org/fact-tank/2015/04/30/racial-and-ethnic-differences-in-how-people-use-mobile-technology/). To speak about this in particular, we need to investigate the ways in which internet access influences occupational outlook while controlling for other confounding factors like geography, race, and infrastructure investment more generally. 

## Data 
[American Community Survey](https://www.census.gov/data/developers/data-sets/acs-1year.html)  
[Annual Survey of State Finances](https://www.census.gov/programs-surveys/state.html)

## Methodology

We will build several models for predicting poverty rate, using both the generalized logistic model and the generalized linear model. In this way, we'll see how things like internet access and infrastructure investment influence poverty rates. The American Community Survey includes internet access rates, poverty, race, industry, language, occupation, place of birth, and familial origin. Using this data alone, we should be able to see if race or occupation is a better indicator of aggregate povery than internet access rates.

## Hypothesis

Pew Research says that [20% of teens are unable to finish their homework](https://www.pewresearch.org/fact-tank/2018/10/26/nearly-one-in-five-teens-cant-always-finish-their-homework-because-of-the-digital-divide/) due to the digital divide. The end result of this is likely low-skill careers and lower incomes. In fact, the internet tends to raise the tide for all, as a breadth study (also by Pew) showed that [per capita income and access rates are highly correlated](https://www.pewglobal.org/2016/02/22/internet-access-growing-worldwide-but-remains-higher-in-advanced-economies/technology-report-02-06c/). We'd like to investigate the relationship between technology and the economy and see if we can build models resilient to the particle type of device. [Previous work](https://www.mdpi.com/2072-4292/11/4/375) has used infrastructure invesment to build logistic models for poverty using satellite images of infrastructure. It is also well known that poverty and broadband access rates are [highly correlated](http://overflow.solutions/demographic-data/how-poverty-status-in-each-u-s-county-relates-to-internet-access/). However, it is unknown if there is an underlying causal factor or if internet can, _by itself_, lift people out of poverty. The McKinsey Global Institute did a massive study on the economic potential of [internet investment in China](https://www.mckinsey.com/~/media/McKinsey/Industries/High%20Tech/Our%20Insights/Chinas%20digital%20transformation/MGI%20China%20digital%20Full%20report.ashx) that will inform our approach in this matter. Finally, the Internet Society, a global organization that builds internet infrastructure (mostly in the developing world), has compiled [a list of internet penetration rates and other such metrics](https://www.internetsociety.org/wp-content/uploads/2017/08/Global_Internet_Report_2014_0.pdf) by country across the world. However, due to data collection limitations and the quality of data sources across continents, it would be impossible to investigate these things wtih respect to more generic features like race and infrastructure. Since the United States has a non-uniform income distribution across states, this should allow us to draw from a breadth of circumstances. Due to the multiplicative of effects in education, business opportunities, and spending opportunities available on the Internet, we suspect that governmental investment in digital infrastructure will have at least as much affect as road or school spending. Additionally, we suspect that this multiplier is reduced for cellular infrastructure relative to fixed (broadband) infrastructure because of the productivity gains associated with PCs over smartphones. This research will reveal to governments (both local and national) what kinds of infrastructure investment yields the most economic gains in the digital age. To our knowledge, this particular question has not been answered.

## Filesystem
* old/: old paper
* docs/: contains the github page of this project, viewable at thenextbilliononline.github.io/data
* data: contains the data and Rmd files
	* Community: Contains social indicators from ACS
	* Finance: Contains state spending data from ACS
	* Time: Contains an attempt at using the census api to scrape for time-series data, uncomplete
	* Cleaned...csv cleaned data used in the report file
* Presentation.Rpres: R slides document
* Presentation-cache: holds pre-modelled data for slides document
* Presentation-figure: holds images for slides document
* Presentation.md: Markdown version of slides document
* Report.pdf: The final report
* [Rpubs Presentation](https://rpubs.com/simplymathematics/internet-data)
* Readme.md: this document



