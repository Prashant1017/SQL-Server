select * from FootballPlayers_audit


select * from FootballPlayers


insert into FootballPlayers
values
(42, 'Piotr Zielinski', 'Poland', 'Napoli', 20, 'Midfielder')


select * from Players


select * from PlayersAudit


select * from FManager


select * from Cricket


select * from HumanResources.Department


select * from HumanResources.Employee


select JobTitle, Gender, datediff(year, BirthDate, getdate()) as Age, datediff(year, HireDate, getdate()) as Experience
from HumanResources.Employee
order by Experience desc


select * from HumanResources.EmployeeDepartmentHistory


select * from HumanResources.EmployeePayHistory


select d.Name, d.GroupName, e.ShiftID, count(*) as Employees
from HumanResources.Department d
inner join HumanResources.EmployeeDepartmentHistory e
on d.DepartmentID = e.DepartmentID
group by Name, GroupName, ShiftID


select string_agg(GroupName, ', ') from HumanResources.Department


select row_number() over (order by GroupName) as Rownumber from HumanResources.Department


select Name, lead(Name) over (order by DepartmentID) from HumanResources.Department


select Name, lag(Name) over (order by DepartmentID) from HumanResources.Department


select * from Sales.SalesOrderDetail


select SalesOrderID, dense_rank() over (order by UnitPrice) as PriceRank from Sales.SalesOrderDetail


select * from Sales.SalesOrderDetail where UnitPrice = (select max(UnitPrice) from Sales.SalesOrderDetail)


SELECT value
FROM STRING_SPLIT('Apple,Orange,Banana', ',')


select choose (3, 'This', 'That', 'There', 'Where')


select parsename('AdventureWorks.Sales.OrderDetails', 1) as Sales


select * from Sales.Customer


select TerritoryID, count(*), grouping(TerritoryID) from Sales.Customer 
group by TerritoryID with rollup


select * from Sales.SalesPerson


SELECT SalesQuota, SUM(SalesYTD) 'TotalSalesYTD', GROUPING(SalesQuota) 'Grouping'  
FROM Sales.SalesPerson  
GROUP BY SalesQuota with rollup


select left_shift(12345, 5)


select right_shift(12345, 5)


select bit_count(0xabc)


select @@dbts


select @@LANGUAGE


select @@LANGID


select @@LOCK_TIMEOUT


SELECT CRYPT_GEN_RANDOM(50)


SELECT CRYPT_GEN_RANDOM(4, 0x25F18060)


declare @json varchar(max)


set @json = N'[
	{"id": 2, "info": {"name": "John", "surname": "Terry"}, "age": 25},
	{"id": 3, "info": {"name": "John", "surname": "Wick", "skill": ["Bikes", "Horse Riding", "One on one combat"]}, "dob": "2001-04-12"}
]'


select id, FirstName, LastName, Age, DOB, skills
from openjson(@json) with
(
	id INT 'strict $.id',
    FirstName NVARCHAR(50) '$.info.name',
    LastName NVARCHAR(50) '$.info.surname',
    Age INT '$.age',
    DOB DATETIME2 '$.dob',
    skills NVARCHAR(MAX) '$.info.skill' AS JSON
    )
OUTER APPLY OPENJSON(skills) WITH (skill NVARCHAR(8) '$')
