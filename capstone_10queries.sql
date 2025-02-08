select * from amazon;

-- Queries

 ## question1: What is the count of distinct cities in the dataset?
 select count(distinct(city)) from amazon;
 -- insights:- 1. distinct cities in column and count the how many distinct cities
 
 ## question2: For each branch, what is the corresponding city?
 select distinct city,branch from amazon;
 -- insights:- Here I am using distinct on both columns
 
 ## question3: What is the count of distinct product lines in the dataset?
 select count(distinct(`product line`)) from amazon;
 -- insights:- 1. distinct product line in column and count the how many product line
 
 ## question4: Which payment method occurs most frequently?
 select payment,count(payment) as cn_py from amazon group by payment order by cn_py desc limit 1;
 -- insights:- Here I am grouping by payments and put them in desc and trying to fetch first one 
 
 ## question5: Which product line has the highest sales?
 select `product line`,count(`product line`) as cn_pl from amazon group by `product line` order by cn_pl desc  limit 1;
 -- insights:- as same as above question logic 
 
## question6: How much revenue is generated each month?
select distinct monthname from amazon;
select sum(`total`) as revenue,monthname from amazon group by monthname;
-- insights:- calculating sum of gross income by grouping month name

## question7: In which month did the cost of goods sold reach its peak?
select sum(`total`) as revenue,monthname from amazon group by monthname order by revenue desc limit 1;
-- insights:- using same logic but here we are fetching top 1

## question8: Which product line generated the highest revenue?
select sum(`total`) as revenue,`product line` from amazon group by `product line` order by revenue desc limit 1;
-- insights:- calculating sum of gross income by grouping product line and fetching top revenue 

## question9: In which city was the highest revenue recorded?
select sum(`total`) as revenue,city from amazon group by city order by revenue desc limit 1;
-- insights:- calculating sum of gross income by grouping city and fetching top revenue 

## question10: Which product line incurred the highest Value Added Tax(VAT)?
select `tax 5%` from amazon;
select `product line`,max(`tax 5%`) as vat from amazon group by `product line` order by vat desc limit 1;
-- insights:- calculating max vat by group its product line and fetching top 1 
