select * from Cricket_audit


select * from CustomerDetails


select * from Sales.vIndividualCustomer


select * from Sales.vSalesPerson


select distinct SalesPersonID from CustomerDetails


select * from ScrapProductDetails


select * from ScrapReason


select * from Production.WorkOrder


select * from Production.WorkOrder where ScrapReasonID is not null


select * from ScrapProducts


select s.*, w.StartDate, w.EndDate, w.DueDate 
from ScrapProducts s
inner join Production.WorkOrder w
on s.WorkOrderID = w.WorkOrderID
where StartDate between '2011-07-01' and '2013-07-01'


select ProductName, ProductNumber, ProductModel, cast((StandardCost  + ListPrice) as int) as TotalCost 
from ScrapProductDetails order by TotalCost desc


select * from HumanResources.Employee


select BusinessEntityID, NationalIDNumber, JobTitle, BirthDate, MaritalStatus, Gender, datediff(year, BirthDate, getdate()) as Age,
HireDate, datediff(year, HireDate, getdate()) as Experience, VacationHours, SickLeaveHours
into Emp
from HumanResources.Employee
order by Age desc


select * from Emp


select h.FirstName, h.MiddleName, h.LastName, e.BirthDate, e.Age, e.Gender, e.MaritalStatus, h.JobTitle, e.HireDate, e.Experience,
h.PhoneNumber, h.AddressLine1, h.City, h.StateProvinceName, h.PostalCode, h.CountryRegionName
into EmpFullDetails
from HumanResources.vEmployee h
inner join Emp e
on h.BusinessEntityID = e.BusinessEntityID


select * from EmpFullDetails


select Gender, count(*) as Number from EmpFullDetails group by Gender


select concat_ws(' ', FirstName, MiddleName, LastName) as FullName from EmpFullDetails order by FullName


select * from EmpFullDetails where Age = (select max(Age) from EmpFullDetails)
or Experience = (select max(Experience) from EmpFullDetails)
