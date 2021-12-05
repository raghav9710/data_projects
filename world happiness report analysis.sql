/* creating database world_happiness_report */

create database world_happiness_report;
use world_happiness_report;


/* imported all the tables with the help of table data import wizard, easy and fast for small datasets */

 
select *
from report_2021;



/* changing some of the columns name using alter statement */

alter table report_2018
rename column score to happiness_score; 

/* top 5 countries/region of world from year 2015 to 2021 */

#2021

select happiness_rank,rp_2021.country,happiness_score , c.region
from report_2021 rp_2021
join country_region c
on rp_2021.Country=c.Country
where happiness_rank between 1 and 5
order by happiness_rank;
 
 #year 2020
 
 
select happiness_rank,rp_2020.country,happiness_score , c.region
from report_2020 rp_2020
join country_region c
on rp_2020.Country=c.Country
where happiness_rank between 1 and 5
order by happiness_rank;

#year 2019


select happiness_rank,rp_2019.country,happiness_score , c.region
from report_2019 rp_2019
join country_region c
on rp_2019.Country=c.Country
where happiness_rank between 1 and 5
order by happiness_rank;

# year 2018


select happiness_rank,rp_2018.country,happiness_score , c.region
from report_2018 rp_2018
join country_region c
on rp_2018.Country=c.Country
where happiness_rank between 1 and 5
order by happiness_rank;

# year 2017

select happiness_rank,rp_2017.country,happiness_score , c.region
from report_2017 rp_2017
join country_region c
on rp_2017.Country=c.Country
where happiness_rank between 1 and 5
order by happiness_rank;


# year 2016


select happiness_rank,rp_2016.country,happiness_score , c.region
from report_2016 rp_2016
join country_region c
on rp_2016.Country=c.Country
where happiness_rank between 1 and 5
order by happiness_rank;


# year 2015

select happiness_rank,rp_2015.country,happiness_score , c.region
from report_2015 rp_2015
join country_region c
on rp_2015.Country=c.Country
where happiness_rank between 1 and 5
order by happiness_rank;

# as all the top 5 countries are from  western region
#western countries are happiest countries in the world.


/* least happiest country of the world from 2015 to 2021 */

# year 2021

select happiness_rank,rp_2021.country,happiness_score , c.region
from report_2021 rp_2021
join country_region c
on rp_2021.Country=c.Country
order by happiness_rank desc
limit 5;

# output
#Southern Asia
#Sub-Saharan Africa
#Sub-Saharan Africa
#Sub-Saharan Africa
#Sub-Saharan Africa


# yer 2020

select happiness_rank,rp_2020.country,happiness_score , c.region
from report_2020 rp_2020
join country_region c
on rp_2020.Country=c.Country
order by happiness_rank desc
limit 5;

# yer 2019

select happiness_rank,rp_2019.country,happiness_score , c.region
from report_2019 rp_2019
join country_region c
on rp_2019.Country=c.Country
order by happiness_rank desc
limit 5;

# yer 2018

select happiness_rank,rp_2018.country,happiness_score , c.region
from report_2018 rp_2018
join country_region c
on rp_2018.Country=c.Country
order by happiness_rank desc
limit 5;

# yer 2017

select happiness_rank,rp_2017.country,happiness_score , c.region
from report_2017 rp_2017
join country_region c
on rp_2017.Country=c.Country
order by happiness_rank desc
limit 5;

# yer 2016

select happiness_rank,rp_2016.country,happiness_score , c.region
from report_2016 rp_2016
join country_region c
on rp_2016.Country=c.Country
order by happiness_rank desc
limit 5;

# yer 2015

select happiness_rank,rp_2015.country,happiness_score , c.region
from report_2015 rp_2015
join country_region c
on rp_2015.Country=c.Country
order by happiness_rank desc
limit 5;

/*  Sub-Saharan Africa
Sub-Saharan Africa
Middle East and Northern Africa
Sub-Saharan Africa
Sub-Saharan Africa  
  
  southern aisa and sub-saharan africa is least happies region in the world*/
  
  
  /* 
  Top  5 countires of the world  *
  acessing top 5 rank and countires in single query using join */


select  rp_21.happiness_rank,rp_21.Country as country_21,
 rp_20.happiness_rank,rp_20.Country as country_20 
 ,rp_19.happiness_rank,rp_19.Country as country_19 ,
rp_18.Happiness_Rank ,rp_18.Country as country_18,rp_17.Happiness_Rank  ,  rp_17.Country as country_17,
 rp_16.Happiness_Rank,   rp_16.Country as country_16, rp_15.Happiness_Rank ,  rp_15.Country as country_15
from report_2021 as rp_21
join report_2020 as rp_20
on rp_21.Happiness_Rank=rp_20.Happiness_Rank
join report_2019 as rp_19 
on rp_21.Happiness_Rank=rp_19.Happiness_Rank
join report_2018 as rp_18
on rp_18.Happiness_Rank=rp_21.Happiness_Rank
join report_2017 as rp_17
on rp_17.Happiness_Rank=rp_21.Happiness_Rank
join report_2016 as rp_16
on rp_21.Happiness_Rank = rp_16.Happiness_Rank
join report_2015 as rp_15
on rp_15.Happiness_Rank= rp_21.Happiness_Rank
limit  5;



/*FINLAND is the happiest nation in the world
 finland was not even in top 5 in year 15 but finland became the happiest country of the world for 18 and 19
 and aslo netherlands also came in top 5 in 19 and switzerland was the happies in 15 but not in 
 even top 5 in year 19*/
 
 
 
 
 /* calculating happiness  score of happiest nation */
 
 select Happiness_Rank, country, Happiness_Score
 from report_2021
 where Happiness_Rank=1;
 
 select avg(rp_19.Happiness_Score) as avg_happinessscore_19,avg(rp_18.Happiness_Score) as avg_happinessscore_18,
 avg(rp_17.Happiness_Score) as avg_happinessscore_17,avg(rp_16.Happiness_Score) as avg_happinessscore_16,
 avg(rp_15.Happiness_Score) as avg_happinessscore_15
 from report_2019 as rp_19
join report_2018 as rp_18
on rp_18.Happiness_Rank=rp_19.Happiness_Rank
join report_2017 as rp_17
on rp_17.Happiness_Rank=rp_19.Happiness_Rank
join report_2016 as rp_16
on rp_19.Happiness_Rank = rp_16.Happiness_Rank
join report_2015 as rp_15
on rp_15.Happiness_Rank= rp_19.Happiness_Rank;





 /* calculating average GDP of countries of the years 2015-2019 in single query using joins  
 
 */
select avg(rp_19.GDP_per_capita) as avg_GDP_19,avg(rp_18.GDP_per_capita) as avg_GDP_18,
 avg(rp_17.Economy_GDP_per_Capita) as avg_GDP_17,avg(rp_16.Economy_GDP_per_Capita) as avg_GDP_16,
 avg(rp_15.GDP_per_Capita) as avg_GDP_15
 from report_2019 as rp_19
join report_2018 as rp_18
on rp_18.Happiness_Rank=rp_19.Happiness_Rank
join report_2017 as rp_17
on rp_17.Happiness_Rank=rp_19.Happiness_Rank
join report_2016 as rp_16
on rp_19.Happiness_Rank = rp_16.Happiness_Rank
join report_2015 as rp_15
on rp_15.Happiness_Rank= rp_19.Happiness_Rank;



/* calculating avg happiness score
using union for the neat and clean view */


select avg(Happiness_Score) , "2021" as year
from report_2021
union 
select avg(Happiness_Score) , "2020"
from report_2020
union
select avg(Happiness_Score) , "2019" as year
from report_2019
union 
select avg(Happiness_Score) , "2018"
from report_2018
union
select avg(Happiness_Score) , "2017"
from report_2017
union
select avg(Happiness_Score) ,"2016"
from report_2016
union
select avg(Happiness_Score) , "2015"
from report_2015;



/* calculating avg gdp over the year using union */

select avg(GDP_per_capita) , "2021" as year
from report_2021
union 
select avg(GDP_per_capita) , "2020"
from report_2020
union
select avg(GDP_per_capita) , "2019" as year
from report_2019
union 
select avg(GDP_per_capita) , "2018"
from report_2018
union
select avg(Economy_GDP_per_Capita) , "2017"
from report_2017
union
select avg(Economy_GDP_per_Capita) ,"2016"
from report_2016
union
select avg(GDP_per_Capita) , "2015"
from report_2015;

/*	avg(GDP_per_capita)	year
	0.9051474358974363	2019
	0.8836774193548387	2018
	0.9847182019096775	2017
	0.9538798089171973	2016
	0.8461372151898726	2015
    */
    

/* # calculating avg social support using unions */

select avg(Social_support) , "2021" as year
from report_2021
union 
select avg(Social_support) , "2020"
from report_2020
union    
select avg(Social_support) , "2019" as year
from report_2019
union 
select avg(Social_support) , "2018"
from report_2018
union
select avg(Family) , "2017"
from report_2017
union
select avg(Family) ,"2016"
from report_2016
union
select avg(Family) , "2015"
from report_2015;


/* avg health life expectancy */

select avg(Healthy_life_expectancy) , "2021" as year
from report_2021
union 
select avg(Healthy_life_expectancy) , "2020"
from report_2020
union
select avg(Healthy_life_expectancy) , "2019" as year
from report_2019
union 
select avg(Healthy_life_expectancy) , "2018"
from report_2018
union
select avg(Health_Life_Expectancy) , "2017"
from report_2017
union
select avg(Health_Life_Expectancy) ,"2016"
from report_2016
union
select avg(Health_Life_Expectancy) , "2015"
from report_2015;


    
    
/* avg freedom */


select avg(Freedom) , "2019" as year
from report_2019
union 
select avg(Freedom) , "2018"
from report_2018
union
select avg(Freedom) , "2017"
from report_2017
union
select avg(Freedom) ,"2016"
from report_2016
union
select avg(Freedom) , "2015"
from report_2015;


/* avg generosity */

select avg(Generosity) , "2019" as year
from report_2019
union 
select avg(Generosity) , "2018"
from report_2018
union
select avg(Generosity) , "2017"
from report_2017
union
select avg(Generosity) ,"2016"
from report_2016
union
select avg(Generosity) , "2015"
from report_2015;

/* avg corruption */

select avg(corruption) , "2019" as year
from report_2019
union 
select avg(corruption) , "2018"
from report_2018
union
select avg(Trust_Government_Corruption) , "2017"
from report_2017
union
select avg(Trust_Government_Corruption) ,"2016"
from report_2016
union
select avg(Trust_Government_Corruption) , "2015"
from report_2015;



 /* analysis of India */
 
 

select country , Happiness_Rank,Happiness_Score , Freedom ,Trust_Government_Corruption, "2015" as year
from report_2015
where country like "%india%"
union
select country , Happiness_Rank,Happiness_Score , Freedom , Trust_Government_Corruption,"2016"
from report_2016
where country like "%india%"
union
select country , Happiness_Rank,Happiness_Score , Freedom ,Trust_Government_Corruption,"2017"
from report_2017
where country like "%india%"
union
select country , Happiness_Rank,Happiness_Score , Freedom ,corruption,"2018"
from report_2018
where country like "%india%"
union
select country , Happiness_Rank,Happiness_Score , Freedom , corruption,"2019"
from report_2019
where country like "%india%"
union
select country , Happiness_rank, Happiness_Score , Freedom , corruption,"2020"
from report_2020
where country like "%india%"
union
select country , Happiness_Rank,Happiness_Score , Freedom , corruption,"2021"
from report_2021
where country like "%india%";

/* 	country	Happiness_Rank	Happiness_Score	Freedom	Trust_Government_Corruption	year
	India	117	4.565	0.39786	0.08492	2015
	India	118	4.404	0.40285	0.08722	2016
	India	122	4.315000057	0.469987005	0.092226885	2017
	India	133	4.19	0.539	0.093	2018
	India	140	4.015	0.498	0.085	2019
	India	144	3.573299885	0.581142247	0.105587982	2020
	India	139	3.819	0.622	0.106	2021
    
    we can see from the output that indian rank in world happiness report has been decreasing from the year 2015-2020 
    it only increased by in year 2021 but that is not significant change*/

/* happiness rank decreased constantly from year to 117-140 , 
happiness score decresed from 4.565 to 4.015 and freedom increased over the years ,
corrupption is remains almost same */

#calculating generosity in india over the years */


select generosity , "2015" as year
from report_2015
where Country like "%india%"
union 
select  generosity , "2016"
from report_2016
where Country like "%india%"
union
select  generosity , "2017"
from report_2017
where Country like "%india%"
union
select  generosity , "2018"
from report_2018
where Country like "%india%"
union
select  generosity , "2019"
from report_2019
where Country like "%india%"
union
select  generosity , "2020"
from report_2020
where Country like "%india%"
union
select  generosity , "2021"
from report_2021
where Country like "%india%";


/* generosity has been also decreased over the year */



# calculating health life expectancy over the years 

select Health_Life_Expectancy , "2015" as year
from report_2015
where Country like "%india%"
union 
select  Health_Life_Expectancy , "2016"
from report_2016
where Country like "%india%"
union
select  Health_Life_Expectancy , "2017"
from report_2017
where Country like "%india%"
union
select Healthy_life_expectancy  , "2018"
from report_2018
where Country like "%india%"
union
select Healthy_life_expectancy  , "2019"
from report_2019
where Country like "%india%"
union
select Healthy_life_expectancy  , "2020"
from report_2020
where Country like "%india%"
union
select Healthy_life_expectancy  , "2021"
from report_2021
where Country like "%india%";






select Family, "2015" as year
from report_2015
where Country like "%india%"
union 
select  Family, "2016"
from report_2016
where Country like "%india%"
union
select  Family , "2017"
from report_2017
where Country like "%india%"
union
select Social_support , "2018"
from report_2018
where Country like "%india%"
union
select Social_support, "2019"
from report_2019
where Country like "%india%"
union
select Social_support, "2020"
from report_2020
where Country like "%india%"
union
select Social_support, "2021"
from report_2021
where Country like "%india%";


select avg(corruption) , "2019" as year
from report_2019;

select corruption 
from report_2019
where country in ("india");


# seeing india's neighbour social support 


select Family, "2015" as year
from report_2015
where Country like "%pakistan%"
union 
select  Family, "2016"
from report_2016
where Country like "%pakistan%"
union
select  Family , "2017"
from report_2017
where Country like "%pakistan%"
union
select Social_support , "2018"
from report_2018
where Country like "%pakistan%"
union
select Social_support, "2019"
from report_2019
where Country like "%pakistan%";


select country , Happiness_Rank,Happiness_Score , Freedom ,Trust_Government_Corruption, "2015" as year
from report_2015
where country like "%india%"
union
select country , Happiness_Rank,Happiness_Score , Freedom , Trust_Government_Corruption,"2016"
from report_2016
where country like "%india%";






/* india's neighbour */


select happiness_rank , country
from report_2021
where country in ("pakistan");


select happiness_rank , country
from report_2021
where country in ("china");

select happiness_rank , country
from report_2021
where country in ("bangladesh");


select country , Happiness_Rank,Happiness_Score ,"2015" as year
from report_2015
where country like "%pakistan%"
union
select country , Happiness_Rank,Happiness_Score ,"2016"
from report_2016
where country like "%pakistan%"
union
select country , Happiness_Rank,Happiness_Score ,"2017"
from report_2017
where country like "%pakistan%"
union
select country , Happiness_Rank,Happiness_Score ,"2018"
from report_2018
where country like "%pakistan%"
union
select country , Happiness_Rank,Happiness_Score ,"2019"
from report_2019
where country like "%pakistan%"
union
select country , Happiness_Rank,Happiness_Score ,"2020"
from report_2020
where country like "%pakistan%"
union
select country , Happiness_Rank,Happiness_Score ,"2021"
from report_2021
where country like "%pakistan%";

/* pakistan rank also has been decreased by large number 
it was  on 81th rank in year 2015 but decreased to 105 in year 2021 */
















