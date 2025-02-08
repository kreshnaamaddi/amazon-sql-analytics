select * from amazon;

## question11: For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad." 
alter table amazon add performance_status varchar(10);

CREATE TEMPORARY TABLE avg_productline AS
SELECT `product line`, AVG(`total`) AS avg_gross_income
FROM amazon
GROUP BY `product line`;

UPDATE amazon a
JOIN avg_productline avg_data
ON a.`product line` = avg_data.`product line`
SET a.performance_status = CASE
    WHEN a.`total` > avg_data.avg_gross_income THEN 'Good'
    ELSE 'Bad'
END;

DROP TEMPORARY TABLE IF EXISTS avg_productline;

-- insights:- first create on column and then create tempory table and then try to update column using join and finally drop tempory table

## question 12: Identify the branch that exceeded the average number of products sold.
select branch, COUNT(`product line`) as countPr
from amazon
group by branch
having count(`product line`) > (
    select avg(product_count)
    from (
        select branch, count(`product line`) AS product_count
        from amazon
        group by branch
    ) AS avg_product_count
);
-- insights:- Need to get the records that are more than 333 by grouping its branch



## question 13: Which product line is most frequently associated with each gender?
SELECT 
    gender,
    `product line`,
    COUNT(*) AS product_count
FROM amazon
GROUP BY gender, `product line`
ORDER BY gender, product_count DESC;
-- insights:- we are counting the no.of records grouping its gender and product line


## question14: Calculate the average rating for each product line.
select distinct `product line`,avg(rating) as average_rating from amazon group by `product line`;
-- insights:-  Here we are using agggreaget function to calculate average and grouping with product

## question15: Count the sales occurrences for each time of day on every weekday.
select dayname,timeofday,count(*) from amazon group by dayname,timeofday order by dayname,timeofday ;
-- checking:- select count(*) from amazon where dayname='Friday' and timeofday='Afternoon';
-- insights:- we are counting the no.of records grouping its dayname and timeofday

## question16: Identify the customer type contributing the highest revenue.
select `customer type`,sum(`total`) as revenue from amazon group by `customer type` order by revenue desc limit 1;
-- insights:-  calculating sum of total group by its customer type

## question17: Determine the city with the highest VAT percentage.
select `city`,max(`tax 5%`) as vat from amazon group by `city` order by vat desc limit 1;
-- insights:- calculating max vat by group its city and fetching top 1

## question18: Identify the customer type with the highest VAT payments.
select `customer type`,max(`tax 5%`) as vat from amazon group by `customer type`;
-- checking purpose:- select `tax 5%`,`customer type` from amazon order by `tax 5%` desc;
-- insights:-  calculate max vat and group by customer type

## question19: What is the count of distinct customer types in the dataset?
select count(distinct `customer type`) from amazon;
-- insights:- count the distinct types of cutsomer 

## question20: What is the count of distinct payment methods in the dataset?
select count(distinct payment) from amazon;
-- insights:- count the distinct types of payments 



