select * from HumanResources.Department

select * from HumanResources.Employee

select * from HumanResources.EmployeeDepartmentHistory

select * from HumanResources.EmployeePayHistory

select * from HumanResources.JobCandidate

select * from HumanResources.Shift

select * from HumanResources.EmployeeDepartmentHistory where ShiftID = 2 

select * from Person.Address

select * from Person.AddressType

select BusinessEntityID, NationalIDNumber, JobTitle, BirthDate, MaritalStatus, Gender, HireDate from HumanResources.Employee

select * from Person.Person

select FirstName, MiddleName, LastName from Person.Person where FirstName like '_s%c'

select FirstName, MiddleName, LastName from Person.Person where MiddleName = 'A'

select FirstName, MiddleName, LastName from Person.Person where FirstName like 'c%' and LastName like '%s'

select FirstName from Person.Person where FirstName like '___'

select FirstName, MiddleName, LastName from Person.Person where FirstName like '[d-g]%' order by FirstName

select FirstName, MiddleName, LastName from Person.Person where MiddleName is not Null

select FirstName, MiddleName, LastName from Person.Person order by FirstName

select * from Production.ProductListPriceHistory where ListPrice between 1000 and 3000

select * from Production.ProductPhoto

select * from Sales.CurrencyRate where ToCurrencyCode = 'EUR'

select * from Person.Address 

select * from Person.CountryRegion

select * from Person.Password

select * from Person.EmailAddress

select FirstName, MiddleName, LastName, EmailAddress, PasswordHash from Person.EmailAddress 
inner join Person.Password on Person.EmailAddress.BusinessEntityID = Person.Password.BusinessEntityID
inner join Person.Person on Person.EmailAddress.BusinessEntityID = Person.Person.BusinessEntityID
where FirstName like 'v%' and MiddleName is not null order by FirstName  

select * from Person.PersonPhone

select * from Person.PhoneNumberType

select * from Person.PersonPhone where PhoneNumberTypeID = 3

update Person.PersonPhone
set PhoneNumberTypeID = 3 where BusinessEntityID = 1699

