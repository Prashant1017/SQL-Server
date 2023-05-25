execute xp_cmdshell 'C:\"Program Files"\WinRAR\WinRAR.exe a -ep1 -r "D:\Backup\DWDiagnostics.rar" "D:\Backup\DWDiagnostics.bak"'


backup database [AdventureWorks2019]
to disk = 'D:\Backup\AdventureWorks2019.bak'
with compression, format

execute xp_cmdshell 'C:\"Program Files"\WinRAR\WinRAR.exe a "D:\Backup\AdventureWorks2019.rar" "D:\Backup\AdventureWorks2019.bak"'
