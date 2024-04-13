use Northwind

--20 Categories, and the total products in each category
SELECT c.CategoryName, COUNT(p.CategoryID) as Total FROM Products p 
join Categories c
on(c.CategoryID = p.CategoryID)
GROUP BY c.CategoryName, p.CategoryID
--HAVING COUNT(P.CategoryID) > 10 FILTRO DO GROUP BY
ORDER BY COUNT(P.CategoryID) DESC --ORDERNAR, SEMPRE VAI SER O ULTIMO

--21 In the Customers table, show the total number of
--customers per Country and City 
SELECT C.Country,C.City,count(C.CustomerID) AS TotalCustomers from Customers C
GROUP BY C.Country, C.City
ORDER BY COUNT(C.CustomerID) DESC

--22 Products that need reordering
SELECT P.ProductID, P.ProductName,P.UnitsInStock, P.ReorderLevel FROM Products P
WHERE P.UnitsInStock < P.ReorderLevel
ORDER BY P.ProductID ASC

--23 Products that need reordering,
--continued
SELECT P.ProductID ,P.ProductName, P.UnitsInStock, P.UnitsOnOrder, P.ReorderLevel, P.Discontinued FROM Products P
WHERE P.UnitsInStock + P.UnitsOnOrder <= P.ReorderLevel AND P.Discontinued = 0
ORDER BY P.ProductID ASC

--24 Customer list by region
SELECT C.CustomerID, C.CompanyName, C.Region
FROM Customers C
Order By
      Case
		when C.Region is null then 1
		else 0
      End
	,Region
	,CustomerID

--25 High freight charges
SELECT O.ShipCountry, AVG(O.Freight) AS AVGFREIGHT FROM Orders O
GROUP BY O.ShipCountry
ORDER BY AVG(O.Freight) DESC
OFFSET 0 ROWS FETCH FIRST 3 ROWS ONLY

--26 High Frteight charges in 2015
SELECT TOP 3 O.ShipCountry, AVG(O.Freight) AS AVGFREIGHT FROM Orders O
WHERE YEAR(O.OrderDate) = 2015
GROUP BY O.ShipCountry
ORDER BY AVG(O.Freight) DESC
--OFFSET 0 ROWS FETCH FIRST 3 ROWS ONLY

--27 High freight charges with between
Select Top 3
ShipCountry
,AverageFreight = avg(freight)
From Orders
Where
OrderDate between '12/31/2014' and '1/1/2016'
Group By ShipCountry
Order By AVG(freight) desc;

--28 High freight charges - last year
SELECT TOP 3 O.ShipCountry, AVG(O.Freight) FROM Orders O
WHERE DATEDIFF(MM, O.OrderDate, (SELECT MAX(ORDERDATE)FROM ORDERS)) <= 12GROUP BY O.ShipCountryORDER BY AVG(O.Freight) desc;	
--29 Iventory List
SELECT E.EmployeeID, E.LastName, O.OrderID, P.ProductName, OD.Quantity FROM Employees E
JOIN Orders O ON(O.EmployeeID = E.EmployeeID)
JOIN OrderDetails OD ON(O.OrderID = OD.OrderID)
JOIN Products P ON(OD.ProductID = P.ProductID)
ORDER BY O.OrderID, P.ProductID

--30 Customers with no orders
SELECT C.CustomerID , O.OrderID FROM Customers C
LEFT JOIN ORDERS O ON(C.CustomerID = O.CustomerID)
WHERE O.OrderID IS NULL

--31 Customers with no orders for EmployeeID 4
SELECT Customers.CustomerID,Orders.CustomerID
FROM Customers LEFT JOIN Orders
ON
    Orders.CustomerID = Customers.CustomerID
    AND Orders.EmployeeID = 4
WHERE
    Orders.CustomerID IS NULL



--
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';





