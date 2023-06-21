--		Dirty Reads		--

create table BankDetail
(
	ID int primary key identity (1, 1),
	AccountNumber varchar(40),
	ClientName varchar(100),
	Balance money
)


insert into BankDetail
values
('394A76', 'James Anderson', '78')


select * from BankDetail

-- Query 1
begin transaction
	update BankDetail
	set Balance = Balance - 45
	where AccountNumber = '394A76'
	waitfor delay '00:00:10'
rollback transaction

select * from BankDetail


-- Query 3
begin transaction
	update BankDetail
	set ClientName = 'Stuart Broad'
	where AccountNumber = '394A76'
	waitfor delay '00:00:40'
rollback transaction


use AdventureWorks2019

checkpoint 
dbcc dropcleanbuffers
begin transaction
	select WorkOrderID, StartDate, EndDate
	from Production.WorkOrder
commit transaction


use Test

select * from BankDetail


begin transaction
	update BankDetail
	set ClientName = 'Steve Smith'
	where AccountNumber = '394A76'

	
begin transaction
	select * from BankDetail
	where AccountNumber = '394A76'
