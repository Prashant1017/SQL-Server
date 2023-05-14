select * from CustomerDetails


select * from HumanResources.Department


create view DepartmentName
as 
	select e.BusinessEntityID, d.Name, d.GroupName, e.ShiftID
	from HumanResources.EmployeeDepartmentHistory e
	inner join HumanResources.Department d
	on e.DepartmentID = d.DepartmentID


select * from DepartmentName


select d.BusinessEntityID, d.Name, d.GroupName, s.Name as Shift, s.StartTime, s.EndTime
into DepartmentDetails
from DepartmentName d
inner join HumanResources.Shift s
on d.ShiftID = s.ShiftID


select * from DepartmentDetails


select * from DepartmentDetails where Shift = 'Day' and GroupName = 'Research and Development'


select * from [Research and Development]


select Shift, count(*) as NumberOfEmployees from DepartmentDetails group by Shift


select distinct GroupName from DepartmentDetails


select * from DepartmentDetails  where GroupName = 'Inventory Management' and Shift = 'Night'


select GroupName, count(*) as TotalEmployees from DepartmentDetails group by GroupName order by TotalEmployees desc


select Name, Shift, count(*) as TotalEmployees from DepartmentDetails group by Name, Shift order by TotalEmployees desc


select * from DepartmentDetails


select * from DepartmentName


select distinct Name from DepartmentDetails


select * from DepartmentDetails where Shift = 'Night'


select * from DepartmentDetails where Name = 'Facilities and Maintenance'


select * from DepartmentDetails where Shift = 'Evening'


select * from Person.Address


select City, count(*) as Number from Person.Address group by City order by Number desc


select * from Person.BusinessEntity


select * from Person.EmailAddress


select * from Person.Password


select e.BusinessEntityID, e.EmailAddress, p.PasswordHash, p.PasswordSalt
from Person.EmailAddress e
inner join Person.Password p
on e.BusinessEntityID = p.BusinessEntityID


select * from Person.Person


select concat_ws(' ' , p.FirstName, p.MiddleName, p.LastName) as FullName, ph.PhoneNumber, e.EmailAddress, pa.PasswordHash, pa.PasswordSalt
into PersonFullDetails
from Person.Person p
inner join Person.PersonPhone ph on p.BusinessEntityID = ph.BusinessEntityID
inner join Person.EmailAddress e on p.BusinessEntityID = e.BusinessEntityID
inner join Person.Password pa on p.BusinessEntityID = pa.BusinessEntityID


select * from PersonFullDetails


select * from PersonFullDetails order by FullName desc


select * from PersonFullDetails where FullName like 'F%'


create trigger NoEntry
on PersonFullDetails
instead of insert, update, delete
as
begin
	raiserror ('!!!CONTENTS OF THIS TABLE CANNOT BE MODIFIED!!!', 16, 1)
	rollback transaction
	print '*** You dont have access to modify the contents of the table ***'
end


select * from PersonFullDetails


delete from PersonFullDetails
where FullName = 'Ken'
