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

--11 Showing only the Date with a DateTime field
SELECT E.FirstName, E.LastName, E.Title, CONVERT(NVARCHAR, E.BirthDate, 23) as BirthDate FROM Employees E 
Order by E.BirthDate ASC --Para se converter, pode se utilizar o convert ou cast link da documentação:
                         --https://learn.microsoft.com/pt-br/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16
                                                      
--12 Employees full name
SELECT E.FirstName, E.LastName, CONCAT(E.FirstName + ' ',E.LastName) FROM Employees E --PARA CONCATENAR, SE USAR CONCAT e PODE SER FEITA APLICACOES DE REGEX
--OU PODE SER FEITO ASSIM TAMBEM, ACHO MAIS SIMPLES
SELECT E.FirstName, E.LastName ,E.FirstName + ' ' + E.LastName AS FullName FROM Employees E

--13 OrderDetails amount per line item
SELECT O.OrderID, O.ProductID, O.UnitPrice, O.Quantity, O.UnitPrice * O.Quantity AS TotalPrice FROM OrderDetails O 
ORDER BY O.OrderID, O.ProductID

--FUNCTION AGREGATION
--COUNT -> CONTA AS LINHAS DE UMA CONSULTA
--MIN -> PEGAR O VALOR MINIMO DE ALGUM ATRIBUTO DA TABELA
--MAX -> PEGAR O VALOR MAXIMO DE ALGUM ATRIBUTO DA TABELA
--SUM -> RETORNA A SOMA DE TODOS OS VALORES

--14 How many customers?
SELECT COUNT(C.CustomerID) AS TotalCustomers FROM Customers C --PARA CONTAR SE USAR O COUNT

--15 When was the first order ?
SELECT Min(O.OrderDate) AS FirstOrder FROM Orders O 

--16 Countries where there are customers
SELECT DISTINCT C.Country from Customers C  --TIRAR LINHA REPETIDAS DISTINCT
--OU
SELECT C.Country FROM Customers C GROUP BY C.Country --RETORNA UMA LINHA POR GRUPO, GROUP BY

--17 Contact titles for customers
SELECT C.ContactTitle, COUNT(C.ContactTitle) AS CountTitle  FROM CUSTOMERS C GROUP BY C.ContactTitle

--18 Products with associated supplier names(JOINS)
SELECT P.ProductID, P.ProductName, S.CompanyName FROM Products P JOIN Suppliers S
ON(S.SupplierID = P.SupplierID)

--19 Orders and the Shipper that was used(JOINS)
SELECT O.OrderID, O.OrderDate, S.CompanyName FROM ORDERS O JOIN Shippers S 
ON(S.ShipperID = O.ShipVia)
WHERE O.OrderID < 10300
ORDER BY O.OrderID ASC









