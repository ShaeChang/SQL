/*
Created by: Shae Chang
Create Date: 05/30/2023
Description: SQL Functions
*/

/*
Create a mailing list of US customers
String functions
*/

SELECT
	FirstName,
	LastName,
	Address, 
	-- connecting strings
	FirstName || ' ' || LastName || ' ' || Address || ',' || City || ' ' || State || ' ' || PostalCode AS [Mailing Address],
	-- counting the length of a string
	LENGTH(PostalCode),
	-- subsetting a string
	SUBSTR(PostalCode, 1, 5) AS [5 Digit PostalCode],
	-- Upper string function
	UPPER(FirstName) AS [First Name All Caps],
	-- Lower string function
	LOWER(LastName) AS [Last Name All Lower]
FROM
	Customer
WHERE
	Country = 'USA';

/*
Calculate the ages of all employees
Date functions
*/

SELECT
	LastName,
	FirstName,
	BirthDate,
	strftime('%Y-%m-%d', BirthDate) AS [Birthdate No Timecode],
	-- modify the timestring
	strftime('%Y-%m-%d', 'now') - strftime('%Y-%m-%d', BirthDate) AS Age
	-- calculating the ages
FROM
	Employee;
	
/*
What are our all time global sales?
Aggregate Function
*/

SELECT
	SUM(total) AS [Total Sales],
	AVG(total) AS [Average Sales],
	MAX(total) AS [Maximum Sale],
	MIN(total) AS [Minimum Sale],
	COUNT(*) AS [Sales Count]
	-- several aggregate functions
FROM
	Invoice;

/*
Nesting Functions
*/

SELECT
	SUM(total) AS [Total Sales],
	ROUND(AVG(total), 2) AS [Average Sales],
	-- round the average data to 2 decimal places
	MAX(total) AS [Maximum Sale],
	MIN(total) AS [Minimum Sale],
	COUNT(*) AS [Sales Count]
FROM
	Invoice;

