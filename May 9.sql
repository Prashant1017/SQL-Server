select * from Employee


create table EmployeeBackup
(
	id int,
	Name varchar(50),
	Salary numeric(10),
	Gender varchar(10),
	DepartmentId int
)


create trigger BackupTable
on Employee
for delete
as
begin
	insert into EmployeeBackup (id, Name, Salary, Gender, DepartmentId)
	select d.id, d.Name, d.Salary, d.Gender, d.DepartmentId
	from deleted as d
end


delete from Employee where id = 5


select * from Employee


select * from EmployeeBackup


select * from Employee_Audit_Test


select * from Players


delete from Players where id = 2


insert into Players
values
(12, 'David Silva', 'Real Sociedad', 'Spain', 'Midfielder')


select * from PlayersAudit


insert into Employee 
values
(15, 'Haris', 123456, 'Male', 2)


select * from Employee


delete from Employee where id = 15


select * from EmployeeBackup


select * from ProductionManager


create table Cricket
(
	id int primary key,
	Name varchar(50),
	Country varchar(50),
	JerseyNo int
)


create table CricketBackup
(
	id int,
	Name varchar(50),
	Country varchar(50),
	JerseyNo int
)


create table Cricket_audit
(
	OperationName varchar(20),
	id int,
	Name varchar(50),
	Country varchar(50),
	JerseyNo int,
	ModifiedTime datetime
)


create trigger CricketUpdate
on Cricket
for insert, delete, update
as
begin
	if exists (select * from inserted)
	begin
		insert into Cricket_audit (OperationName, id, Name, Country, JerseyNo, ModifiedTime)
		select 'Inserted/Updated', i.id, i.Name, i.Country, i.JerseyNo, getdate()
		from inserted as i
	end

	if exists (select * from deleted)
	begin
		insert into Cricket_audit (OperationName, id, Name, Country, JerseyNo, ModifiedTime)
		select 'Deleted', d.id, d.Name, d.Country, d.JerseyNo, getdate()
		from deleted as d
	end
end


create trigger BackupData_Cricket
on Cricket
for delete
as
begin
	insert into CricketBackup (id, Name, Country, JerseyNo)
	select d.id, d.Name, d.Country, d.JerseyNo
	from deleted as d
end


insert into Cricket
values
(1, 'Joe Root', 'England', 66),
(2, 'Jos Buttler', 'England', 63)


select * from Cricket_audit


delete from Cricket where id = 2


select * from CricketBackup


insert into Cricket
values
(9, 'Sachin Tendulkar', 'India', 10),
(10, 'Ricky Ponting', 'Australia', 14),
(11, 'Jacques Kallis', 'South Africa', 3),
(12, 'Brian Lara', 'West Indies', 9),
(13, 'Virat Kohli', 'India', 18),
(14, 'Kane Williamson', 'New Zealand', 22),
(15, 'Steve Smith', 'Australia', 49)


select * from Cricket_audit


select * from Cricket


INSERT INTO Cricket
VALUES
(8, 'Waqar Younis', 'Pakistan', 1)


select * from Cricket_audit


select * from Cricket


select Country, count(*) as NumberOfPlayers from Cricket group by Country


select * from Cricket where Country = 'South Africa'


delete from Cricket where id = 8


select * from CricketBackup


select * from Cricket_audit


create table FootballPlayers
(
	id int primary key,
	Name varchar(50),
	Country varchar(50),
	Club varchar(50),
	JerseyNumber int,
	Position varchar(20)
)


create table FootballPlayers_audit
(
	OperationName varchar(20),
	id int,
	Name varchar(50),
	Country varchar(50),
	Club varchar(50),
	JerseyNumber int,
	Position varchar(20),
	ModifiedTime datetime
)


create table FootballPlayers_backup
(
	id int,
	Name varchar(50),
	Country varchar(50),
	Club varchar(50),
	JerseyNumber int,
	Position varchar(20)
)


create trigger FootballPlayersDetailsUpdate
on FootballPlayers
for insert, update, delete
as
begin
	if exists (select * from inserted)
	begin
		insert into FootballPlayers_audit (OperationName, id, Name, Country, Club, JerseyNumber, Position, ModifiedTime)
		select 'Inserted/Updated', i.id, i.Name, i.Country, i.Club, i.JerseyNumber, i.Position, getdate()
		from inserted as i
	end

	if exists (select * from deleted)
	begin
		insert into FootballPlayers_audit (OperationName, id, Name, Country, Club, JerseyNumber, Position, ModifiedTime)
		select 'Deleted', d.id, d.Name, d.Country, d.Club, d.JerseyNumber, d.Position, getdate()
		from deleted as d
	end
end


create trigger FootballPlayersBackup
on FootballPlayers
for delete
as 
begin
	insert into FootballPlayers_backup (id, Name, Country, Club, JerseyNumber, Position)
	select d.id, d.Name, d.Country, d.Club, d.JerseyNumber, d.Position
	from deleted as d
end


INSERT INTO FootballPlayers (id, Name, Country, Club, JerseyNumber, Position)
VALUES



select * from FootballPlayers


select * from FootballPlayers_audit


select Club, count(*) as NumberOfPlayers from FootballPlayers group by Club


select * from FootballPlayers where Club = 'Bayern Munich'


select * from FootballPlayers where Position = 'Forward'


delete from FootballPlayers where id = 5


select * from FootballPlayers_backup


insert into FootballPlayers
values
(5, 'Robert Lewandowski', 'Poland', 'Barcelona', 9, 'Forward')


update FootballPlayers
set JerseyNumber = 8 
where id = 15


select * from FootballPlayers_audit


select * from FootballPlayers_backup


select * from FootballPlayers


select * from FootballPlayers where Club = 'Liverpool'


delete from FootballPlayers where id = 29


select Country, count(*) as NumberOfPlayers from FootballPlayers group by Country


select * from FootballPlayers where Country = 'Brazil'


update FootballPlayers
set Club = 'Arsenal', JerseyNumber = 20
where id = 40


select * from FootballPlayers


select * from FootballPlayers where JerseyNumber < 10


select * from FootballPlayers where Name like 'A%'


select * from FootballPlayers where Position = 'Forward' and Country = 'Brazil'


select * from FootballPlayers order by JerseyNumber desc


select * from FootballPlayers where JerseyNumber = 5 or Position = 'Midfielder'


select top 5 Club, count(*) as PlayerCount from FootballPlayers group by Club order by PlayerCount desc 


select avg(JerseyNumber) as Average from FootballPlayers


select * from FootballPlayers where Club in (select Club from FootballPlayers where Country = 'England')


select Position, max(JerseyNumber) as HighestNumber from FootballPlayers group by Position


select * from FootballPlayers where JerseyNumber % 2 != 0


select * from FootballPlayers where len(Name) = (select max(len(Name)) from FootballPlayers)


select * from FootballPlayers where Club like'Manchester%'


select JerseyNumber, Position, count(*) as Number from FootballPlayers group by JerseyNumber, Position having count(*) > 1


select * from FootballPlayers where JerseyNumber = 17 and Position = 'Forward'


select * from FootballPlayers where Position = 'Goalkeeper'


delete from FootballPlayers 
where id = 22


select * from FootballPlayers_backup


select top 5 * from FootballPlayers order by JerseyNumber desc


select * from FootballPlayers where Position = 'Midfielder' and Club = 'Chelsea'


select Position, Club, count(*) as Number from FootballPlayers group by Position, Club having count(*) > 1


select * from FootballPlayers where Name < 'Hakim Ziyech'


insert into FootballPlayers
values
(41, 'Robert Lewandowski', 'Poland', 'Bayern Munich', 9, 'Forward'),
(42, 'Sadio Mane', 'Senegal', 'Liverpool', 10, 'Forward')


delete from FootballPlayers 
where id = 42 


select * from FootballPlayers


select * from Cricket


select f.Name, f.JerseyNumber, c.Name, c.JerseyNo 
from FootballPlayers f
inner join Cricket c
on f.JerseyNumber = c.JerseyNo


select * from Cricket_audit


select * from Cricket 


update Cricket
set Name = 'Michael Hussey', JerseyNo = 48
where id = 35


select * from CricketBackup


select top 5 Country, count(*) as PlayersCount from FootballPlayers group by Country order by PlayersCount desc


select * from FootballPlayers where Country = 'France'


select Country, Club, count(*) as Number from FootballPlayers group by Country, Club having count(*) > 1
