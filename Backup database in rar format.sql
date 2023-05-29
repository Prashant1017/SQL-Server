--	Database Backup	--

backup database [AdventureWorks2019]
to disk = 'D:\Backup\AdventureWorks2019.bak'
with compression, format


--	Backup Database in RAR Format	--

execute xp_cmdshell 'C:\"Program Files"\WinRAR\WinRAR.exe a "D:\Backup\AdventureWorks2019.rar" "D:\Backup\AdventureWorks2019.bak"'


--	Deletes Backup Databases In BAK Format	--

execute xp_cmdshell 'del D:\Backup\AdventureWorks2019.bak'



--	Backup all non-system databases


declare @path varchar(500)
declare @name varchar(500)
declare @filename varchar(200)
declare @time datetime
declare @year varchar(4)
declare @month varchar(2)
declare @day varchar(2)
declare @hour varchar(2)
declare @minute varchar(2)
declare @second varchar(2)


set @path = 'D:\Backup\'

select @time = getdate()
select @year = (select convert(varchar(4), datepart(yy, @time)))
select @month = (select convert(varchar(2), format(datepart(mm, @time), '00')))
select @day = (select convert(varchar(2), format(datepart(dd, @time), '00')))
select @hour = (select convert(varchar(2), format(datepart(hh, @time), '00')))
select @minute = (select convert(varchar(2), format(datepart(mi, @time), '00')))
select @second = (select convert(varchar(2), format(datepart(ss, @time), '00')))


declare db_cursor cursor for
select name
from master.dbo.sysdatabases
where name not in ('master', 'model', 'msdb', 'tempdb')


open db_cursor
fetch next from db_cursor into @name

while @@fetch_status = 0
begin
	set @filename = @path + @name + '_' + @year + @month + @day + @hour + @minute + @second + '.bak'
	backup database @name to disk = @filename

	--execute xp_cmdshell 'C:\"Program Files"\WinRAR\WinRAR.exe a "@filename.rar" "@filename"'

	--execute xp_cmdshell 'del @filename'

	fetch next from db_cursor into @name
end
close db_cursor
deallocate db_cursor
