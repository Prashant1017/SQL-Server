--	Database Backup	--

backup database [AdventureWorks2019]
to disk = 'D:\Backup\AdventureWorks2019.bak'
with compression, format


--	Backup Database in RAR Format	--

execute xp_cmdshell 'C:\"Program Files"\WinRAR\WinRAR.exe a "D:\Backup\AdventureWorks2019.rar" "D:\Backup\AdventureWorks2019.bak"'


--	Deletes Backup Databases In BAK Format	--

execute xp_cmdshell 'del D:\Backup\AdventureWorks2019.bak'
