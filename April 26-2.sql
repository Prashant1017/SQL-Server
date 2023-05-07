select * from HumanResources.Department

select BusinessEntityID, NationalIDNumber, JobTitle, BirthDate, MaritalStatus, Gender, HireDate from HumanResources.Employee

select * from Person.Person

select FirstName, MiddleName, LastName from Person.Person where FirstName like '_s%c'

select FirstName, MiddleName, LastName from Person.Person where MiddleName = 'A'

select FirstName, MiddleName, LastName from Person.Person where FirstName like 'c%' and LastName like '%s'

select FirstName from Person.Person where FirstName like '___'

select FirstName, MiddleName, LastName from Person.Person where FirstName like '[d-g]%' order by FirstName

select FirstName, MiddleName, LastName from Person.Person where MiddleName is not Null

select FirstName, MiddleName, LastName from Person.Person order by FirstName

select * from Production.ProductListPriceHistory where ListPrice between 1000 and 3000

select * from Sales.CurrencyRate where ToCurrencyCode = 'EUR'

select * from Person.Address 

select * from Person.CountryRegion

select * from Person.Password

select * from Person.EmailAddress

select FirstName, MiddleName, LastName, EmailAddress, PasswordHash from Person.EmailAddress 
inner join Person.Password on Person.EmailAddress.BusinessEntityID = Person.Password.BusinessEntityID
inner join Person.Person on Person.EmailAddress.BusinessEntityID = Person.Person.BusinessEntityID
where FirstName like 'v%' and MiddleName is not null order by FirstName  

select * from Person.PersonPhone

select * from Person.PhoneNumberType

select * from Person.PersonPhone where PhoneNumberTypeID = 2

update Person.PersonPhone
set PhoneNumberTypeID = 2 where BusinessEntityID = 1715

select * from Production.Document

select * from Production.ProductDocument

select * from Production.ProductListPriceHistory

select sum(ListPrice) as total from Production.ProductListPriceHistory

select avg(ListPrice) from Production.ProductListPriceHistory

select count(ProductID) from Production.ProductListPriceHistory

select min(ListPrice) as minimum from Production.ProductListPriceHistory

select max(ListPrice) as maximum from Production.ProductListPriceHistory

select * from Production.Culture

select * from Production.ProductModelProductDescriptionCulture where CultureID = 'fr' or CultureID = 'ar' order by ProductDescriptionID

select * from Production.ProductModelProductDescriptionCulture

select * from HumanResources.Department

select * from HumanResources.EmployeeDepartmentHistory

select * from HumanResources.Shift

select * from HumanResources.EmployeeDepartmentHistory where DepartmentID = 7 and ShiftID = 1 or DepartmentID = 8 and ShiftID = 1

select * from Sales.SalesOrderHeader

select SalesOrderID, SalesOrderNumber, PurchaseOrderNumber, AccountNumber, CustomerID, OrderDate, DueDate from Sales.SalesOrderHeader where ShipDate between '2011-06-17' and '2011-06-25'

select SalesOrderNumber, PurchaseOrderNumber, AccountNumber, CustomerID, OrderDate, DueDate, ProductID, UnitPrice, OrderQty, LineTotal from Sales.SalesOrderHeader 
inner join Sales.SalesOrderDetail on Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID
where ShipDate between '2011-06-17' and '2011-06-25'

create procedure Sales
as begin
	select SalesOrderNumber, PurchaseOrderNumber, AccountNumber, CustomerID, OrderDate, DueDate, ProductID, UnitPrice, OrderQty, LineTotal from Sales.SalesOrderHeader 
	inner join Sales.SalesOrderDetail on Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID
	where ShipDate between '2011-06-17' and '2011-06-25'
end

execute Sales 

select sum(LineTotal) as TotalPrice from Sales.SalesOrderHeader 
inner join Sales.SalesOrderDetail on Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID
where ShipDate between '2011-06-17' and '2011-06-25'

select avg(LineTotal) as AveragePrice from Sales.SalesOrderDetail

select * from Sales.SalesOrderDetail

select sum(UnitPrice) as Total from Sales.SalesOrderDetail

select avg(OrderQty) as TotalQty from Sales.SalesOrderDetail

select sum(OrderQty) as TotalQty from Sales.SalesOrderDetail

select * from Sales.SalesOrderHeader

select * from Sales.SalesOrderHeader where OrderDate = '2014-05-17'

select max(TotalDue) from Sales.SalesOrderHeader

select min(TotalDue) from Sales.SalesOrderHeader
