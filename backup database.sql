select * from pdw_diagnostics_sessions


sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'xp_cmdshell', 1;
GO
RECONFIGURE;
GO


backup database [DWDiagnostics]
to disk = 'D:\Backup\DWDiagnostics.bak'
with compression, format

execute xp_cmdshell 'D:\Backup\winrar-x64-621.exe a -r "D:\Backup\DWDiagnostics.rar" "D:\Backup\DWDiagnostics.bak"'


create procedure sp_generate_compressed_backup
@DBName varchar(200),
@Backup_Location varchar(max),
@SizeOfWinRARFile int,
@CompressedBackupFileLocation varchar(max)
as
begin
	declare @BackupSQL nvarchar(max)
	declare @BBackup_Name varchar(max)
	declare @WinRarCommand varchar(5000)

	set @Backup_Name = @DBName + '_' + replace(convert(date, getdate()), '-', '_')
	set @BackupSQL = 'Backup database [' + @DBName + '] to disk = ''' + @Backup_Location + '\' + @Backup_Name + '.bak''
	with compression, copy_only'
	set @WinRarCommand = '"rar.exe" a -v' + convert(varchar, @SizeOfWinRARFile) + 'M ' + @CompressedBackupFileLocation + 
	'\' + @Backup_Name + '.rar' + @Backup_Location + '\' + @Backup_Name + '.bak'
	
	execute sp_executesql @BackupSQL
	execute xp_cmdshell @Winrarcommand
end
