use Northwind --Banco dispobinilizado pela microsoft 


SELECT name FROM sys.tables;
--Query in the book "57"

-- 1 Which shippers do we have? 
select * from Shippers

-- 2 Certain fields from Categories. fields Name and Description
select c.CategoryName, c.Description from Categories as c

-- 3 We’d like to see just the FirstName, LastName, and
--HireDate of all the employees with the Title of Sales
--Representative

select E.FirstName, E.LastName, E.HireDate from Employees E where E.Title = 'Sales Representative'

--4 Sales Representatives in the UnitedStates
select E.FirstName, E.LastName, E.HireDate from Employees E where E.Title = 'Sales Representative' and  E.Country = 'USA'

--5 Show all the orders placed by a specific employee.
select O.OrderID, O.OrderDate from Orders O where O.EmployeeID = 5 

--6 In the Suppliers table, show the SupplierID,
--ContactName, and ContactTitle for those Suppliers
--whose ContactTitle is not Marketing Manager
select S.SupplierID, S.ContactName, S.ContactTitle from Suppliers S WHERE S.ContactTitle NOT IN ( 'Marketing Manager')


--7 In the products table, we’d like to see the ProductID
--and ProductName for those products where the
--ProductName includes the string “queso”.
select * from Products P WHERE P.ProductName LIKE 'Queso%' --%indica qualquer coisa adiante,
                                                           -- EX: PODERIA SER TODOS OS PRODUTOS QUE TERMINA COM O
														   -- select * from Products P WHERE P.ProductName LIKE '%o'
														   
--8 Looking at the Orders table, there’s a field called
--ShipCountry. Write a query that shows the OrderID,
--CustomerID, and ShipCountry for the orders where
--the ShipCountry is either France or Belgium
select O.OrderID,O.CustomerID, O.ShipCountry from Orders O 
WHERE O.ShipCountry IN ('Belgium','France')

--9 Orders shipping to any country in Latin America
select * from Orders O WHERE ShipCountry IN ('Brazil', 'Venezuela', 'Argentina', 'Mexico')--em vez de usar vários OR, É mais simples utilizar in
                                                                                          --Mesmo resultado ex: 
																						  --select * from Orders O 
																						  --WHERE ShipCountry ='Brazil' or ShipCountry = 'Venezuela' 
																						  --or  ShipCountry = 'Argentina'or ShipCountry = 'Mexico'
--10 Employees, in order of age
SELECT E.FirstName, E.LastName, E.Title, E.BirthDate FROM Employees E Order by E.BirthDate ASC