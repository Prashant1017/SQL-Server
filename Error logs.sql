--		Error Logs In SQL Server		--


select 
	LOGINPROPERTY('test', 'BadPasswordCount') as Count,
	LOGINPROPERTY('test', 'BadPasswordTime') as Time,
	LOGINPROPERTY('test', 'PasswordLastSetTime') as PwdLastSetTime



--	Query to list error log and their sizes
execute sys.sp_enumerrorlogs


execute xp_ReadErrorLog


execute xp_readerrorlog 0, 1


execute xp_readerrorlog 0, 1, N'Warning'

