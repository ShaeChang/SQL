/*
Created by: Shae Chang
Create Date: 05/31/2023
Description: Project Challenges
Why is there a financial discrepancy between 2011 and 2012?
*/

/*
Challeng 01
1. How many transactions took place between the years 2011 and 2012?
*/

CREATE VIEW
	V_1_1 AS
	SELECT
		count(*), 
		strftime('%Y', InvoiceDate) AS InvoiceYear
	FROM
		Invoice
	WHERE
		InvoiceYear >= '2011' AND
			InvoiceYear <= '2012';
	
/*
Challeng 01
2. How much money did WSDA Music make during the same period?
*/

CREATE VIEW
	V_1_2 AS
	SELECT
		SUM(total) AS YearIncome
	FROM
		Invoice
	WHERE
		InvoiceDate >= '2011-01-01' AND
			InvoiceDate <= '2012-12-31';

/*
Challeng 02
1. Get a list of customers who made purchases between 2011 and 2012.
*/

CREATE VIEW
	V_2_1 AS
	SELECT
		CustomerId,
		FirstName,
		LastName
	FROM
		Customer
	WHERE
		CustomerId IN
		(SELECT
			DISTINCT
			CustomerId
		FROM
			Invoice
		WHERE
			InvoiceDate >= '2011-01-01' AND
					InvoiceDate <= '2012-12-31');

-- Another way:

SELECT
	c.FirstName,
	c.LastName,
	i.total
FROM
	Invoice i
INNER JOIN
	Customer c
ON
	i.CustomerId = c.CustomerId
WHERE
	InvoiceDate >= '2011-01-01' AND
	InvoiceDate <= '2012-12-31'
ORDER BY
	i.total DESC;

-- there is a way to use inner join when need to filter some fields after joining
	
	
/*
Challeng 02
2. Get a list of customers, sales reps, and total transaction amounts for 
each customer between 2011 and 2012.
*/

CREATE VIEW
	V_2_2 AS
	SELECT
		i.CustomerId,
		SUM(i.total) AS Amount,
		c.FirstName || ' ' || c.LastName AS [Customer Name],
		c.SupportRepId,
		e.FirstName || ' ' || e.LastName AS [Sales Rep Name]
	FROM
		Invoice AS i
	LEFT JOIN
		Customer AS c
	ON
		i.CustomerId = c.CustomerId
	LEFT JOIN
		Employee AS e
	ON
		c.SupportRepId = e.EmployeeId
	WHERE
		i.InvoiceDate >= '2011-01-01' AND
			i.InvoiceDate <= '2012-12-31'
	GROUP BY
		i.CustomerId
	ORDER BY
		Amount DESC;

/*
Challeng 02
3. How many transactions are above the average transaction amount
during the same time period?
*/

CREATE VIEW
	V_2_3 AS
	SELECT
		count(InvoiceId) AS [Transaction Amount]
	FROM
		Invoice
	WHERE
		InvoiceDate >= '2011-01-01'
		AND InvoiceDate <= '2012-12-31'
		AND total >
		(SELECT avg(total) FROM Invoice
		WHERE
		InvoiceDate >= '2011-01-01'
		AND InvoiceDate <= '2012-12-31');

/*
Challeng 02
4. What is the average transaction amount for each year that 
WSDA Music has been in business?
*/

CREATE VIEW
	V_2_4 AS
	SELECT
		round(avg(total), 2) AS [Average Transaction],
		strftime('%Y', InvoiceDate) AS InvoiceYear
	FROM
		Invoice
	GROUP BY
		InvoiceYear;
		
/*
Challeng 03
1. Get a list of employees who exceeded the average transaction amount
from sales they generated during 2011 and 2012.
*/

CREATE VIEW
	V_3_1 AS
	SELECT
		SupportRepId,
		[Sales Rep Name]
	FROM
		V_2_2
	WHERE
		Amount > 
		(SELECT avg(Amount) FROM V_2_2)
	GROUP BY
		SupportRepId;

/*
Challeng 03
2. Create a Commission Payout column that displays each employee’s
commission based on 15% of the sales transaction amount.
*/

CREATE VIEW
	V_3_2 AS
	SELECT
		SupportRepId,
		[Sales Rep Name],
		SUM(Amount) AS TotalTransanction,
		round(SUM(Amount) * 0.15, 2) AS Commission
	FROM
		V_2_2
	GROUP BY
		SupportRepId
	ORDER BY
		[Sales Rep Name];

/*
Challeng 03
3. Which employee made the highest commission?
Jane Peacock, with SupportRepId 3.
*/

/*
Challeng 03
4. List the customers that the employee identified in the last question.
*/

CREATE VIEW
	V_3_4 AS
	SELECT
		c.CustomerId,
		c.FirstName || ' ' || c.LastName AS [Customer Name]
	FROM
		V_3_1 AS e
	LEFT JOIN
		Customer AS c
	ON
		e.SupportRepId = c.SupportRepId;

/*
Challeng 03
5. Which customer made the highest purchase?
*/

SELECT
	v.CustomerId,
	SUM(i.total) AS Purchase,
	v.[Customer Name]
FROM
	V_3_4 AS v
LEFT JOIN
	Invoice AS i
ON
	v.CustomerId = i.CustomerId
WHERE
	strftime('%Y', i.InvoiceDate) IN ('2011', '2012')
GROUP BY
	v.CustomerId
ORDER BY
	Purchase DESC;

/*
Challeng 03
6. Look at this customer record—do you see anything suspicious?
There are no valid billing address, city, state, country, nor postal code.
*/

SELECT
	*
FROM
	Invoice
WHERE
	CustomerId = 60;

/*
Challeng 03
7. Who do you conclude is our primary person of interest?
The corresponding employee, Jane Peacock, of this seems non-existing customer.
*/