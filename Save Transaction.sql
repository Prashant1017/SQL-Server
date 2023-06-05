--		Save Transaction Example		--


create table TestTable
(
	ID int,
	Number numeric
)



-- Nothing has happened yet so value will be 0
select @@TRANCOUNT as '1 - Trancount before starting the first transaction (its value is 0)'

begin transaction	-- trans 1
	select @@TRANCOUNT as '2 - Trancount after starting the first transaction (value is incremented by 1)'

	insert into TestTable
	values
	(1, '10')
	save transaction FirstInsert

	begin transaction	--trans 2
		select @@TRANCOUNT as '3 - Trancount after starting the second transaction (value is again incremented by 1)'

		insert into TestTable
		values
		(2, '20')

		rollback transaction FirstInsert
		select @@TRANCOUNT as '4 - Trancount after rolling back to the savepoint (value is not changed)'

		begin transaction	--trans 3
			select @@TRANCOUNT as '5 - Trancount after starting the third transaction (value is incremented by 1)'

			insert into TestTable
			values
			(3, '30')

		commit	--trans3
		select @@TRANCOUNT as '6 - Trancount after committing third transaction (value is decremented by 1)'

		-- only id 1 and 3 remain
		select * from TestTable

	commit	--trans 2
	select @@TRANCOUNT as '7 - Trancount after committing second transaction (value is set to 1)'

rollback	--trans 1
select @@TRANCOUNT as '8 - Trancount after rolling back first transaction (value is set to 0)'

-- no data remains after rollback
select * from TestTable
