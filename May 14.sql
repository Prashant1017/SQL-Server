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


select * from DepartmentDetails  where GroupName = 'Quality Assurance' and Shift = 'Night'
