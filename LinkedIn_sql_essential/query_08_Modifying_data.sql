/*
Created by: Shae Chang
Create Date: 05/31/2023
Description: Adding, Modifying and Deleting data
*/

/*
Add a new artist to Artist database
Inserting data
*/

INSERT INTO
	Artist(Name)
VALUES ('Bob Marley');
-- the other field, ArtistId, is automatically generated

/*
Update data with WHERE clause
to specify which row to update
*/

UPDATE
	Artist
SET 
	Name = 'Damien Marley'
WHERE
	ArtistId = 277;

/*
Delete Statement with WHERE clause
*/

DELETE FROM
	Artist
WHERE
	ArtistId = 277;