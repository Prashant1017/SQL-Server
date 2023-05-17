select * from EmpFullDetails


select * from Production.WorkOrderRouting


select distinct ProductID from Production.WorkOrderRouting


select * from Production.WorkOrderRouting where ScheduledStartDate < '2012-01-01'


select * from Purchasing.PurchaseOrderHeader


select * from Purchasing.PurchaseOrderDetail


select PurchaseOrderID, OrderQty, ProductID, cast(UnitPrice as int) as UnitPrice, cast(LineTotal as int) as LineTotal 
from Purchasing.PurchaseOrderDetail


select * from Sales.CreditCard


select CardType, count(*) as Count from Sales.CreditCard group by CardType


select * from Sales.CreditCard where ExpMonth = 7


select * from Sales.SalesOrderHeader


select * from Purchasing.PurchaseOrderHeader


select * from Purchasing.PurchaseOrderDetail


select p.ProductID, p.Name, p.Color, o.OrderQty, o.PurchaseOrderID, o.PurchaseOrderDetailID, o.UnitPrice, o.LineTotal
into Products
from Production.Product p
inner join Purchasing.PurchaseOrderDetail o
on p.ProductID = o.ProductID


select * from Products


select p.ProductID, p.Name, p.Color, p.OrderQty, p.UnitPrice, p.LineTotal, o.EmployeeID, o.VendorID, o.OrderDate, o.ShipDate
into ProductDetails
from Products p
inner join Purchasing.PurchaseOrderHeader o
on p.PurchaseOrderID = o.PurchaseOrderID


select * from ProductDetails


select p.ProductID, p.Name, p.Color, p.OrderQty, p.UnitPrice, p.LineTotal, concat_ws(' ', e.FirstName, e.MiddleName, e.LastName) as FullName, e.JobTitle
into ProductFullDetails
from ProductDetails p
inner join HumanResources.vEmployee e
on p.EmployeeID = e.BusinessEntityID


select * from ProductFullDetails


select max(OrderQty) as HighestOrder, max(UnitPrice) as HighestPrice, max(LineTotal) as HighestValue
from ProductFullDetails


select * from ProductFullDetails where 
OrderQty = (select max(OrderQty) from ProductFullDetails) or
UnitPrice = (select max(UnitPrice) from ProductFullDetails) or
LineTotal = (select max(LineTotal) from ProductFullDetails)
order by OrderQty desc


select * from ProductFullDetails


select distinct JobTitle from ProductFullDetails


select distinct FullName from ProductFullDetails


select FullName, JobTitle, count(*) as Number from ProductFullDetails group by FullName, JobTitle order by Number desc


select * from ProductFullDetails where ProductID = 910


select * from ProductFullDetails where JobTitle = 'Purchasing Manager'


select * from PersonDemographics


select datediff(year, Birthdate, getdate()) as Age, MaritalStatus, Gender from PersonDemographics


select datediff(day, DateFirstPurchase, getdate()) as FirstPurchase from PersonDemographics


select * from Scrap


select * from ScrapReason


select * from ScrapProducts


select * from ScrapProductDetails
