begin transaction
	select * from Person.Address with (holdlock)
	where AddressID = 2

	select resource_type, request_mode, resource_description
	from sys.dm_tran_locks
	where resource_type <> 'DATABASE'
rollback


select * from sys.dm_tran_locks


select * from Person.Address


update Person.Address
set AddressLine2 = null
where AddressID = 2


sp_lock


sp_who2 'active'
