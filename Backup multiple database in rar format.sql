alter procedure BackupDatabases
as
begin
	
	declare @BackupPath nvarchar(500)
	declare @DatabaseName nvarchar(200)
	declare @BackupName nvarchar(200)
	declare @PhysicalFileName nvarchar(200)
	declare @rarcommand nvarchar(400)
	declare @delete nvarchar(200)

	-- Setting Path
	set @BackupPath = 'D:\Backup\'

	-- Creating temporary table to store database name
	create table #Databases
	(
		DatabaseName nvarchar(200)
	)

	-- Inserting database name for backup
	insert into #Databases
	values
		('AdventureWorks2019'),
		('Client'),
		('DWDiagnostics'),
		('First'),
		('Test')


	declare db_cursor cursor for
		select DatabaseName
		from #Databases

	open db_cursor

	fetch next from db_cursor into @DatabaseName

	while @@fetch_status = 0
	begin
		set @BackupName = @DatabaseName + '_' + replace(convert(nvarchar(20), getdate(), 120), ':', '') + '.bak'
		set @PhysicalFileName = @BackupPath + @BackupName

		backup database @DatabaseName
		to disk = @PhysicalFileName

		fetch next from db_cursor into @DatabaseName
	end

	close db_cursor
	deallocate db_cursor

	set @rarcommand = 'C:\"Program Files"\WinRAR\WinRAR.exe a "' + @BackupPath + 'Backup.rar" "' + @BackupPath + '*.bak'
	execute xp_cmdshell @rarcommand

	set @delete = 'del "' + @BackupPath + '*.bak"'
	execute xp_cmdshell @delete

	drop table #Databases
end


execute BackupDatabases
