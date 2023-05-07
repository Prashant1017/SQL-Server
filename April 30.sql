alter procedure updatestatus(@orderid int)
as
begin
	update Sales.SalesOrderHeader
	set Status = Status + 1
	where SalesOrderID = @orderid
end


execute updatestatus 43663

select * from Sales.SalesOrderHeader


execute updatestatus 43700

select * from Sales.SalesOrderHeader where SalesOrderID = 43663


create procedure ord_det
as
begin
	select SalesOrderID, OrderDate, DueDate, ShipDate, Status, SalesOrderNumber, PurchaseOrderNumber, AccountNumber, CustomerID, SalesPersonID, TotalDue
	from Sales.SalesOrderHeader
end

execute ord_det

execute updatestatus 43660




--	Inbuilt Functions Of SQL Server	--


select concat(FirstName, MiddleName, LastName) as FullName from Person.Person



select * from Person.Person


select charindex('e', 'FirstName') as matchposition;


select replicate(FirstName, 2) from Person.Person


select reverse(LastName) from Person.Person


select * from Person.Person


select stuff('NULL', 2, 1, 'E') from Person.Person


select substring(FirstName, 1, 5) from Person.Person


select translate('Mi name is ABC', 'Mi', 'My')


select unicode(FirstName) as UnicodeNumber from Person.Person


select upper(FirstName) as Uppercase from Person.Person


select lower(FirstName) as Lowercase from Person.Person


select len(FirstName) as TotalLetters from Person.Person


select datalength(FirstName) as LetterData from Person.Person


select charindex('da', 'Sunday')


select ascii(FirstName) from Person.Person


select power(3,10)


select current_timestamp


select dateadd(month, 3, '2001-01-03')


select datediff(year, '2023-09-12', '2020-10-11')


select datefromparts(2001,03,23)


select datename(month, '2002-12-23')


select day('2004-12-23')


select getdate()


select getutcdate()


select isdate('2001-45-10')


select isdate('2001-10-12')


select month('2004-12-03')


select cast(23.56 as int)


select coalesce(NULL, NULL, 'dfvs', NULL, 'dsv')


select current_user


select iif('hello' = 'hello', 'yes', 'no')


select nullif('sdf', 'af')


select nullif(23, 23)


select session_user


select system_user


select user_name()


select user_name(5)


select * from Person.Person


select charindex('o', 'Zinob') as matchposition


select charindex('a', LastName) from Person.Person


select charindex('as', FirstName) from Person.Person


select charindex('pa', 'Nepal') as Position


select nullif(23, 23)


select nullif(23, 26)
