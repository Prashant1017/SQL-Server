use Test


create table Demo
(
	id int identity (1,1),
	number float,
	timestamp datetime
)


insert into Demo (number, timestamp)
select rand(), getdate()


select * from Demo


exec sp_stop_job @job_name = N'Demo_Job'


-- Stops a job   
USE msdb ;  
GO  

EXEC dbo.sp_stop_job  
    N'Demo_Job' ;  
GO
