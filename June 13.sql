select * from HumanResources.Employee


select * from Staffs


alter table Staffs
add Age int


select * from Staffs


-- Creating a rule.
create rule CheckAge
as
@Age >= 18 and @Age <= 60

execute sp_bindrule 'CheckAge', 'Staffs.Age'


select * from Staffs


update Staffs
set Age = 17 where id = 10


select * from Staffs


-- Waitfor delay
select getdate() as First
waitfor delay '00:00:10'
select getdate() as Second
