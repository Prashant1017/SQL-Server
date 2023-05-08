select * from Marketing


select * from SalesPerson


select FullName, count(*) as NumberOfSales from SalesPerson group by FullName order by FullName


select JobTitle, count(*) as TotalEmployee from HumanResources.vEmployee group by JobTitle


select * from HumanResources.vEmployee where JobTitle = 'Tool Designer'


select distinct StateProvinceName from HumanResources.vEmployee


select * from HumanResources.vEmployee where StateProvinceName = 'England'


select * from HumanResources.vEmployee where Suffix is not null


select distinct JobTitle from HumanResources.vEmployee


select PhoneNumberType, count(*) as TotalStaff from HumanResources.vEmployee group by PhoneNumberType


select distinct City from HumanResources.vEmployee


select City, count(*) as NumberOfPeople from HumanResources.vEmployee group by City order by NumberOfPeople desc


select * from HumanResources.vEmployeeDepartment 


select FirstName, MiddleName, LastName, JobTitle, Department, datediff(year, StartDate, getdate()) as WorkedYears 
from HumanResources.vEmployeeDepartment order by WorkedYears desc


select * from Sales.vIndividualCustomer


select concat_ws(' ', FirstName, MiddleName, LastName) as FullName from Sales.vIndividualCustomer


select * from Sales.vIndividualCustomer where FirstName like 'P%' and CountryRegionName = 'United States'


select City, count(*) as NumberOfCustomers from Sales.vIndividualCustomer group by City order by NumberOfCustomers desc


select * from Sales.vIndividualCustomer where City = 'Bellingham'


select FirstName, LastName, EmailAddress from Sales.vIndividualCustomer


select PhoneNumber, PhoneNumberType from Sales.vIndividualCustomer where FirstName = 'Aaron'


select distinct City from Sales.vIndividualCustomer


select * from Sales.vIndividualCustomer order by LastName


select StateProvinceName, count(*) as NumberOfRecords from Sales.vIndividualCustomer group by StateProvinceName order by StateProvinceName


select * from Sales.vIndividualCustomer where CountryRegionName = 'United States' and StateProvinceName = 'California'


select * from Sales.vIndividualCustomer where EmailAddress is not null


select * from Sales.vIndividualCustomer where FirstName like 'A%' and LastName like '%son'


select * from Sales.vIndividualCustomer where AddressLine1 like '%street%'


select * from Sales.vIndividualCustomer where PhoneNumberType = 'Cell'


select * from Sales.vIndividualCustomer where not FirstName = 'David'


select * from Sales.vIndividualCustomer where LastName like 'S%' and EmailPromotion = 0


select * from Sales.vIndividualCustomer where StateProvinceName = 'California' or StateProvinceName = 'England'


select * from Sales.vIndividualCustomer where PhoneNumber like '439%'


select * from Sales.vIndividualCustomer where AddressLine1 like '%avenue%'



--	Trigger Functions


create table Employee
(
	id int primary key,
	Name VARCHAR(45),  
	Salary INT,  
	Gender VARCHAR(12),  
	DepartmentId INT  
)  


INSERT INTO Employee 
VALUES 
(1,'Steffan', 82000, 'Male', 3),  
(2,'Amelie', 52000, 'Female', 2),  
(3,'Antonio', 25000, 'male', 1),  
(4,'Marco', 47000, 'Male', 2),  
(5,'Eliana', 46000, 'Female', 3)


select * from Employee


CREATE TABLE Employee_Audit_Test  
(    
	Id int IDENTITY,   
	Audit_Action text   
) 



--	Creating A Trigger For Insert


alter trigger InsertEmployee on Employee for insert
as
begin
	declare @Id int
	select @Id = Id from inserted
	insert into	Employee_Audit_Test
	values
	('New Employee with ID = ' + cast(@Id as varchar(10)) + ' ' + 'is added at ' + cast(getdate() as varchar(20)))
end


insert into Employee
values
(6, 'Parker', 60000, 'Male', 3)


select * from Employee_Audit_Test



--	Creating A Trigger For Delete


create trigger DeleteEmployee on Employee for delete
as
begin
	declare @Id int
	select @Id = Id from deleted
	insert into Employee_Audit_Test
	values
	('An employee with ID = ' + cast(@Id as varchar(10)) + ' ' + 'is deleted at' + ' ' + cast(getdate() as varchar(20)))
end


delete from Employee where id = 2


select * from Employee_Audit_Test


select * from Employee


insert into Employee
values
(7, 'Tika', 25000, 'Male', 1),
(8, 'Bibash', 10000, 'Male', 2),
(9, 'Sita', 15000, 'Female', 3)


select * from Employee_Audit_Test


delete from Employee where id = 8


select * from Employee_Audit_Test


drop trigger InsertEmployee


create table PersonDetails
(
	id int primary key,
	Name varchar(50),
	Gender varchar(1),
	Address varchar(50)
)


insert into PersonDetails
values
(1, 'Tika', 'M', 'Surkhet')


select * from PersonDetails


create table PersonDetails_audit
(
	id int identity,
	Audit_Action text
)


--	Trigger For Insert

create trigger InsertPersonDetails on PersonDetails for insert
as
begin
	declare @id int
	select @id = id from inserted
	insert into PersonDetails_audit
	values
	('New detail with id = ' + cast(@id as varchar(10)) + ' ' + 'is added at' + ' ' + cast(getdate() as varchar(20)))
end


select * from PersonDetails_audit


insert into PersonDetails
values
(2, 'Bibash', 'M', 'Rolpa')


select * from PersonDetails_audit



--	Creating Trigger For Delete

create trigger DeletePersonDetails on PersonDetails for delete
as 
begin
	declare @id int
	select @id = id from deleted
	insert into PersonDetails_audit
	values
	('Detail with id =' + ' ' + cast(@id as varchar(10)) + ' ' + 'is deleted at' + ' ' + cast(getdate() as varchar(20)))
end


select * from PersonDetails


insert into PersonDetails
values
(3, 'Manisha', 'F', 'Sindupalchowk'),
(4, 'Ural', 'M', 'Thaiba'),
(5, 'Yashoda', 'F', 'Ekantakuna')


delete from PersonDetails where id = 1


select * from PersonDetails_audit


select * from DatabaseLog


insert into PersonDetails
values
(6, 'Alisha', 'F', 'Imadol'),
(7, 'Laxman', 'M', 'Maharjgunj')


select * from PersonDetails


insert into PersonDetails
values
(1, 'Rita', 'F', 'Nakhipot')


select * from PersonDetails


select * from PersonDetails_audit


delete from PersonDetails where id = 1


select * from PersonDetails


select * from PersonDetails_audit


drop trigger DeleteEmployee


select * from Employee


create table dml_audit_table
(
	OperationType varchar(20),
	id int,
	Name varchar(50),
	Salary int,  
	Gender varchar(12),  
	DepartmentId int,
	Timestamp date
)

drop table dml_audit_table



CREATE TRIGGER dml_trigger
ON Employee
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Trigger logic goes here
    -- You can access the inserted and deleted tables to reference the affected rows
    
    -- Example: Log the DML event to an audit table
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- INSERT or UPDATE operation
        INSERT INTO dml_audit_table (OperationType, id, Name, Salary, Gender, DepartmentId, Timestamp)
        SELECT 'INSERT/UPDATE', i.id, i.Name, i.Salary, i.Gender, i.DepartmentId, GETDATE()
        FROM inserted AS i
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        -- DELETE operation
        INSERT INTO dml_audit_table (OperationType, id, Name, Salary, Gender, DepartmentId, Timestamp)
        SELECT 'DELETE', d.id, d.Name, d.Salary, d.Gender, d.DepartmentId, GETDATE()
        FROM deleted AS d
    END
END


select * from Employee

select * from dml_audit_table


insert into Employee
values
(5, 'Jamie', 120000, 'Male', 7),



delete from Employee where id = 5


select * from PersonDetails_audit


select * from Employee


select * from dml_audit_table


delete from Employee where id = 14


create table Players
(
	id int primary key,
	PlayerName varchar(50),
	ClubName varchar(50),
	Country varchar(50),
	Position varchar(50)
)


insert into Players
values
(1, 'Robert Lewandowski', 'Barcelona', 'Poland', 'Forward')


select * from Players


create table PlayersAudit
(
	Operation varchar(50),
	id int,
	PlayerName varchar(50),
	ClubName varchar(50),
	Country varchar(50),
	Position varchar(50),
	Timestamp datetime
)


create trigger InsertPlayers
on Players
for insert, update, delete
as
begin
	if exists (select * from inserted)
	begin
		insert into PlayersAudit (Operation, id, PlayerName, ClubName, Country, Position, Timestamp)
		select 'Insert/Update', i.id, i.PlayerName, i.ClubName, i.Country, i.Position, getdate()
		from inserted as i
	end

	if exists (select * from deleted)
	begin
		insert into PlayersAudit (Operation, id, PLayerName, ClubName, Country, Position, Timestamp)
		select 'Delete', d.id, d.PlayerName, d.ClubName, d.Country, d.Position, getdate()
		from deleted as d
	end
end


insert into Players
values
(1, 'Alisson Becker', 'Liverpool', 'Brazil', 'Goalkeeper'),
(2, 'Fikayo Tomori', 'AC Milan', 'England', 'Defender'),
(3, 'Mathijs De Ligt', 'Bayern Munich', 'Netherlands', 'Defender'),
(4, 'Lucas Hernandez', 'Bayern Munich', 'France', 'Defender'),
(5, 'Kingsley Coman', 'Bayern Munich', 'France', 'Midfielder'),
(6, 'Sergej Milinkovic Savic', 'Lazio', 'Serbia', 'Midfielder'),
(7, 'Joshua Kimmich', 'Bayern Munich', 'Germany', 'Midfielder'),
(8, 'Theo Hernandez', 'AC Milan', 'France', 'Midfielder'),
(9, 'Jamal Musiala', 'Bayern Munich', 'Germany', 'Forward'),
(10, 'Rafael Leao', 'AC Milan', 'Portugal', 'Forward'),
(11, 'Victor Osimhen', 'Napoli', 'Nigeria', 'Forward')


select * from Players


select * from PlayersAudit



--	Triggers If Someone Tries To Delete The Table


create trigger Playerstabledeletion
on Players
instead of delete
as
begin
	raiserror('Deletion of table is not allowed.', 16, 1)
	rollback transaction
	return
end


delete from Players  


select * from PlayersAudit



--	Triggers If Column Is Added To The Table


create trigger InsertDisabled
on HumanResources.Department
instead of insert
as
begin
	raiserror('Adding Details Is Prohibited!!!', 16, 1)
	rollback transaction
	print 'Adding details to this table is not required.'
	return
end


insert into HumanResources.Department(DepartmentID, Name, GroupName, ModifiedDate)
values
(20, 'Designing', 'Designers', getdate())


set identity_insert HumanResources.Department on


select * from PersonDetails_audit


select * from PlayersAudit


select * from dml_audit_table


delete from Players


insert into HumanResources.Department(DepartmentID, Name, GroupName, ModifiedDate)
values
(23, 'Design', 'Designers', getdate())


create table TelNumber
(
	Number1 numeric(10),
	Number2 numeric(10)
)

drop table TelNumber


alter trigger Prevent_Duplicate_Entries
on TelNumber
for insert
as
begin
	if exists
	(
		select Number1, Number2 from TelNumber group by Number1, Number2 having count(*) > 1
	)
	begin
		raiserror('!!!Duplicate Entries Are Not Allowed!!!', 16, 1)
		rollback transaction
		print 'Please write different numbers.'
		return
	end
end


insert into TelNumber
values
(9818606682, 9843473156)


select * from TelNumber


insert into TelNumber
values
(9841487666, 9841487666)


insert into TelNumber
values
(9898989898, 9898989898)


--	Triggers If Numbers Are Duplicated
insert into TelNumber
values
(9999999999, 9999999999)


-- Triggers When Insert Or Delete Is Used
select * from Employee_Audit_Test


-- Triggers When Insert, Update Or Delete Is Used
select * from PersonDetails_audit


-- Triggers When Insert, Update Or Delete Is Used
select * from dml_audit_table


-- Triggers When Insert, Update Or Delete Is Used
select * from PlayersAudit


--	Triggers When Someone Tries To Delete Data From The Table
delete from Players  


--	Triggers When Someone Tries To Add Data To The Table
insert into HumanResources.Department(DepartmentID, Name, GroupName, ModifiedDate)
values
(20, 'Designing', 'Designers', getdate())



--	Triggers If Someone Inserts In Certain Time Period


create trigger CertainTimePeriod
on Players
instead of insert
as
begin
	declare @currenttime time = convert(time, getdate())

	if @currenttime >= '17:00:00' and @currenttime <= '20:00:00'
	begin
		raiserror('!!!Inserts are not allowed in this time period!!!', 16, 1)
		rollback transaction
		print '--	Insert after 20:00:00 or before 17:00:00	--'
		return
	end
end


insert into Players
values
(12, 'Patrick Bamford', 'Leeds United', 'England', 'Forward')
