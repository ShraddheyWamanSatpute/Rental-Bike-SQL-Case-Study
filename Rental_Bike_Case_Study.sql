CREATE DATABASE rent_bike;
USE rent_bike;

-- Problem Statement 1
SELECT category, COUNT(model) AS number_of_bikes
FROM bike
GROUP BY category
HAVING COUNT(model)>2;


-- Problem Statement 2
SELECT c.name, COUNT(m.membership_type_id) AS membership_count
FROM customer c
INNER JOIN membership m
ON c.id = m.customer_id
GROUP BY c.name
ORDER BY membership_count DESC;


-- Problem Statement 3
SELECT 
id, 
category, 
price_per_hour AS old_price_per_hour, 
price_per_day AS old_price_per_day, 
ROUND(CASE
	WHEN category = 'electric' THEN price_per_hour - ((price_per_hour*10)/100)
    WHEN category = 'mountain bike' THEN price_per_hour - ((price_per_hour*20)/100)
    ELSE price_per_hour - ((price_per_hour*50)/100)
END,2) AS new_price_per_hour,
ROUND(
	CASE
		WHEN category = 'electric' THEN price_per_day - ((price_per_day*20)/100)
        WHEN category = 'mountain bike' THEN price_per_day - ((price_per_day*50)/100)
        ELSE price_per_day - ((price_per_day*50)/100)
END,2) AS new_price_per_day
FROM bike;


-- Problem Statement 4
SELECT category,
COUNT(CASE WHEN status = 'rented' THEN 1 END) AS 'rented_bikes_count',
COUNT(CASE WHEN status = 'available' THEN 1 END) AS 'available_bikes_count'
FROM bike
GROUP BY category;


-- Problem Statement 5
SELECT 
    YEAR(start_timestamp) AS year, 
    MONTH(start_timestamp) AS month, 
    SUM(total_paid) AS revenue
FROM rental
GROUP BY YEAR(start_timestamp), MONTH(start_timestamp)
UNION ALL
SELECT 
    YEAR(start_timestamp) AS year, 
    NULL AS month, 
    SUM(total_paid) AS revenue
FROM rental
GROUP BY YEAR(start_timestamp)
UNION ALL
SELECT 
    NULL AS year, 
    NULL AS month, 
    SUM(total_paid) AS revenue
FROM rental
ORDER BY 
    year IS NULL,   
    year, 
    month IS NULL,  
    month;
    
-- Problem Statement 6
SELECT 
    YEAR(m.start_date) AS year, 
    MONTH(m.start_date) AS month, 
    mt.name AS membership_type_name, 
    SUM(m.total_paid) AS total_revenue
FROM membership m
JOIN membership_type mt ON m.membership_type_id = mt.id
GROUP BY year, month, membership_type_name
ORDER BY year, month, membership_type_name;

-- Problem Statement 7
SELECT 
    IFNULL(membership_type_name, 'All Membership Types') AS membership_type_name,
    CASE 
        WHEN month IS NULL THEN 'All Months'
        ELSE month
    END AS month,
    total_revenue
FROM (
    SELECT 
        mt.name AS membership_type_name,
        MONTH(m.start_date) AS month,
        SUM(m.total_paid) AS total_revenue
    FROM membership m
    JOIN membership_type mt ON m.membership_type_id = mt.id
    WHERE YEAR(m.start_date) = 2023
    GROUP BY mt.name, MONTH(m.start_date) WITH ROLLUP
) AS sub
ORDER BY membership_type_name, month;


-- Problem Statement 8
SELECT 
  CASE 
    WHEN cnt > 10 THEN 'more than 10'
    WHEN cnt BETWEEN 5 AND 10 THEN 'between 5 and 10'
    ELSE 'fewer than 5'
  END AS rental_count_category,
  COUNT(*) AS customer_count
FROM (
    SELECT c.id, COUNT(r.id) AS cnt
    FROM customer c
    LEFT JOIN rental r ON c.id = r.customer_id
    GROUP BY c.id
) AS customer_rental_counts
GROUP BY rental_count_category;

















