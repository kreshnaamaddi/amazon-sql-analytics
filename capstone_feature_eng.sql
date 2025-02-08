
-- create database_name capstone
create database capstone;
-- use newly created database capstone
use capstone;

-- feature engineering 
select date from amazon;
-- 1. Add a new column named timeofday to give insight of sales in the Morning, Afternoon and Evening. 

ALTER TABLE amazon
ADD COLUMN timeofday VARCHAR(10);

UPDATE amazon
SET timeofday = CASE
    WHEN time >= '06:00:00' AND time < '12:00:00' THEN 'Morning'
    WHEN time >= '12:00:00' AND time < '18:00:00' THEN 'Afternoon'
    WHEN time >= '18:00:00' AND time < '24:00:00' THEN 'Evening'
    ELSE 'Night' 
END;

select timeofday from amazon;

-- -----
-- 2.  Add a new column named dayname that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). 
select date from amazon;

ALTER TABLE amazon
ADD COLUMN dayname VARCHAR(10);

UPDATE amazon
SET dayname = DAYNAME(date);

select dayname from amazon;

-- ------
-- 3. Add a new column named monthname that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar).
ALTER TABLE amazon
ADD COLUMN monthname VARCHAR(10);

UPDATE amazon
SET monthname = DATE_FORMAT(date, '%b');

select monthname from amazon;









