select * from amazon;

## question21: Which customer type occurs most frequently?
select `customer type`,count(*) as maxCustomer from amazon group by `customer type` order by maxCustomer desc limit 1;
-- insights:- We ar grouping by its customer type and try to fetch fist one

## question22: Identify the customer type with the highest purchase frequency.
select `customer type`,count(*) as maxCustomer from amazon group by `customer type` order by maxCustomer desc limit 1;
select `customer type`,max(total) from amazon group by `customer type`;
-- insights:- Little bit doubt i.e seems to both above and this query is same 

## question23: Determine the predominant gender among customers.
select gender,count(*) as genderCount from amazon group by gender order by genderCount desc limit 1;
-- insights:- It is just asking most frequent gender in given dataset

## question24: Examine the distribution of genders within each branch.
select branch,gender,count(*) as genderCount from amazon group by branch,gender order by branch;
-- insights:- //ly to question13 - justing grouping its branch and gender together

## question25: Identify the time of day when customers provide the most ratings.
select timeofday,count(*) as ratingCount from amazon group by timeofday;
-- insights:- Just counting the most no.of transactions happend  by grouping its timeofday


## question26: Determine the time of day with the highest customer ratings for each branch.
WITH CTE_table AS (
    SELECT branch, timeofday, MAX(rating) AS maxrating
    FROM amazon
    GROUP BY branch, timeofday order by branch
)
SELECT branch, timeofday, maxrating
FROM CTE_table
WHERE (branch, maxrating) IN (
    SELECT branch, MAX(maxrating)
    FROM CTE_table
    GROUP BY branch
)
ORDER BY branch;
-- insights:- Here we are using CTE i.e to fetch the branch,timeofday,rating by grouping its branch and timeof day and then fetch which is top from each branch


## question27: Identify the day of the week with the highest average ratings.
select dayname,avg(rating) as rating from amazon group by dayname order by rating desc limit 1;
-- insights:- use aggregate function for rating group by its dayname and then fetch first row

## question28: Determine the day of the week with the highest average ratings for each branch.
with cte_table as (select branch,dayname,avg(rating) as avg_rating from amazon group by branch,dayname )
select branch,dayname,avg_rating from cte_table where(branch,avg_rating) in (select branch,max(avg_rating) from cte_table group by branch);
-- insights:- //lt to query 26 
