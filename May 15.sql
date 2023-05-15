select * from PersonFullDetails


select * from Sales.Customer


select * from Production.Product


select * from Production.Product where Size is not null


select * from Production.WorkOrder


select * from Production.WorkOrder where ScrapReasonID is not null


create view Scrap
as
	select * from Production.WorkOrder where ScrapReasonID is not null


select * from Scrap


select s.ProductID, s.WorkOrderID, s.OrderQty, s.StockedQty, s.ScrappedQty, r.Name
into ScrapReason
from Scrap s
inner join Production.ScrapReason r
on s.ScrapReasonID = r.ScrapReasonID


select * from ScrapReason


select p.Name as ProductName, p.ProductNumber, p.Color, p.SafetyStockLevel, p.ReorderPoint, p.StandardCost, p.ListPrice, p.ProductModelID,
s.WorkOrderID, s.OrderQty, s.StockedQty, s.ScrappedQty, s.Name as Scrap
into ScrapProducts
from Production.Product p
inner join ScrapReason s
on p.ProductID = s.ProductID
where Color is not null and ProductModelID is not null


select * from ScrapProducts


select s.ProductName, s.ProductNumber, p.Name as ProductModel, s.Color, s.SafetyStockLevel, s.ReorderPoint, s.StandardCost, s.ListPrice, 
s.OrderQty, s.StockedQty, s.ScrappedQty, s.Scrap
into ScrapProductDetails
from ScrapProducts s
inner join Production.ProductModel p
on s.ProductModelID = p.ProductModelID


select * from ScrapProductDetails


select Color, count(*) as TotalNumber from ScrapProductDetails group by Color


select * from ScrapProductDetails where ScrappedQty > 10


select * from ScrapProductDetails order by ListPrice desc


select * from Sales.vSalesPerson


select * from Sales.vPersonDemographics


select * from SalesPerson


select * from PersonDemographics


select * from CompanyEmployee


select distinct FullName from CompanyEmployee


select FullName, count(*) as NumberOfCompanies from CompanyEmployee group by FullName order by NumberOfCompanies desc


select * from Sales.vIndividualCustomer


select * from dbo.detail_category()


select * from dbo.Fibonacci(10)


select dbo.Addition(3,5)


select dbo.Calculator(23, 56, '%')


select dbo.Emp_detail(13)


select dbo.ufnGetAccountingEndDate()


select dbo.ufnLeadingZeros(5)


select * from Production.Product


select * from Production.ProductListPriceHistory


select * from INFORMATION_SCHEMA.CHECK_CONSTRAINTS


select * from sys.all_columns


select * from FootballPlayers


insert into FootballPlayers
values
(43, 'Yann Sommer', 'Switzerland', 'Bayern Munich', 27, 'Goalkeeper')


select * from FootballPlayers_audit


select * from FootballPlayers_backup


select * from FootballLeague


select * from FManager


delete from FootballPlayers
where id = 43


select Name, ProductNumber, cast((StandardCost + ListPrice) as int) as TotalCost from Production.Product order by TotalCost desc


select cast(sum(ListPrice) as int) as Total, cast(max(ListPrice) as int) as Maximum, cast(min(ListPrice) as int) as Minimum, cast(avg(ListPrice) as int) as Average from Production.Product
