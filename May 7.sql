select distinct JobTitle from HumanResources.vEmployee


select FirstName, MiddleName, LastName, PhoneNumber, EmailAddress, AddressLine1, City  
from HumanResources.vEmployee where JobTitle = 'Production Technician - WC60'


select JobTitle, count(*) as TotalEmployee from HumanResources.vEmployee group by JobTitle


select * from HumanResources.vEmployee


select * from HumanResources.vEmployee where FirstName like 'A%'


select * from HumanResources.vEmployee where CountryRegionName in ('Canada', 'Germany')


select * from Sales.SalesOrderHeader


select top 5 CustomerID, sum(TotalDue) as TotalOrderAmount from Sales.SalesOrderHeader
group by CustomerID


select * from Production.Product where ListPrice > 1000


select * from Production.Product where ListPrice between 1000 and 1500


select * from Production.Product where StandardCost between 500 and 700


select * from Production.Product where DaysToManufacture between 2 and 5


select * from Production.Product order by Name 


select distinct Name from Production.Product


select * from Production.Product where Name like 'D%'


select cast(avg(ListPrice) as int) as AveragePrice from Production.Product


select distinct GroupName from HumanResources.vEmployeeDepartment


select Department, count(*) as TotalStaff from HumanResources.vEmployeeDepartment group by Department


select * from HumanResources.vEmployeeDepartment where Department = 'Production'


select distinct Title from HumanResources.vEmployeeDepartment


select Title, count(*) from HumanResources.vEmployeeDepartment group by Title


select Shift, count(*) as TotalEmployee from HumanResources.vEmployeeDepartmentHistory group by Shift


select * from Person.vAdditionalContactInfo where TelephoneSpecialInstructions is not null


select CountryRegionName, count(*) from Person.vStateProvinceCountryRegion group by CountryRegionName


select * from Production.vProductAndDescription


select ProductModel, count(*) from Production.vProductAndDescription group by ProductModel


select * from Sales.vIndividualCustomer


select AddressLine1, count(*) as NumberOfCustomers from Sales.vIndividualCustomer group by AddressLine1 order by NumberOfCustomers desc


select * from Sales.vIndividualCustomer where AddressLine1 = 'Midi-Couleurs'


select * from Sales.vPersonDemographics


select * from Sales.vPersonDemographics where TotalChildren > 2


select TotalChildren, count(*) from Sales.vPersonDemographics group by TotalChildren order by TotalChildren


select distinct Occupation from Sales.vPersonDemographics


select Occupation, count(*) from Sales.vPersonDemographics group by Occupation


select Gender, count(*) from Sales.vPersonDemographics group by Gender 


select * from Sales.vPersonDemographics where Gender is not null


select * from Sales.vPersonDemographics where YearlyIncome = '0-25000'


select * from Sales.vSalesPerson where SalesLastYear = (select max(SalesLastYear) from Sales.vSalesPerson)


select PostalCode, CountryRegionName from Sales.vStoreWithAddresses


select distinct BusinessType from Sales.vStoreWithDemographics


select Name, YearOpened from Sales.vStoreWithDemographics order by YearOpened 


select * from Sales.vPersonDemographics where Gender is not null


create view [PersonDemographics] as
select * from Sales.vPersonDemographics where Gender is not null


select * from PersonDemographics


select YearlyIncome, count(*) as EmployeeNumber from PersonDemographics group by YearlyIncome


select * from PersonDemographics where NumberCarsOwned > 2


select MaritalStatus, Gender, YearlyIncome, TotalChildren, Education, Occupation, datediff(year, BirthDate, getdate()) as Age
from PersonDemographics order by Age desc


select * from PersonDemographics where datediff(year, BirthDate, getdate()) >= 100


select * from PersonDemographics


select cast(TotalPurchaseYTD as int) as TotalPurchase from PersonDemographics order by TotalPurchase 


select * from EmployeeDetails


select * from [Research and Development]


select * from Marketing


select * from PersonDemographics


select f.FullName, f.JobTitle, f.SalesTerritory, s.SalesOrderID, s.SalesOrderNumber, s.PurchaseOrderNumber, cast(s.TotalDue as int) as Due 
from Sales.vSalesPersonSalesByFiscalYears f
inner join Sales.SalesOrderHeader s on s.SalesPersonID = f.SalesPersonID


create view [SalesPerson] as
	select f.FullName, f.JobTitle, f.SalesTerritory, s.SalesOrderID, s.SalesOrderNumber, s.PurchaseOrderNumber, cast(s.TotalDue as int) as Due 
	from Sales.vSalesPersonSalesByFiscalYears f
	inner join Sales.SalesOrderHeader s on s.SalesPersonID = f.SalesPersonID


select * from SalesPerson


select FullName, sum(Due) as Total from SalesPerson group by FullName order by Total


select * from Sales.vIndividualCustomer


select distinct StateProvinceName from Sales.vIndividualCustomer


select StateProvinceName, count(*) as NumberOfCustomer from Sales.vIndividualCustomer group by StateProvinceName


select * from Sales.vIndividualCustomer where StateProvinceName = 'California'


select * from Purchasing.vVendorWithAddresses where City = 'Richmond'


select concat_ws(', ' , Name, City) as Vendor from Purchasing.vVendorWithAddresses


select * from Sales.vIndividualCustomer


select concat_ws(' ', FirstName, MiddleName, LastName) as FullName, concat_ws(', ', AddressLine1, City, StateProvinceName, CountryRegionName) as Address
from Sales.vIndividualCustomer order by FullName 


select f.FullName, s.Name, f.JobTitle, f.SalesTerritory
from Sales.vSalesPersonSalesByFiscalYears f 
inner join Sales.Store s on s.SalesPersonID = f.SalesPersonID


create view [CompanyEmployee] as
	select f.FullName, s.Name, f.JobTitle, f.SalesTerritory
	from Sales.vSalesPersonSalesByFiscalYears f 
	inner join Sales.Store s on s.SalesPersonID = f.SalesPersonID


select * from CompanyEmployee


select FullName, count(*) as NumberOfCompany from CompanyEmployee group by FullName order by NumberOfCompany
