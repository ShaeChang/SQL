/*
Created by: Shae Chang
Create Date: 05/30/2023
Description: Grouping
*/

/* 
What are the average invoice total by city?
GROUP BY clause
*/

SELECT
	BillingCity,
	ROUND(avg(total), 2) AS Total
	-- the aggeration field
FROM
	Invoice
GROUP BY
	BillingCity
	-- group by the none aggeragation field
ORDER BY
	BillingCity;
	
/*
What are the average invoice totals by city for only the cities that start with L?
WHERE clause
*/

SELECT
	BillingCity,
	ROUND(avg(total), 2) AS Total
FROM
	Invoice
WHERE
	-- where clause always comes after "FROM" and before "GROUP BY"
	BillingCity LIKE 'L%'
GROUP BY
	BillingCity
ORDER BY
	BillingCity;
	
/*
What are the average invoice totals greater than $5?
HAVING clause
*/
	
SELECT
	BillingCity,
	ROUND(avg(total), 2)
FROM
	Invoice
GROUP BY
	BillingCity
HAVING
	-- always comes **after** GROUP BY
	avg(total) > 5
ORDER BY
	BillingCity;

/*
Summerize:
WHERE clause is for the none-aggregated data, 
while the HAVING clause is for the data contain aggregates.
HAVING clause acts as a further filter
*/

/*
What are the average invoice totals greater than $5 for cities starting with B?
HAVING & WHERE clause combination
*/
	
SELECT
	BillingCity,
	ROUND(avg(total), 2)
FROM
	Invoice
WHERE
	BillingCity LIKE 'B%'
GROUP BY
	BillingCity
HAVING
	-- always comes **after** GROUP BY
	avg(total) > 5
ORDER BY
	BillingCity;

/*
What are the average invoice totals by billing country and city?
Grouping by more than one field at a time
*/	

SELECT
	BillingCountry,
	BillingCity,
	ROUND(avg(total), 2)
FROM
	Invoice
GROUP BY
	BillingCountry,
	BillingCity
ORDER BY
	BillingCountry;
	
	