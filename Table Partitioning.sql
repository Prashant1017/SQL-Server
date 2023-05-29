--	Table Partitioning	--


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



--	Vertical Partition	--


select * from Sales.SalesOrderHeader


create table SalesPart1
(
	SalesOrderID int primary key,
	OrderDate date,
	DueDate date,
	ShipDate date
)


create table SalesPart2
(
	SalesOrderID int primary key,
	Status int,
	SalesOrderNumber varchar(20),
	PurchaseOrderNumber varchar(20),
	AccountNumber varchar(20)
)

insert into SalesPart1
select SalesOrderID, OrderDate, DueDate, ShipDate
from Sales.SalesOrderHeader


insert into SalesPart2
select SalesOrderID, Status, SalesOrderNumber, PurchaseOrderNumber, AccountNumber
from Sales.SalesOrderHeader


select * from SalesPart1


set statistics time on


select * from Sales.SalesOrderHeader


select * from SalesPart1



alter database AdventureWorks2019
add filegroup January

alter database AdventureWorks2019
add filegroup February

alter database AdventureWorks2019
add filegroup March

alter database AdventureWorks2019
add filegroup April

alter database AdventureWorks2019
add filegroup May

alter database AdventureWorks2019
add filegroup June

alter database AdventureWorks2019
add filegroup July

alter database AdventureWorks2019
add filegroup August

alter database AdventureWorks2019
add filegroup September

alter database AdventureWorks2019
add filegroup October

alter database AdventureWorks2019
add filegroup November

alter database AdventureWorks2019
add filegroup December


select name as groups 
from sys.filegroups
where type = 'fg'


alter database AdventureWorks2019
add file
(
	name = Jan,
	filename = 'D:\Data\Jan.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [January]

alter database AdventureWorks2019
add file
(
	name = Feb,
	filename = 'D:\Data\Feb.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [February]

alter database AdventureWorks2019
add file
(
	name = Mar,
	filename = 'D:\Data\Mar.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [March]

alter database AdventureWorks2019
add file
(
	name = Apr,
	filename = 'D:\Data\Apr.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [April]

alter database AdventureWorks2019
add file
(
	name = May,
	filename = 'D:\Data\May.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [May]

alter database AdventureWorks2019
add file
(
	name = Jun,
	filename = 'D:\Data\Jun.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [June]

alter database AdventureWorks2019
add file
(
	name = Jul,
	filename = 'D:\Data\Jul.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [July]

alter database AdventureWorks2019
add file
(
	name = Aug,
	filename = 'D:\Data\Aug.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [August]

alter database AdventureWorks2019
add file
(
	name = Sep,
	filename = 'D:\Data\Sep.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [September]

alter database AdventureWorks2019
add file
(
	name = Oct,
	filename = 'D:\Data\Oct.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [October]

alter database AdventureWorks2019
add file
(
	name = Nov,
	filename = 'D:\Data\Nov.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [November]

alter database AdventureWorks2019
add file
(
	name = Dec,
	filename = 'D:\Data\Dec.ndf',
	size = 3072 kb,
	maxsize = unlimited,
	filegrowth = 1024 kb
) to filegroup [December]


select 
	name as FileName,
	physical_name as FilePath
from sys.database_files
where type_desc = 'rows'


create partition function [PartitionByMonth] (datetime)
as range right for values
('20140201', '20140301', '20140401', '20140501', '20140601', '20140701', '20140801', '20140901', '20141001',
'20141101', '20141201')


create partition scheme PartitionByMonthScheme
as partition PartitionByMonth
to
(January, February, March, April, May, June, July, August, September, October, November, December)



create table Reports
(
	ReportDate datetime primary key,
	MonthlyReport varchar(max)
) on PartitionByMonthScheme (ReportDate)


insert into Reports
select '20140105', 'ReportJanuary' union all
select '20140205', 'ReportFebruary' union all
select '20140305', 'ReportMarch' union all
select '20140405', 'ReportApril' union all
select '20140505', 'ReportMay' union all
select '20140605', 'ReportJune' union all
select '20140705', 'ReportJuly' union all
select '20140805', 'ReportAugust' union all
select '20140905', 'ReportSeptember' union all
select '20141005', 'ReportOctober' union all
select '20141105', 'ReportNovember' union all
select '20141205', 'ReportDecember' 


select 
	p.partition_number as PartitionNumber,
	f.name as PartitionFileGroup,
	p.rows as NumberOfRows
from sys.partitions p
join sys.destination_data_spaces dds on p.partition_number = dds.destination_id
join sys.filegroups f on dds.data_space_id = f.data_space_id
where object_name(object_id) = 'Reports'
