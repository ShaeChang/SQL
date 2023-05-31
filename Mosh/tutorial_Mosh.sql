SELECT 
	first_name, 
    last_name, 
    points, 
    points + 10 AS 'discount factor'
FROM customers;

SElECT DISTINCT state
	-- remove the duplicates
FROM customers;

SELECT
	name,
    unit_price AS 'unit price',
    unit_price * 1.1 AS 'new price'
FROM products;

-- WHERE is used as a filter

SELECT *
FROM customers
WHERE points > 3000;

SELECT *
FROM customers
WHERE state != 'VA';

SELECT *
FROM customers
	-- filter the date like this
WHERE birth_date > '1990-01-01';

-- combine multiple operators in WHERE filter

SELECT *
FROM customers
	-- can replace 'AND' with 'OR'
WHERE birth_date > '1980-01-01' 
	OR points > 1000 
	AND state = 'VA';














