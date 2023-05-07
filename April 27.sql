/*	
select *from HumanResources.EmployeeDepartmentHistory
where ShiftID in (@shiftid)
select * from HumanResources.Employee
where Gender in (@gender)
*/




select d.DepartmentID, e.JobTitle, s.ShiftID, e.BirthDate, e.Gender, e.HireDate from HumanResources.EmployeeDepartmentHistory h
	join HumanResources.Department d on h.DepartmentID = d.DepartmentID
	join HumanResources.Employee e on h.BusinessEntityID = e.BusinessEntityID
	join HumanResources.Shift s on h.ShiftID = s.ShiftID


alter procedure DisplayData @shiftid tinyint, @departid tinyint
as 
begin
	select d.DepartmentID,d.Name, e.JobTitle, s.ShiftID, e.BirthDate, e.Gender, e.HireDate from HumanResources.EmployeeDepartmentHistory h
	join HumanResources.Department d on h.DepartmentID = d.DepartmentID
	join HumanResources.Employee e on h.BusinessEntityID = e.BusinessEntityID
	join HumanResources.Shift s on h.ShiftID = s.ShiftID
	where s.ShiftID in (@shiftid) and d.DepartmentID in (@departid)
end

execute DisplayData 1, 10
