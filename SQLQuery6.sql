SELECT 
    p.FirstName,
    p.LastName,
    ea.EmailAddress,
    pp.PhoneNumber,
    pnt.Name AS PhoneNumberType
FROM Person.Person p
JOIN Person.EmailAddress ea ON p.BusinessEntityID = ea.BusinessEntityID
JOIN Person.PersonPhone pp ON p.BusinessEntityID = pp.BusinessEntityID
JOIN Person.PhoneNumberType pnt ON pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID;


SELECT *
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-05-01' AND '2011-05-31';

SELECT sod.*
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE soh.OrderDate BETWEEN '2011-05-01' AND '2011-05-31';


SELECT 
    SUM(TotalDue) AS TotalSalesMay2011
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-05-01' AND '2011-05-31';


SELECT 
    MONTH(OrderDate) AS Month,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY MONTH(OrderDate)
ORDER BY TotalSales;


SELECT 
    c.CustomerID,
    p.FirstName,
    p.LastName,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.Customer c
JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
WHERE p.FirstName = 'Gustavo' AND p.LastName = 'Achong'
GROUP BY c.CustomerID, p.FirstName, p.LastName;

