/*
Created by: Shae Chang
Create Date: 05/30/2023
Description: JOINS
*/

/*
List all of the customers along with their invoices records
*/

-- the initial solution

SELECT
	*
FROM
	Invoice
INNER JOIN
	Customer
ON
	-- the link field between the two tables
	Invoice.CustomerId = Customer.CustomerId
order by Customer.CustomerId;

-- simplify JOINS by aliase

SELECT
	-- only to introduce relevant fields
	c.LastName,
	c.FirstName,
	i.InvoiceId,
	i.CustomerId,
	i.InvoiceDate,
	i.total
FROM
	-- aliase the table
	Invoice AS i
INNER JOIN
	Customer AS c
ON
	i.CustomerId = c.CustomerId
order by c.CustomerId;

/*
Different types of JOINS
1. INNER JOIN
	only return overlapping records. unmatching data is ignored.
2. LEFT OUTER JOIN
	combines all records in the left table, 
	along with matching records in the right table.
	will introduce 'null' data
3. RIGHT OUTER JOIN
	return the entire right table, 
	with the overlapping records from the left table
4. JOIN many tables
	with Entity Relationship Diagrams
*/

/*
What employees are responsible for the 10 highest individual sales?
*/

SELECT
	e.FirstName,
	e.LastName,
	e.EmployeeId,
	c.FirstName,
	c.LastName,
	c.SupportRepId,
	i.CustomerId,
	i.total
FROM
	Invoice AS i
INNER JOIN
	Customer AS c
ON
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee AS e
ON
	c.SupportRepId = e.EmployeeId
ORDER BY
	i.total DESC
LIMIT 10;








