--		Query Parallelization		--


select * from sys.dm_exec_cached_plans


select * from Sales.SalesOrderHeader


create nonclustered index IX_L001
on Sales.SalesOrderHeader ([PurchaseOrderNumber])


alter database AdventureWorks2019 set compatibility_level = 150


execute sp_configure 'show advanced options', 1
reconfigure

execute sp_configure 'cost threshold for parallelism', 20
reconfigure


select 
	ProductID, 
	sum(LineTotal) as TotalsOfLine, 
	sum(UnitPrice) as TotalsOfPrice,
	sum(UnitPriceDiscount) as TotalsOfDiscount
from Sales.SalesOrderDetail d
inner join Sales.SalesOrderHeader h
on d.SalesOrderID = h.SalesOrderID
where PurchaseOrderNumber like 'PO%'
group by ProductID


select distinct ProductID from
Sales.SalesOrderDetail d
inner join Sales.SalesOrderHeader h
on d.SalesOrderID = h.SalesOrderID
where PurchaseOrderNumber like 'PO%'
group by ProductID


select distinct ProductID from
Sales.SalesOrderDetail d
inner join Sales.SalesOrderHeader h
on d.SalesOrderID = h.SalesOrderID
where PurchaseOrderNumber like 'PO%'
group by ProductID
option (use hint('enable_parallel_plan_preference'))


select 
	ProductID, 
	sum(LineTotal) as TotalsOfLine, 
	sum(UnitPrice) as TotalsOfPrice,
	sum(UnitPriceDiscount) as TotalsOfDiscount
from Sales.SalesOrderDetail d
inner join Sales.SalesOrderHeader h
on d.SalesOrderID = h.SalesOrderID
where PurchaseOrderNumber like 'PO%'
group by ProductID
option (maxdop 2)
