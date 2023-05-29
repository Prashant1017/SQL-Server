select * from Sales.SalesOrderHeader


create partition function partition_function (int)
as range left for values (20110531, 20120531, 20130531)


select '20120531' date, $partition.partition_function(20120531) partitionnumber



select o.name as ObjectName, i.name as IndexName, partition_id, partition_number, [rows]
from sys.partitions p
inner join sys.objects o on o.object_id = p.object_id
inner join sys.indexes i on i.object_id = p.object_id and p.index_id = i.index_id
where o.name = 'Person'


create partition function [myRange] (int)
as range right for values (5000, 15000, 50000)


create partition scheme PartitionScheme
as partition myRange all to ([primary])


select ps.name as [Partition Scheme Name], pf.name as [Partition FunctionName], boundary_id, value
from sys.partition_schemes ps
inner join sys.partition_functions pf on pf.function_id = ps.function_id
inner join sys.partition_range_values prf on pf.function_id = prf.function_id


if exists
(
	select * from sys.indexes where object_id = OBJECT_ID(N'Person.Person') and name = N'PK_Person_BusinessEntityID'
)

alter table Person.Person drop constraint [PK_Person_BusinessEntityID]


alter table Person.Person add constraint [PK_Person_BusinessEntityID] primary key clustered
(
	[BusinessEntityID] asc
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, ignore_dup_key = off, online = off,
allow_row_locks = on, allow_page_locks = on)
on PartitionScheme([BusinessEntityID])


select o.name as ObjectName, i.name as IndexName, partition_id, partition_number, [rows]
from sys.partitions p
inner join sys.objects o on o.object_id = p.object_id
inner join sys.indexes i on i.object_id = p.object_id and p.index_id = i.index_id
where o.name = 'Person'


select * from Sales.SalesorderHeader


--	Table Partition With Respect To Date	--



alter database AdventureWorks2019
add filegroup salesorder_2013

alter database AdventureWorks2019
add filegroup salesorder_2014


alter database AdventureWorks2019
add file
(
	name = salesorder_2013,
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLDEV\MSSQL\DATA\salesorder_2013.mdf',
	size = 10 MB,
	maxsize = unlimited,
	filegrowth = 1024 KB
) to filegroup salesorder_2013

alter database AdventureWorks2019
add file
(
	name = salesorder_2014,
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLDEV\MSSQL\DATA\salesorder_2014.mdf',
	size = 10 MB,
	maxsize = unlimited,
	filegrowth = 1024 KB
) to filegroup salesorder_2014


create partition function sales_by_year (date)
as range left
for values ('2013-05-31', '2014-05-31')


create partition scheme sales_by_year_scheme
as partition sales_by_year
to ([salesorder_2013], [salesorder_2014], [primary])

/*
alter table Sales.SalesOrderHeader
drop constraint [PK_SalesOrderHeader_SalesOrderID]


alter table Sales.SalesOrderHeaderSalesReason
drop constraint [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID]
*/

select name from sys.filegroups
where type = 'fg'


select name as filename, physical_name as file_path
from sys.database_files
where type_desc = 'rows'


create table sales.orders
(
	SalesOrderID int,
	OrderDate date,
	SalesOrderNumber varchar(20)
	primary key (SalesOrderID, OrderDate)
)
on sales_by_year_scheme (OrderDate)


insert into sales.orders
select SalesOrderID, OrderDate, SalesOrderNumber
from Sales.SalesOrderHeader 


SELECT 
	p.partition_number AS partition_number,
	f.name AS file_group, 
	p.rows AS row_count
FROM sys.partitions p
JOIN sys.destination_data_spaces dds ON p.partition_number = dds.destination_id
JOIN sys.filegroups f ON dds.data_space_id = f.data_space_id
WHERE OBJECT_NAME(OBJECT_ID) = 'orders'
order by partition_number;
