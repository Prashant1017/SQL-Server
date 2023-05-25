/*

--		Restoring Database		--

use [master]
go

restore database [databasename]
from disk =  'D:\Backup\Backup.bak'
with replace, recovery

*/