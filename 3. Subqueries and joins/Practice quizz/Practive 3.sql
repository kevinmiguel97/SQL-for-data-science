/*
All of the questions in this quiz pull from the open source Chinook Database. 
Please refer to the ER Diagram below and familiarize yourself with the table and
column names to write accurate queries and get the appropriate
answers.
*/

-- Q1 How many albums does the artist Led Zeppelin have?

SELECT Artists.Name, COUNT(*) AS NumberAlbums
FROM Albums JOIN Artists
    ON Albums.ArtistId = Artists.ArtistId
GROUP BY Artists.Name
HAVING Artists.Name = 'Led Zeppelin'


-- Q2 Create a list of album titles and the unit prices for the artist "Audioslave".

-- Tracks Table as most outer Table
SELECT Tr.Name AS TrackName,
Titles.ArtistName AS ArtistName,
Titles.AlbumTitle AS AlbumTitle,
Tr.UnitPrice AS Pice
FROM Tracks AS Tr 
JOIN
-- Join Table containing Album Titles of Audioslave
(   SELECT Al.Title AS AlbumTitle,
    Ar.Name AS ArtistName
    FROM Albums AS Al JOIN
    (   -- Retrieve ArtistID and Artist name from Artists Table = 8
        SELECT ArtistID, Name
        FROM Artists
        WHERE Name = 'Audioslave'
    ) AS Ar
        ON Al.ArtistID = Ar.ArtistID
) AS Titles

-- Q3 Find the first and last name of any customer who
-- does not have an invoice. Are there any customers returned from the query?  

SELECT CustomerId
FROM Customers
WHERE CustomerId NOT IN
(   
    SELECT DISTINCT(CustomerId)
    FROM invoices
)

-- Q4 Find the total price for each album.
SELECT AlbumId, SUM(UnitPrice)
FROM Tracks
GROUP BY AlbumId
HAVING AlbumId IN
(
    SELECT AlbumId
    FROM Albums
    WHERE Title = 'Big Ones'
    
)