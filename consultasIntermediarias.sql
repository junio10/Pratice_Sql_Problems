use Northwind

--20 Categories, and the total products in each category
SELECT C.CategoryName,Count(P.CategoryID) AS CountPerCategorie from Products P JOIN Categories C 
ON(P.CategoryID = C.CategoryID)
GROUP BY P.CategoryID, C.CategoryName
ORDER BY Count(P.CategoryID) DESC

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



