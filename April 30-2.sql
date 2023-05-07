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


alter procedure ord_det
as
begin
	select SalesOrderID, OrderDate, DueDate, ShipDate, Status, SalesOrderNumber, PurchaseOrderNumber, AccountNumber, CustomerID, SalesPersonID, cast(TotalDue as int) as TotalDue
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


select try_cast(24.5 as int)


select floor(23.3)


select ceiling(23.3)


SELECT NULLIF('2017-08-25', '2017-08-23')


select len('abcdef')


SELECT SUBSTRING('Hello World', CHARINDEX('o', 'Hello World'), LEN('Hello World')) 


select substring('Welcome to the World', charindex('c', 'Welcome to the World'), len('Welcome to the World'))



--	Checks whether substring exists or not

if charindex('w', 'This is good') > 0
	print 'Substring Exists.'
else
	print 'Substring Doesnot Exists.'


SELECT REPLACE('Hello World', 'World', 'Universe') 


select replace('Welcome here', 'here', 'there')


select reverse(321)


select nullif(123, reverse(321))



--	Checks Palindrome


if 'abc' = reverse('cba')
	print 'Same'
else
	print 'Different'


create procedure palindrome @Char1 varchar(30), @Char2 varchar(30) 
as
begin
	if @Char1 = reverse(@Char2)
		print 'Same'
	else
		print 'Different'
end

execute palindrome 123, 321


select charindex('cod', 'Coding is fun')


select substring('The quick brown fox jumps over a lazy dog', charindex('brown fox', 'The quick brown fox jumps over a lazy dog'), len('The quick brown fox jumps over a lazy dog'))


select replace('Hello world, goodbye world', 'world', 'universe')


select substring('Welcome to the world', 4,11)


select format(cast('2020-01-23' as date), 'dd/MM/yyyy')


select concat('John', 'Doe')


select charindex('app', 'apple')


select current_timestamp


select str(10.3)


select cast('May 2, 2023' as date)


select abs(-15)


select cast('FALSE' as bit)


select sqrt(25)


select round(3.1243253, 2)


select cast('2023-05-02 15:30:00' as datetime)


select ascii('A')


select 'Hello' + ' ' + 'World'


select concat_ws(' ', 'Hello', 'World')


select len('The quick brown fox jumps over a lazy dog')


select format(cast('05/02/2023' as date), 'yyyy-MMMM-dddd')


select min(n)  from (values (10), (20), (30)) as numbers(n)


select max(n)  from (values (10), (20), (30)) as numbers(n)


select avg(n) from (values (1), (2), (3), (4), (5)) as number(n)


select cast(25.33 as int)


select CONCAT_WS('-', '2023', '05', '02')


select '2023' + '-' + '05' + '-' + '23'


select square(7)


select power(2, 3)


select ceiling(7.8)


select max(UnitPrice) as MaximumPrice from Sales.SalesOrderDetail
select min(UnitPrice) as MinimumPrice from Sales.SalesOrderDetail
select avg(UnitPrice) as AveragePrice from Sales.SalesOrderDetail
select sum(UnitPrice) as TotalPrice from Sales.SalesOrderDetail


declare @d date = '2023-05-02'
select format(@d, 'd', 'en-US')		--	US English Result
select format(@d, 'd', 'no')		--	Norwegian Result


select current_timestamp


select getdate()


select concat(FirstName, LastName) from Person.Person
