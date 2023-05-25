alter procedure sp_generate_compressed_backup
@DBName varchar(200),
@Backup_Location varchar(max),
@SizeOfWinRARFile int,
@CompressedBackupFileLocation varchar(max)
as
begin
	declare @BackupSQL nvarchar(max)
	declare @Backup_Name varchar(max)
	declare @WinRarCommand varchar(5000)

	set @Backup_Name = @DBName + '_' + replace(convert(date, getdate()), '-', '_')
	set @BackupSQL = 'Backup database [' + @DBName + '] to disk = ''' + @Backup_Location + '\' + @Backup_Name + '.bak''
	with compression, copy_only'
	set @WinRarCommand = '"rar.exe" a -v' + convert(varchar, @SizeOfWinRARFile) + 'M ' + @CompressedBackupFileLocation + 
	'\' + @Backup_Name + '.rar' + @Backup_Location + '\' + @Backup_Name + '.bak'
	
	execute sp_executesql @BackupSQL
	execute xp_cmdshell @Winrarcommand
end


execute sp_generate_compressed_backup 'DWDiagnostics', 'D:\Backup', 10, 'D:\Backup'


execute xp_cmdshell 'D:\Backup\winrar-x64-621.exe a -ep1 -r "D:\Backup\DWDiagnostics.rar" "D:\Backup\DWDiagnostics.bak"'
