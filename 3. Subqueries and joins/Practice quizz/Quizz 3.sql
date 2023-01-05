/*
All of the questions in this quiz pull from the open source Chinook Database. 
Please refer to the ER Diagram below and familiarize yourself with the table and
column names to write accurate queries and get the appropriate
answers.
*/

-- 1. Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name, AlbumId
FROM Tracks
WHERE AlbumId IN 
(   SELECT AlbumId
    FROM Albums
    WHERE Title = 'Californication'
)
LIMIT 8

-- Q2. Find the total number of invoices for each customer along with the customer's full name, city and email

SELECT 
    COUNT(Invoices.InvoiceId) AS Invoices,
    Customers.CustomerId,
    Customers.FirstName AS FirstName,
    Customers.LastName AS LastName,
    Customers.City AS City,
    Customers.Email AS Email
FROM Invoices LEFT JOIN Customers
ON Invoices.CustomerId = Customers.CustomerId
GROUP BY Customers.CustomerI

-- Q3. Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT 
    Tr.Name AS TrackName,
    Al.Title AS Album,
    Al.ArtistId, 
    Tr.TrackId
FROM Tracks AS Tr JOIN Albums AS Al 
ON Tr.AlbumId = Al.AlbumId

-- Q4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT 
      M.LastName AS Manager, 
      E.LastName AS Employee
FROM Employees E INNER JOIN Employees M 
ON E.ReportsTo = M.EmployeeID;

-- Q5. Find the name and ID of the artists who do not have albums. 

SELECT 
    Name,
    ArtistId
FROM Artists
WHERE ArtistId NOT IN
(   SELECT DISTINCT(ArtistId)
    FROM Albums
)

-- Q6. Use a UNION to create a list of all the employee's and customer's first names and last names 
-- ordered by the last name in descending order.

SELECT 
    FirstName,
    LastName
FROM Employees
UNION
SELECT 
    FirstName,
    LastName
FROM Customers
ORDER BY LastName DESC

-- Q7. See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT 
    Customers.FirstName,
    Customers.LastName,
    Customers.City AS CustomerCity,
    Invoices.BillingCity AS BillingCity
FROM Customers LEFT JOIN Invoices
ON Customers.CustomerId = Invoices.CustomerId
WHERE CustomerCity <> BillingCity