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
