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


select datediff(year, BirthDate, HireDate) as Starting from EmpFullDetails order by Starting


select * from EmpFullDetails where Age between 25 and 50


select * from EmpFullDetails where FirstName like 'K%'


select City, count(*) as Peoples from EmpFullDetails group by City


select * from EmpFullDetails where Experience > 15


select * from EmpFullDetails where Age < 40 and Experience > 15


select Age, count(*) as Total from EmpFullDetails group by Age 


select FirstName, MiddleName, LastName, Age - Experience as StartAge from EmpFullDetails order by StartAge


select JobTitle, count(*) as Total from EmpFullDetails group by JobTitle order by Total desc


select JobTitle, Age, count(*) as Total from EmpFullDetails group by JobTitle, Age order by Total desc 


select MaritalStatus, count(*) as People from EmpFullDetails group by MaritalStatus


select * from EmpFullDetails where MaritalStatus = 'S' order by Age desc


select * from EmpFullDetails where BirthDate < '1960-01-01'


select * from EmpFullDetails where Age >= 70


select * from EmpFullDetails where JobTitle like '%supervisor%' order by JobTitle


select * from EmpFullDetails where City = 'Seattle'


select StateProvinceName, count(*) as Total from EmpFullDetails group by StateProvinceName order by Total desc


select * from Sales.Customer


select * from Sales.vIndividualCustomer


select * from Sales.vPersonDemographics


select * from Sales.vIndividualCustomer where AddressLine2 is not null


select * from Sales.vIndividualCustomer where LastName like '%son'


select * from Sales.vIndividualCustomer where Suffix is not null


select PhoneNumberType, count(*) as Total from Sales.vIndividualCustomer group by PhoneNumberType


select * from Sales.vIndividualCustomer where MiddleName is not null
