/*
Created by: Shae Chang
Create Date: 05/31/2023
Description: Nesting Queries
*/

/*
Gather data about all invoices that are less than their average?
Subqueries
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	total <
		-- here comes the inner query
		(SELECT avg(total) FROM Invoice)
ORDER BY
	total DESC;

/*
How is each individual city performing against the global average sales?
Subqueries in the SELECT;
Aggeragate subqueries
*/

SELECT
	BillingCity,
	-- this first average is grouped by the following GROUP BY clause
	ROUND(avg(total), 2) AS [City Average],
	ROUND(
		-- introduce the subquery
		(SELECT avg(total) FROM Invoice), 2)
		AS [Global Average]
FROM
	Invoice
GROUP BY
	BillingCity
ORDER BY
	BillingCity;

/*
Select invoices whose invoice dates are later than a specific invoice.
Subqueries without Aggeragate functions
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceDate > 
	-- build an outer query in WHERE clause
	(SELECT
		InvoiceDate
	FROM
		Invoice
	WHERE
		InvoiceId = 251);

/*
Select invoices whose invoice dates are on the particular days.
Returning multiple values from a subquery 
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceDate IN 
	-- use IN clause to select multiple invoices
	(SELECT
		InvoiceDate
	FROM
		Invoice
	WHERE
		-- use IN clause to select multiple invoices
		InvoiceId IN (251, 252, 254));

/*
Which tracks are not selliing?
Subqueries and DISTINCT
'DISTINCT' filter the redundant values to unique ones
*/

SELECT
	TrackId,
	Composer,
	Name
FROM
	Track
WHERE
	TrackId NOT IN
	-- the opposite of IN is NOT IN
	(SELECT
		DISTINCT
		TrackId
	FROM
		InvoiceLine
	ORDER BY
		TrackId)
	
	
	
	
	
	
	
	