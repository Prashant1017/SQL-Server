--		Dirty Reads		--

-- Query 2
set transaction isolation level read uncommitted
begin transaction
	select * from BankDetail
	where AccountNumber = '394A76'
commit transaction


-- Query 4
declare @TimeDiff as int
declare @BegTime as datetime
declare @EndTime as datetime
begin transaction
	set @BegTime = getdate()
	select ClientName from BankDetail
	set @EndTime = getdate()
	set @TimeDiff = datediff(second, @EndTime, @BegTime)
	select @TimeDiff as TimeTaken
commit transaction


use AdventureWorks2019

checkpoint 
dbcc dropcleanbuffers
set transaction isolation level read uncommitted
begin transaction
	select WorkOrderID, StartDate, EndDate
	from Production.WorkOrder
commit transaction


use Test

begin transaction
	select * from BankDetail
