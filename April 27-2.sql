select * from HumanResources.EmployeePayHistory

create procedure Details @ShiftID tinyint, @fromdate date, @todate date, @hirefrom date, @hireto date
as 
begin
	select DepartmentID, JobTitle, ShiftID, BirthDate, Gender, HireDate from HumanResources.EmployeeDepartmentHistory inner join HumanResources.Employee on HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
	where ShiftID in (@ShiftID) and BirthDate between @fromdate and @todate and HireDate between @hirefrom and @hireto
end

execute Details 2, '1969-01-01', '1990-01-01', '2005-01-01', '2010-01-01'

create procedure ShiftDetails
(
	@action varchar(15),
	@shiftid tinyint,
	@hirefrom date,
	@hireto date,
	@gender nvarchar(1)
)
as 
begin
	if(@action = 'display')
	begin
		select DepartmentID, JobTitle, ShiftID, BirthDate, Gender, HireDate from HumanResources.EmployeeDepartmentHistory 
		inner join HumanResources.Employee on HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
		where ShiftID in (@shiftid) and HireDate between @hirefrom and @hireto and Gender in (@gender)
	end

	else if(@action = 'total')
	begin
		select * from HumanResources.EmployeePayHistory

create procedure Details @ShiftID tinyint, @fromdate date, @todate date, @hirefrom date, @hireto date
as 
begin
	select DepartmentID, JobTitle, ShiftID, BirthDate, Gender, HireDate from HumanResources.EmployeeDepartmentHistory inner join HumanResources.Employee on HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
	where ShiftID in (@ShiftID) and BirthDate between @fromdate and @todate and HireDate between @hirefrom and @hireto
end

execute Details 2, '1969-01-01', '1990-01-01', '2005-01-01', '2010-01-01'

create procedure ShiftDetails
(
	@action varchar(15),
	@shiftid tinyint,
	@hirefrom date,
	@hireto date,
	@gender nvarchar(1)
)
as 
begin
	if(@action = 'display')
	begin
		select DepartmentID, JobTitle, ShiftID, BirthDate, Gender, HireDate from HumanResources.EmployeeDepartmentHistory 
		inner join HumanResources.Employee on HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
		where ShiftID in (@shiftid) and HireDate between @hirefrom and @hireto and Gender in (@gender)
	end

	else if(@action = 'total')
	begin
		select count(@shiftID) as Shiftstaff from HumanResources.EmployeeDepartmentHistory
		where ShiftID in (@shiftid)
		select count(@gender) as StaffGen from HumanResources.Employee
		where Gender in (@gender)
	end
end


--drop procedure ShiftDetails

execute ShiftDetails 'display', 2, '2000-01-01', '2010-01-01', 'F'

execute ShiftDetails 'total', 3, '2000-01-01', '2010-01-01', 'M'




/*
alter procedure test @sid tinyint, @gen nvarchar(1)
as
begin
	select count(@sid) as ShiftStaff, count(@gen) as StaffGen from HumanResources.EmployeeDepartmentHistory
	inner join HumanResources.Employee on HumanResources.EmployeeDepartmentHistory.BusinessEntityID = HumanResources.Employee.BusinessEntityID
	where ShiftID in (@sid) and Gender in (@gen) 
end
execute test 1, 'M'
*/



select p.FirstName, p.MiddleName, p.LastName, a.AddressLine1, a.City, a.StateProvinceID, a.PostalCode, c.PersonID
from Person.BusinessEntityAddress y 
join Person.Person p on p.BusinessEntityID = y.BusinessEntityID
join Person.BusinessEntityContact c on c.BusinessEntityID = y.BusinessEntityID
join Person.Address a on a.AddressID = y.AddressID

select * from Person.Person

select * from Person.BusinessEntityAddress



create procedure ContactDetails
as 
begin
	select p.FirstName, e.PhoneNumber, t.Name from Person.PersonPhone e 
	inner join Person.Person p on p.BusinessEntityID = e.BusinessEntityID
	inner join Person.PhoneNumberType t on t.PhoneNumberTypeID = e.PhoneNumberTypeID
end


execute ContactDetails
