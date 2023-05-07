select trim('!' from 'Hello!!!')


select upper('welcome here')


select lower('WelCome Here')


select unicode('a')


select datefromparts(2015, 05, 20)


select datename(month, '2015-05-20')


select nullif('123', 123)


select user_name()


select convert(time, getdate())


select BusinessEntityID from Person.BusinessEntityAddress
union all
select BusinessEntityID from Person.BusinessEntityContact


select EmailAddress from Person.EmailAddress
union
select FirstName from Person.Person


select * from Sales.SalesPerson


select cast(max(SalesLastYear) as int) as HighestSale from Sales.SalesPerson


select count(BusinessEntityID), FirstName from Person.Person group by FirstName having count(BusinessEntityID) > 100 order by FirstName 


select count(SalesOrderID) as TotalSales, OrderDate from Sales.SalesOrderHeader group by OrderDate order by OrderDate 


select DepartmentID, count(*) as TotalStaff from HumanResources.EmployeeDepartmentHistory group by DepartmentID


select SalesPersonID, max(TotalDue) as max_due, min(TotalDue) as min_due from Sales.SalesOrderHeader group by SalesPersonID order by SalesPersonID


select CustomerID, sum(TotalDue) as TotalSale from Sales.SalesOrderHeader group by CustomerID order by TotalSale desc


select * from Sales.SalesOrderHeader


select CustomerID, sum(TotalDue) as TotalSale from Sales.SalesOrderHeader group by CustomerID having sum(TotalDue) < 11


select CustomerID, SalesPersonID, SalesOrderNumber, PurchaseOrderNumber, AccountNumber, CreditCardID, CreditCardApprovalCode 
into CustomerDetails from Sales.SalesOrderHeader

select * from CustomerDetails

select * from Sales.SalesOrderHeader


select * from Orders


select BusinessEntityID, DepartmentID, ShiftID, StartDate into ProductionManager from HumanResources.EmployeeDepartmentHistory where DepartmentID = 7

select * from Engineer

alter table Engineer
drop column StartDate


select * from ProductionManager


create view [Research and Development] as 
select * from HumanResources.EmployeeDepartmentHistory where DepartmentID = 6

select * from [Research and Development]

alter view [Research and Development] as
select BusinessEntityID, DepartmentID, ShiftID, StartDate from HumanResources.EmployeeDepartmentHistory where DepartmentID = 6



alter view [Marketing] as 
select BusinessEntityID, DepartmentID, ShiftID, StartDate, EndDate from HumanResources.EmployeeDepartmentHistory where DepartmentID = 4


select * from [Marketing]


select DepartmentID, count(*) as TotalEmployee from HumanResources.EmployeeDepartmentHistory
group by DepartmentID


select datediff(year, BirthDate, getdate()) as Age from HumanResources.Employee order by Age desc


select Gender, count(BusinessEntityID) as TotalMembers from HumanResources.Employee group by Gender

select Gender, sum(VacationHours) as Vacation, sum(SickLeaveHours) as Leave from HumanResources.Employee group by Gender


select datediff(year, Birthdate, getdate()) as Age, MaritalStatus, Gender, datediff(year, HireDate, getdate()) as Experience, JobTitle 
from HumanResources.Employee


create view [EmployeeDetails] as
	select datediff(year, Birthdate, getdate()) as Age, MaritalStatus, Gender, datediff(year, HireDate, getdate()) as Experience, JobTitle 
	from HumanResources.Employee

select * from [EmployeeDetails]


select * from [EmployeeDetails] where Age < 35 order by Age


select Age, sum(Experience) from [EmployeeDetails] group by Age 


select * from [EmployeeDetails] where JobTitle = 'Sales Representative'


select * from [EmployeeDetails] where Gender = 'M' and MaritalStatus = 'S'


select * from [EmployeeDetails] where Experience = 17


select * from HumanResources.vEmployee


select FirstName, MiddleName, LastName, JobTitle, PhoneNumber, EmailAddress, AddressLine1, City, StateProvinceName, PostalCode, CountryRegionName
from HumanResources.vEmployee
order by FirstName


select * from Sales.vIndividualCustomer


select FirstName, MiddleName, LastName, PhoneNumber, EmailAddress, AddressLine1, City, StateProvinceName, CountryRegionName
from Sales.vIndividualCustomer


select * from Sales.vStoreWithDemographics


select * from Sales.vStoreWithDemographics where AnnualSales >= 500000


select * from Purchasing.vVendorWithAddresses


select * from Purchasing.vVendorWithContacts


select Name, BusinessEntityID from Purchasing.vVendorWithAddresses
union 
select Name, BusinessEntityID from Purchasing.vVendorWithContacts


select * from Sales.vPersonDemographics where BusinessEntityID >= 2380


select datediff(year, Birthdate, getdate()) as Age from Sales.vPersonDemographics where BusinessEntityID >= 2380


select Gender, count(*) as TotalMembers from Sales.vPersonDemographics group by Gender


select MaritalStatus, count(*) as TotalMembers from Sales.vPersonDemographics group by MaritalStatus


select * from Sales.vStoreWithDemographics where YearOpened >= 2000


select distinct BankName from Sales.vStoreWithDemographics


select BankName, count(*) as NumberOfCompanies from Sales.vStoreWithDemographics group by BankName


select distinct Education from Sales.vPersonDemographics


select distinct Occupation from Sales.vPersonDemographics


select distinct Name from Sales.vStoreWithDemographics 


select getdate() as Time
