/*
Created by: Shae Chang
Create Date: 05/31/2023
Description: Stored queries - Views
*/

/* 
Create views
*/

CREATE VIEW
	V_AvgTotal AS
	SELECT
		round(avg(total), 2) AS [Average Total]
	FROM
		Invoice;
	-- one could see the created view from both 
	-- the Database Structure Pane and Browse Data Pane
	
/*
To edit a view,
one must drop it first.
Choose modify a view from the Database Structure pane,
then the automatic generated code chunk is:
*/

DROP VIEW "main"."V_AvgTotal";
CREATE VIEW V_AvgTotal AS
SELECT
	avg(total) AS [Average Total]
FROM
	Invoice;

/*
Join Views
Which song has never been ordered?
*/

-- First, create a view for a rather complax query

CREATE VIEW
	V_Tracks_InvoiceLine AS
	SELECT
		il.InvoiceId,
		il.UnitPrice,
		il.Quantity,
		t.Name,
		t.Composer,
		t.Milliseconds
	FROM
		InvoiceLine il
		-- 'AS' here seems to be omitted
	INNER JOIN
		Track t
	ON
		il.TrackId = t.TrackId;

/*
Delete a view by DROP
*/

DROP VIEW
	V_AvgTotal;
	
	
	
	