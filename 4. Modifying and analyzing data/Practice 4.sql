-- Q1. Pull a list of customer ids with the customer’s full name, 
--and address, along with combining their city and country together. 
-- Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA). 

SELECT 
    CustomerId,
    FirstName || ' ' || LastName AS FullName,
    Address,
    City || ' ' || Country AS CityCountry
FROM Customers

-- Q2 Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of 
--the employee’s last name. Make the new field lower case and pull each individual step to show your work.

SELECT
    LOWER(SUBSTR(FirstName, 1, 2) || SUBSTR(LastName, 1, 2)) AS NewId
FROM 
Employees

-- Q3 Show a list of employees who have worked for the company for 15 or more years using the current date function.
-- Sort by lastname ascending.

SELECT
    FirstName, 
    LastName,
    EmployeeId, 
    Hiredate, 
    (DATE('now') - Hiredate) AS YrsWorking
FROM Employees
WHERE YrsWorking > 15
ORDER BY LastName ASC

-- Q4. Profiling the Customers table, answer the following question. Find the number of null values

SELECT 
    COUNT(*)-COUNT(Fax) AS Fax, 
    COUNT(*)-COUNT(Company) AS Company,
    COUNT(*)-COUNT(Phone) AS Phone,
    COUNT(*)-COUNT(Address) AS Address,
    COUNT(*)-COUNT(PostalCode) AS PostalCode,
    COUNT(*)-COUNT(FirstName) AS FirstName
FROM Customers; 

-- Q5. Find the cities with the most customers and rank in descending order.

SELECT 
    City,
    COUNT(CustomerId) AS Customers
FROM Customers
GROUP BY City
ORDER BY Customers DESC

