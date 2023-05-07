select concat(FirstName, LastName) from Person.Person


select len(FirstName) from Person.Person


select cast(UnitPrice as int) from Sales.SalesOrderDetail


select datediff(day,OrderDate, ShipDate) from Sales.SalesOrderHeader


select datediff(weekday, '2001-02-23', '2023-05-02')


select isnumeric(CurrencyRateID) from Sales.SalesOrderHeader


select cast(TotalDue as int) from Sales.SalesOrderHeader


select cast(max(TotalDue) as int) as MaximumAmount from Sales.SalesOrderHeader
select cast(min(TotalDue) as int) as MinimumAmount from Sales.SalesOrderHeader
select cast(avg(TotalDue) as int) as AverageAmount from Sales.SalesOrderHeader
select cast(sum(TotalDue) as int) as TotalAmount from Sales.SalesOrderHeader



select abs(datediff(year, '2023-05-02', BirthDate)) as AgeOfEmployee from HumanResources.Employee


select datename(day, OrderDate) as Orders from Sales.SalesOrderHeader


select abs(datediff(year, '2023-05-02', BirthDate)) as AgeOfEmployee from HumanResources.Employee


select format(cast(BirthDate as date), 'dd-MMMM-yyyy') from HumanResources.Employee


select datename(month, BirthDate) as BirthMonth from HumanResources.Employee


select datename(month, '03-05-2002 09:45:50:18')


select dateadd(month, -12, '2023-05-02 15:42:50')


select current_timestamp


create procedure AmountDetails
as
begin
	select cast(max(TotalDue) as int) as MaximumAmount from Sales.SalesOrderHeader
	select cast(min(TotalDue) as int) as MinimumAmount from Sales.SalesOrderHeader
	select cast(avg(TotalDue) as int) as AverageAmount from Sales.SalesOrderHeader
	select cast(sum(TotalDue) as int) as TotalAmount from Sales.SalesOrderHeader
end

execute AmountDetails


select * from Sales.SalesOrderDetail order by OrderQty desc

select cast(sum(LineTotal)as int) from Sales.SalesOrderDetail


select datediff(year, HireDate, '2023-05-23') from HumanResources.Employee


select substring('HumanResource.Employee',15, LEN('HumanResources.Employee')) as NewString


select len('HumanResources.Employee')


select * from HumanResources.Employee


update HumanResources.Employee
set MaritalStatus = 'M'
where BusinessEntityID = 1



select datename(month, ModifiedDate) from HumanResources.Employee


select iif(123<234, 'yes', 'no')


select isnumeric(NationalIDNumber) from HumanResources.Employee


select isnumeric('2052')


select sysdatetime()


select current_timestamp


select isdate(9999-999-999)


select isdate('11-23-9999')


select count(*) from HumanResources.Employee
where datediff(year, HireDate, getdate())>15


select count(*) as SoldProducts from Sales.SalesOrderHeader where OrderDate = '2011-07-01'


select count(*) from Sales.SalesOrderHeader where TerritoryID = 5


select left(FirstName, 4) from Person.Person

select right(LastName, 4) from Person.Person


select current_timestamp


select concat_ws (' ', FirstName, MiddleName, LastName) as Name from Person.Person order by FirstName 


select * from Person.Person 
