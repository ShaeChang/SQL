/*
Created by: Shae Chang
Create Date: 05/29/2023
Description: This query displays all customers first, last names and email addresses
*/

SELECT 
	FirstName AS [Costomer First Name],
	LastName AS 'Customer Last Name', 
		-- two different ways to rename columns
	Email AS EMAIL 
		-- since it is a single word, no need for [] or ''
FROM 
	Customer
ORDER BY 
	-- sort query result
	FirstName ASC,
	LastName DESC
		-- sort in a descending order
LIMIT 10 -- only include the first 10 rows


	
	
	