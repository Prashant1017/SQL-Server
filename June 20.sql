SELECT S.name as 'Schema',
T.name as 'Table',
I.name as 'Index',
DDIPS.avg_fragmentation_in_percent,
DDIPS.page_count
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS DDIPS
INNER JOIN sys.tables T on T.object_id = DDIPS.object_id
INNER JOIN sys.schemas S on T.schema_id = S.schema_id
INNER JOIN sys.indexes I ON I.object_id = DDIPS.object_id
AND DDIPS.index_id = I.index_id
WHERE DDIPS.database_id = DB_ID()
and I.name is not null
AND DDIPS.avg_fragmentation_in_percent > 0
ORDER BY DDIPS.avg_fragmentation_in_percent desc


-- Basic Rebuild Command
alter index PK_EmployeePayHistory_BusinessEntityID_RateChangeDate on HumanResources.EmployeePayHistory rebuild


-- Rebuild index with online option
alter index PK_EmployeePayHistory_BusinessEntityID_RateChangeDate on HumanResources.EmployeePayHistory rebuild with (online  = on) 


SELECT OBJECT_NAME(IX.object_id) as db_name, si.name, extent_page_id, allocated_page_page_id, previous_page_page_id, next_page_page_id
FROM sys.dm_db_database_page_allocations(DB_ID('AdventureWorks'), OBJECT_ID('HumanResources.EmployeePayHistory'),NULL, NULL, 'DETAILED') IX
INNER JOIN sys.indexes si on IX.object_id = si.object_id AND IX.index_id = si.index_id
WHERE si.name = 'IX_OrderTracking_CarrierTrackingNumber'
ORDER BY allocated_page_page_id


select avg_fragmentation_in_percent, fragment_count, avg_fragment_size_in_pages from sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS DDIPS
order by avg_fragmentation_in_percent desc


-- Reorganize index
alter index PK_ProductVendor_ProductID_BusinessEntityID
on Purchasing.ProductVendor
reorganize



SELECT sp.stats_id, 
       name, 
       filter_definition, 
       last_updated, 
       rows, 
       rows_sampled, 
       steps, 
       unfiltered_rows, 
       modification_counter
FROM sys.stats AS stat
     CROSS APPLY sys.dm_db_stats_properties(stat.object_id, stat.stats_id) AS sp
WHERE stat.object_id = OBJECT_ID('HumanResources.Employee');


update statistics HumanResources.Employee


DBCC TRACEON (3604)
SELECT SalesDetail.CarrierTrackingNumber
FROM Sales.SalesOrderDetail SalesDetail
WHERE SalesOrderID > 20
OPTION 
(  RECOMPILE, 
    QUERYTRACEON 8605
)


SELECT Name,ProductNumber
    FROM [Production].[Product]
WHERE ProductNumber 
LIKE CONCAT(SUBSTRING('AXXLPLR',1,1) , 'R') + '%'


select Name, ProductNumber from Production.Product where SafetyStockLevel = 0


select Name, ProductNumber from Production.Product
where Name = 'Adjustable Race'


SELECT ProductID   FROM Sales.SalesOrderDetail S
WHERE (ProductID > 813 AND ProductID<950)
OR (ProductID >= 950 AND ProductID<=1000) 
OR (ProductID=813)


SELECT SD.CarrierTrackingNumber FROM 
Sales.SalesOrderHeader SO INNER JOIN 
Sales.SalesOrderDetail SD ON SO.SalesOrderID = SD.SalesOrderID
WHERE SD.CarrierTrackingNumber = '4911-403C-98'


select * from sys.dm_exec_query_optimizer_info where counter like 'search%'
SELECT *    FROM  Sales.SalesOrderDetail 
WHERE ProductID = 776
OPTION (RECOMPILE)
select * from sys.dm_exec_query_optimizer_info where counter like 'search%'
