select * from Production.ProductCategory


--	Table Valued Function

create function detail_category()
returns table as
return(select * from Production.ProductCategory)

select * from detail_category()


--	Scalar Function


--	Generates Total Number Of Staffs In A Department

create function Emp_detail(@departid smallint)
returns int
as 
begin
	declare @count int = 0;

	select @count = count(BusinessEntityID) from HumanResources.EmployeeDepartmentHistory
	where DepartmentID = @departid

	return @count;
end

select dbo.Emp_detail(3)


--	Displays Staff Details Between Two Dates

alter function Staffdetail(@from date, @to date)
returns table
as
return
	select * from HumanResources.Employee
	where HireDate between @from and @to

select * from StaffDetail('2008-01-30', '2009-01-30')


--	Displays Sick Leave Of Staff 

alter function SickLeave(@busid int)
returns table 
as
return
	select SickLeaveHours, VacationHours from HumanResources.Employee
	where BusinessEntityID = @busid

select * from SickLeave(4)



--	Addition Function

create function Addition(@Num1 numeric(10), @Num2 numeric(10)) returns numeric(10)
begin
	declare @result numeric(10)
	
	set @result = @Num1 + @Num2
	return @result
end

print dbo.Addition(154, 23)



--	Calculator

alter function Calculator(@Num1 decimal(10,2), @Num2 decimal(10,2), @choice char(1)) returns varchar(50)
begin
	declare @result varchar(50)

	if @choice = '+'
		set @result = @Num1 + @Num2

	else if @choice = '-'
		set @result = @Num1 - @Num2

	else if @choice = '*'
		set @result = @Num1 * @Num2

	else if @choice = '/'
		set @result = @Num1 / @Num2

	else if @choice = '%'
		set @result = @Num1 % @Num2


	return ('The result of the operation is' + ' ' +@result) 
end

print dbo.Calculator(26, 5, '/')

print dbo.Calculator(232, 342, '+')

print dbo.Calculator(23, 19, '*')

print dbo.Calculator(42, 63, '-')

print dbo.Calculator(26, 4, '%')




--	Time Interval Between Two Dates

alter function Days(@Date1 date, @Date2 date) returns varchar(40)
begin
	declare @interval varchar(40)

	set @interval = datediff(day, @Date1, @Date2)
	return ('Time interval is' + ' ' +@interval)
end

print dbo.Days('2001-01-01', '2002-01-28')





--	Factorial

CREATE FUNCTION Factorial (@num int)
RETURNS bigint
AS
BEGIN
    DECLARE @factorial bigint = 1

    IF @num < 0
        SET @factorial = NULL
   
   ELSE IF @num = 0 OR @num = 1
        SET @factorial = 1
   
   ELSE
    BEGIN
        WHILE @num > 1
        BEGIN
            SET @factorial = @factorial * @num
            SET @num = @num - 1
        END
    END

    RETURN @factorial
END

print dbo.Factorial(10)


--	Provides Details Through OrderID Number

alter function Order_Details(@orderid int) returns table
as 
return
	select SalesOrderID, OrderDate, DueDate, ShipDate, SalesOrderNumber, PurchaseOrderNumber, CustomerID from
	Sales.SalesOrderHeader
	where SalesOrderID in (@orderid)

select * from Order_Details(43700)


/*
alter procedure Cont_Details(@name nvarchar(50))
as
begin
	select p.FirstName, c.PersonID, a.AddressLine1, a.City, a.PostalCode from Person.Person p
	inner join Person.BusinessEntityContact c on c.BusinessEntityID = p.BusinessEntityID
	inner join Person.BusinessEntityAddress y on y.BusinessEntityID = p.BusinessEntityID
	inner join Person.Address a on a.AddressID = y.AddressID
	where a.City in (@name)
end

execute Cont_Details 'Bothell'
*/


select * from Sales.SalesOrderHeader where TerritoryID = 5



--	Displays Square Root Of Given Number

create function sqrroot(@num decimal(10,2)) returns decimal(10,2)
begin
	declare @res decimal(10,2)

	set @res = sqrt(@num)
	return @res
end

print dbo.sqrroot(1000000)


--	Concatenate Different Data Types

create function Currency(@number int, @symbol varchar(5)) returns varchar(40)
begin
	declare @res varchar(40)

	set @res = concat(@symbol, @number)
	return @res
end

print dbo.Currency(370, '$')



--	Fibonacci Series	

ALTER FUNCTION dbo.Fibonacci (@NumTerms INT)
RETURNS @OutputTable TABLE (Term INT)
AS
BEGIN
    DECLARE @Term1 INT = 1
    DECLARE @Term2 INT = 1

    WHILE @NumTerms > 0
    BEGIN
        INSERT INTO @OutputTable (Term)
        VALUES (@Term1)

        DECLARE @NewTerm INT = @Term1 + @Term2
        SET @Term1 = @Term2
        SET @Term2 = @NewTerm

        SET @NumTerms = @NumTerms - 1
    END

    RETURN
END


select * from dbo.Fibonacci(25)



create table Orders
(
	Order_id int not null,
	Order_name varchar(50),
	Order_status varchar(50)
)

insert into Orders
values
(1, 'sbfjs', 'Shipped'),
(2, 'sdvfds', 'Unshipped'),
(3, 'adsa', 'Unshipped'),
(4, 'afgsrha', 'Shipped'),
(5, 'agfdsghsd', 'Unshipped')

select * from Orders



--	Changing The Status Of Orders

create procedure Change_Status(@orderid int)
as
begin
	update Orders
	set Order_status = 'Shipped'
	where Order_id = @orderid
end

execute Change_Status 2

select * from Orders



--	Adding Details In The Table

create procedure AddDetails(@orderid int, @ordername varchar(50), @orderstatus varchar(50))
as
begin
	insert into Orders
	values
	(@orderid, @ordername, @orderstatus)
end


execute AddDetails 23, 'sdgbbfd', 'Shipped'

select * from Orders

execute AddDetails 798, 'ajkscb', 'Unshipped'


execute Change_Status 798

select * from Orders

