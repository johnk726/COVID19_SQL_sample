/************************************************************************************
Data source: https://github.com/CSSEGISandData/COVID-19  -- Johns Hopkins University and others

Title:  Covid-19 Trend Analysis January 22, 2020 to April 16, 2020 - Programming Sample SQL
Purpose: Analyze COVID-19 Trends in U.S. and other countries. Examine worldwide coronavirus cases timeline.
Author: John Kim
Date: April 17, 2020
Updated by John Kim on 4/19/2020

Some key questions
1) What are some of the countries that have seen the greatest rate or number of confirmed cases? 
2) Which countries are seeing greatest daily rate of growth of new cases, and does their current trend indicate "flattening" of curve, i.e., Has rate of growth increased, decreased, or remained roughly the same? 
3) What does the data of these countries tell us?
4) What trends can be established? Predict how the pandemic will end, when is the peak, 
etc.
************************************************************************************/


USE covidDB   --- initialize db
GO

SELECT * FROM covid_19_data; --- check


--- Worldwide daily confirmed COVID-19 cases Jan-22 to Apr-16, 2020
SELECT observationdate, SUM(confirmed) AS World_cases
FROM covid_19_data
WHERE observationdate BETWEEN '1/22/20' AND '4/16/2020'
GROUP BY observationdate
ORDER BY World_cases, observationdate;


--- China daily confirmed COVID-19 cases Jan-22 to Apr-16, 2020
SELECT observationdate, SUM(Confirmed) AS China_cases FROM covid_19_data
WHERE Country_Region = 'Mainland China' AND observationdate BETWEEN '1/22/20' AND '4/16/2020'
GROUP BY observationdate
ORDER BY observationdate, China_cases;

--- Hong Kong daily confirmed COVID-19 cases Jan-22 to Apr-16, 2020
SELECT observationdate, SUM(Confirmed) AS HK_cases FROM covid_19_data
WHERE Country_Region = 'Hong Kong' AND observationdate BETWEEN '1/22/20' AND '4/16/2020'
GROUP BY observationdate
ORDER BY observationdate, HK_cases;

--- U.S. daily confirmed COVID-19 cases Jan-22 to Apr-16, 2020
SELECT observationdate, SUM(Confirmed) AS US_cases FROM covid_19_data
WHERE Country_Region = 'US' AND observationdate BETWEEN '1/22/20' AND '4/16/2020'
GROUP BY observationdate
ORDER BY observationdate, US_cases;

--- South Korea daily confirmed COVID-19 cases Jan-22 to Apr-16, 2020
SELECT observationdate, SUM(Confirmed) AS South_Korea_cases FROM covid_19_data
WHERE Country_Region = 'South Korea' AND observationdate BETWEEN '1/22/20' AND '4/16/2020'
GROUP BY observationdate
ORDER BY observationdate, South_Korea_cases;

--- Italy daily confirmed COVID-19 cases Jan-22 to Apr-16, 2020
SELECT observationdate, SUM(Confirmed) AS Italy_cases FROM covid_19_data
WHERE Country_Region = 'Italy' AND observationdate BETWEEN '1/22/20' AND '4/16/2020'
GROUP BY observationdate
ORDER BY observationdate, Italy_cases;

--- Germany daily confirmed COVID-19 cases Jan-22 to Apr-16, 2020
SELECT observationdate, SUM(Confirmed) AS Germany_cases FROM covid_19_data
WHERE Country_Region = 'Germany' AND observationdate BETWEEN '1/22/20' AND '4/16/2020'
GROUP BY observationdate
ORDER BY observationdate, Germany_cases;


--- Examining two days in March and two days in April to analyze daily growth trends of novel coronavirus cases by country. Should tell us something about how the curves of countries are progressing moving forward.

--- Confirmed cases by country for March 6, 2020
SELECT DISTINCT(country_region) AS country, SUM(confirmed) AS Mar_6_total
FROM covid_19_data
WHERE observationdate = '3/6/2020'
GROUP BY country_region
ORDER BY Mar_6_total;

--- Confirmed cases by country for March 5, 2020
SELECT DISTINCT(country_region) AS country, SUM(confirmed) AS Mar_5_total
FROM covid_19_data
WHERE observationdate = '3/5/2020'
GROUP BY country_region
ORDER BY Mar_5_total;

--- Confirmed cases by country for April 15, 2020
SELECT DISTINCT(country_region) AS country, SUM(confirmed) AS Apr_15_total
FROM covid_19_data
WHERE observationdate = '4/15/2020'
GROUP BY country_region
ORDER BY Apr_15_total;

--- Confirmed cases by country for April 16, 2020
SELECT DISTINCT(country_region) AS country, SUM(confirmed) AS Apr_16_total
FROM covid_19_data
WHERE observationdate = '4/16/2020'
GROUP BY country_region
ORDER BY Apr_16_total;

