--	Transactions And Error Handling	--

begin try
	select 1/0 as error
end try

begin catch
	select 
		error_number() as errornumber,
		error_state() as errorstate,
		error_severity() as errorseverity,
		error_procedure() as errorprocedure,
		error_line() as errorline,
		error_message() as errormessage
end catch
