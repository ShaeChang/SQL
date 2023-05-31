/* 
How many customers purchased two songs at $0.99 each?
*/

/*
Created by: Shae Chang
Create Date: 05/30/2023
Description: Customers who purchased two songs at $0.99 each
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	-- filter records that satisfied some requirements
	total = 1.98
ORDER BY
	InvoiceDate;
	
/*
How many invoices are between certain amounts of money
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	total 
		BETWEEN 1.98 AND 5.00
ORDER BY
	InvoiceDate;

/*
How many invoices are exactly $1.98 or $3.96
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	total 
		IN (1.98, 3.96)
ORDER BY
	InvoiceDate;
	
-- TEXT

/*
How many invoices were billed to Brussels?
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity = 'Brussels' -- text data must be surrounded by quotes
ORDER BY
	InvoiceDate;

/*
How many invoices were billed to Brussels, Orlando, or Paris?
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity 
		IN ('Brussels', 'Orlando', 'Paris') 
ORDER BY
	InvoiceDate;
	
-- Search for partial or incorrect values: "LIKE"

/*
How many invoices were billed in cities that start with B?
*/

-- % I don't care

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity 
		LIKE 'B%'
ORDER BY
	InvoiceDate;

/*
How many invoices were billed in cities that have a B anywhere in it's name?
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity 
		LIKE '%B%' -- this is case-insensitive, case does not matter
ORDER BY
	InvoiceDate;

-- Date data

/*
How many invoices were billed on 2010-05-22 00:00:00?
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	InvoiceDate = '2010-05-22 00:00:00'
ORDER BY
	InvoiceDate;

-- a more concise solution using date function

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	DATE(InvoiceDate) = '2010-05-22'
		-- no longer include the time part
ORDER BY
	InvoiceDate;
	
/*
Get all invoices were billed after 2010-05-22 and have a total of less than $3.00?
*/

-- filter multiple fields

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	DATE(InvoiceDate) > '2010-05-22' 
		AND total < 3.00
ORDER BY
	InvoiceDate;

/*
Get all invoices who's billing city is starts with P or starts with D?
*/

-- logical operator OR

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity LIKE 'P%'
		OR BillingCity LIKE 'D%'
ORDER BY
	InvoiceDate;

/*
Get all invoices that are greater than 1.98 from any cities whose name start with P or D?
*/

-- logical operator OR, brackets

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	total > 1.98 
		AND (BillingCity LIKE 'P%'
			OR BillingCity LIKE 'D%')
ORDER BY
	InvoiceDate;

-- IF THEN logics with CASE statement

/*
Sales Goal:
They want as many customers as possible to spend between $7.00 and $15.00

Set Sales Categories:
Baseline purchase, low purchase, target purchase, top performer
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total,
	CASE
	WHEN total < 2.00 THEN 'Baseline Purchase'
	WHEN total BETWEEN 2.00 AND 6.99 THEN 'Low Purchase'
	WHEN total BETWEEN 7.00 AND 15.00 THEN 'Target Purchase'
	ELSE 'Top Performer'
	END AS PurchaseType -- end with a label, to create a brand new column
FROM
	Invoice
WHERE
	-- filter using our calculated new field
	PurchaseType = 'Top Performer'
ORDER BY
	BillingCity;

-- Chapter Quiz

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	BillingCity = 'Brussels';






