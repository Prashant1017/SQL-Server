create table Savepoint
(
	id int,
	value numeric
)


begin transaction
	insert into Savepoint
	values
	(1, '10')
	save transaction FirstInsert	-- This will create a savepoint after the first insert

	insert into Savepoint
	values
	(2, '20')

	rollback transaction FirstInsert	-- This will rollback to the save point right after the first insert was done

commit	-- This will commit the transaction leaving just the first insert

select * from Savepoint
