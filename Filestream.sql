--		FileStream In SQL Server		--


create table Photos
(
	ID uniqueidentifier rowguidcol not null unique,
	Name varchar(20),
	Images varbinary(max) filestream null
)


--	Declare a variable to store image data
declare @tImage as varbinary(max)


--	Load image data
select @tImage = cast(bulkcolumn as varbinary(max)) from openrowset(bulk 'D:\sql.png', single_blob) as x


insert into Photos
select newid(), 'Image-1', @tImage


select * from Photos


select * from sys.data_spaces where type = 'FD'
select * from sys.database_files where type = 2
select * from sys.configurations where name = 'filestream access level'


create table Files
(
	ID uniqueidentifier rowguidcol not null unique,
	Name varchar(20),
	Files varbinary(max) filestream null
)


declare @file as varbinary(max)

select @file = cast(bulkcolumn as varbinary(max)) from openrowset(bulk 'D:\new.txt', single_blob) as x

insert into Files
select newid(), 'File-1', @file


select * from Files

select * from Photos
