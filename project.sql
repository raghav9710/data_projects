select * from features;
select * from sales;
select * from store;

alter table  sales
drop column date ;

update sales
set date_new = str_to_date(date,"%d-%m-%Y");


/*Q1 Order numbers and total sales from 2010 until 2012  */

select count(*) as total_number_of_sales
from sales ;


/* so total 421750 sales happende between 2010 and 2012 */

/* total sales year wise */

select year(date_new),count(*)
from sales 
group by year(date_new)
order by count(*) desc;

/* so we can see that maximum number of sales has been done in year 2011 and minimum 
number of sales has been done in year 2012 
2011	153453
2010	140679
2012	127438*/


/* find the sales month wise */

select month(date_new) , count(*) as total_sale
from sales 
group by month(date_new)
order by count(*) desc ;

/* by using this query , we can see that the max number of sales has been done in the month of APRIL,JULY,MARCH
and minimum number of sales has been done in JANUARY,DECEMBER,NOVEMBER */

/* find the month of max and min sales in every year  */

select distinct year_no , month_no , max(total_sale)
from (
select year(date_new) as year_no , month(date_new) as month_no, count(*) as total_sale
from sales 
group by year(date_new) , month(date_new)
order by year(date_new) desc,count(*) desc) as tt
group by year_no;

/* so using this query , we can see that in year 2012 max sales happened in month MARCH and
in year 2011 AND 2010 max sales happened in  DECEMBER */





/* using this query we can find out the total sale done by all the stores in year 2010,2011,2012 */

select sum(Weekly_Sales)
from sales ;

select year(date_new) , sum(Weekly_Sales)
from sales 
group by year(date_new)
order by sum(Weekly_Sales) desc;

/* using this query we can find out the max amount of sales done in which year, as we can see the max sales done 
in year 2011 and min in 2012 */

select isholiday , sum(Weekly_Sales)
from sales 
group by IsHoliday
order by sum(Weekly_Sales) desc;

/* usiing this query we can see that max amt of sales has been done when there is  no holiday , important
conclusion */



/* now we will try to find out the sales done by each store */

select sum(Weekly_Sales)
from sales ;

select store , sum(weekly_sales) as total_sold_amount
from sales 
group by store
order by sum(Weekly_Sales) desc;

/* by using this query we can find out the sale done by each store and as well we can find out
the max sale done by which store. max sale done by store 20 and minimum sale has been done by
store 33 */



/* now we will try to find sale done by dept wise as well */

select store , dept , sum(weekly_sales)
from sales 
group by store ,dept 
order by store , sum(Weekly_Sales) desc;

/* by using this query we can easily find out the sale done by each dept in every store 
for example , max sale in store  1 has been done by dept 92 */



select  store , dept , max(total_amt) 
from (
select store , dept , sum(weekly_sales) as total_amt
from sales 
group by store ,dept 
order by store , sum(Weekly_Sales) desc) as tt
group by store;

/* using this query we can easily find out the max sale done by which department and their respective rank according
to their sales and which store they belong to
so that we could give more attention to dept with poor ranking */


select store , dept , total_amt , dense_rank() over (partition by dept order by total_amt desc ) as ranking
from (
select store , dept , sum(weekly_sales) as total_amt 
from sales 
group by store ,dept 
order by store , sum(Weekly_Sales) desc) as tt
;

select *
from store;


select sa.store , sa.dept , sum(sa.weekly_sales) as ttl_amt , st.type
from sales sa
join store st
on sa.store=st.store
group by store ,dept 
order by store , sum(Weekly_Sales) desc;

/* using this query we can easily find out the the type of store as well wether it is type of A or B */


select max(size ) as max_size , min(size) as min_size
from store;

/* using this query , we can find the max and min size of store */

select avg(size) 
from store;

/* we can find the avg size as well using this query */

select type , count(*)
from store 
group by type;

/* using this query we can find out the type of store and how many of each is there */



select s.store  , st.size,sum(s.weekly_sales) as ttl
from sales s
join store st
on s.store=st.store
group by s.store
order by st.size desc;

/* 
conclusion 1
using this query , we can find out that there is as such no effect os size on total sales , it is not 
necessary that store having bigger size will have one large amount of sales */

select st.type , sum(s.weekly_sales)
from store st
join sales s
on s.Store=st.Store
group by st.type
order by 2 desc;

/* using this query we can see that max amt of sales has been done by store A and min by type c
but the no of type c stores are also less in number */




select * from features;

select max(temperature), min(temperature)
from features;

/* using this query , we can find out the max and min temp */

/* avg comfort temperature is aroudn 68 farhenite */

select sum(Weekly_Sales)
from sales s 
join features f
on f.Store=s.store and f.date_new=s.date_new
where Temperature between 60 and 80;

select sum(Weekly_Sales)
from sales s 
join features f
on f.Store=s.store and f.date_new=s.date_new
where Temperature >80;

select sum(Weekly_Sales)
from sales s 
join features f
on f.Store=s.store and f.date_new=s.date_new
where Temperature <60;






/* using this query , we can see that when temp is between 60 and 80 then sale is good but max sale is 
when temp is  <60
and min sales when temp >80, so we can conclude that people enjoy to shop on when temperature is not too much
high */



/* let see the effect of fuel price on sales */

select max(fuel_price),min(fuel_price),avg(fuel_price)
from features;
/* using this query we can see tha price of fuel max amt was 4 and min was 2 and avg price was 3.5100*/


select  sum(weekly_sales)
from sales;

select sum(weekly_sales)
from sales s
join features f
on f.Store=s.Store and f.date_new=s.date_new
where fuel_price >3;
/*6736753669*/

select sum(weekly_sales)
from sales s
join features f
on f.Store=s.Store and f.date_new=s.date_new
where fuel_price  <3;

/*there is no direct impact of sales due to price flactuation */


/* lets see the impact of unemployment rate on sale */

select max(unemployment) , min(unemployment), avg(unemployment)
from features;

/* max =14 , min=0 ,  avg =7.2625 */

select sum(weekly_sales)
from sales s
join features f
on f.store=s.store and f.date_new = s.date_new
where Unemployment <7.2625;

select sum(weekly_sales)
from sales s
join features f
on f.store=s.store and f.date_new = s.date_new
where Unemployment >7.2625;

/* most of the time unemployment rate is same so there is as such no impact on sales 
due to this attribute */




/* IMPACT OF CONSUMER PRICE INDEX */

select max(cpi) , min(cpi), avg(cpi) 
from features;


select sum(weekly_sales)
from sales s
join features f
on f.store=s.store and f.date_new = s.date_new
where cpi <160;

select sum(weekly_sales)
from sales s
join features f
on f.store=s.store and f.date_new = s.date_new
where cpi >160;

/* there is no significant impact of cpi */







































