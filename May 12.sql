create table Players
(
	PlayerID int primary key,
	Name varchar(50),
	Age int,
	Country varchar(50),
	BattingStyle varchar(20),
	BowlingStyle varchar(20),
	RunsScored numeric(10),
	WicketsTaken numeric (5)
)


drop table Players


create table Player_audit
(
	Operation varchar(20),
	PlayerID int,
	Name varchar(50),
	Age int,
	Country varchar(50),
	BattingStyle varchar(20),
	BowlingStyle varchar(20),
	RunsScored numeric(10),
	WicketsTaken numeric (5),
	ModifiedDate datetime
)


drop table Player_audit


create trigger Player_insert_delete
on Players
for insert, update, delete
as
begin
	if exists(select * from inserted)
	begin
		insert into Player_audit (Operation, PlayerID, Name, Age, Country, BattingStyle, BowlingStyle, RunsScored, WicketsTaken, ModifiedDate)
		select 'Insert/Update', i.PlayerID, i.Name, i.Age, i.Country, i.BattingStyle, i.BowlingStyle, i.RunsScored, i.WicketsTaken, getdate()
		from inserted as i
	end

	if exists (select * from deleted)
	begin
		insert into Player_audit (Operation, PlayerID, Name, Age, Country, BattingStyle, BowlingStyle, RunsScored, WicketsTaken, ModifiedDate)
		select 'Delete', d.PlayerID, d.Name, d.Age, d.Country, d.BattingStyle, d.BowlingStyle, d.RunsScored, d.WicketsTaken, getdate()
		from deleted as d
	end
end


create table PlayerBackup
(
	PlayerID int,
	Name varchar(50),
	Age int,
	Country varchar(50),
	BattingStyle varchar(20),
	BowlingStyle varchar(20),
	RunsScored numeric(10),
	WicketsTaken numeric (5)
)

drop table PlayerBackup


create trigger Player_backup_trigger
on Players
for delete
as
begin
	insert into PlayerBackup (PlayerID, Name, Age, Country, BattingStyle, BowlingStyle, RunsScored, WicketsTaken)
	select d.PlayerID, d.Name, d.Age, d.Country, d.BattingStyle, d.BowlingStyle, d.RunsScored, d.WicketsTaken
	from deleted as d
end


select * from Players


insert into Players
values
    (61, 'Hashim Amla', 40, 'South Africa', 'Right-handed', 'Right-arm off break', 12000, 5),
	(62, 'Alaistar Cook', 38, 'England', 'Left-handed', 'Right-arm medium', 14000, 1),
	(63, 'Rahul Dravid', 46, 'India', 'Right-handed', null, 14500, 0),
	(64, 'Jacques Kallis', 45, 'South Africa', 'Right-handed', 'Right-arm mediumfast', 14500, 450),
	(65, 'Ben Stokes', 30, 'England', 'Left-handed', 'Right-arm fastmedium', 8300, 175),
	(66, 'Brad Hodge', 47, 'Australia', 'Right-handed', 'Right-arm off break', 7600, 89),
	(67, 'Adam Gilchrist', 49, 'Australia', 'Left-handed', 'Right-arm off break', 10986, 1),
	(68, 'Daniel Vettori', 50, 'New Zealand', 'Left-handed', 'Left-arm orthodox', 3400, 345),
	(69, 'Dale Steyn', 38, 'South Africa', 'Right-handed', 'Right-arm fast', 2500, 480),
	(70, 'Shoaib Akhtar', 45, 'Pakistan', 'Right-handed', 'Right-arm fast', 2345, 383),
	(71, 'James Anderson', 37, 'England', 'Left-handed', 'Right-arm fastmedium', 3000, 620)




select * from Players


select * from Player_audit


select * from PlayerBackup


select Country, count(*) as Players from Players group by Country


select * from Players order by RunsScored desc


select * from Players order by WicketsTaken desc


delete from Players
where PlayerID = 33


select * from Players order by Name


update Players
set Name= 'Brian Lara', Age = 50, Country = 'West Indies', RunsScored = 14000
where PlayerID = 39


select * from Players order by RunsScored desc


select BattingStyle, count(*) as Players from Players group by BattingStyle


select Country, count(*) as TotalPlayers from Players group by Country order by TotalPlayers desc


select * from Players where Country = 'West Indies'


select top 5 * from Players order by WicketsTaken desc


update Players
set BattingStyle = 'Right-handed'
where PlayerID = 47


select BowlingStyle, count(*) as Players from Players group by BowlingStyle


select * from Players where BowlingStyle <> 'Right-arm medium' and BowlingStyle <> 'Right-arm off break'


select * from Players where BowlingStyle = 'Right-arm medium' or BowlingStyle = 'Right-arm off break'


select * from Players where WicketsTaken = 0


update Players 
set BowlingStyle = null
where WicketsTaken = 0


select * from Players


select * from Players where BowlingStyle is null


select * from Player_audit


select * from PlayerBackup


select top 5 * from Players where BattingStyle = 'Right-handed' order by RunsScored desc


select * from Players where Country = 'South Africa'


select Age, count(*) as Players from Players group by Age order by Age desc


select * from Players where Age = 55


select * from Players where RunsScored > 5000


select * from Players where Country = 'Australia' and WicketsTaken > 50


select * from Players where Age between 25 and 30


select Name, RunsScored from Players order by RunsScored desc


select Country, cast(avg(RunsScored) as int) as Runs from Players group by Country order by Runs desc


select * from Players where Country = 'Afghanistan'


select * from Players where RunsScored > 5000 and WicketsTaken > 100


select Name, RunsScored, WicketsTaken from Players order by RunsScored desc


select Country, avg(Age) as AverageAge from Players group by Country order by AverageAge


select * from Players where Age < 30 and RunsScored > 5000


select count(*) as TotalPlayers, sum(RunsScored) as TotalRuns, sum(WicketsTaken) as TotalWickets from Players


select * from Players order by WicketsTaken


select * from Players where Country = 'Australia' order by RunsScored desc


select * from Players where PlayerID > 60


select Country, count(*) as NumberOfPlayers from Players group by Country order by NumberOfPlayers desc


select * from Players where Country = 'South Africa'


select * from Players order by RunsScored desc


select * from Players where RunsScored > 10000 and WicketsTaken > 300
