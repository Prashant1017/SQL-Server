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
    (36, 'Kumar Sangakkara', 44, 'Sri Lanka', 'Left-handed', 'Right-arm off break', 14234, 93),
    (37, 'Chris Gayle', 42, 'West Indies', 'Left-handed', 'Right-arm off break', 10480, 167),
    (38, 'Kieron Pollard', 34, 'West Indies', 'Right-handed', 'Right-arm medium', 2779, 59),
    (39, 'Tamim Iqbal', 33, 'Bangladesh', 'Left-handed', 'Right-arm off break', 7457, 16),
    (40, 'Quinton de Kock', 29, 'South Africa', 'Left-handed', 'Right-arm off break', 5135, 0),
    (41, 'Kagiso Rabada', 26, 'South Africa', 'Right-handed', 'Right-arm fast', 228, 117),
    (42, 'Mohammed Shami', 31, 'India', 'Right-handed', 'Right-arm fast', 399, 182),
    (43, 'Shane Watson', 40, 'Australia', 'Right-handed', 'Right-arm mediumfast', 5757, 168),
    (44, 'Shoaib Malik', 40, 'Pakistan', 'Right-handed', 'Right-arm off break', 7534, 158),
    (45, 'Mushfiqur Rahim', 34, 'Bangladesh', 'Right-handed', 'Right-arm off break', 6323, 2),
    (46, 'Brendon McCullum', 40, 'New Zealand', 'Right-handed', 'Right-arm medium', 6453, 1),
    (47, 'Ravindra Jadeja', 33, 'India', 'Left-handed', 'Left-arm orthodox', 5931, 187),
    (48, 'Jos Buttler', 30, 'England', 'Right-handed', 'Right-arm medium', 3843, 0),
    (49, 'Andre Russell', 33, 'West Indies', 'Right-handed', 'Right-arm fast', 1085, 65),
    (50, 'Jason Holder', 29, 'West Indies', 'Right-handed', 'Right-arm fastmedium', 2022, 136),
    (51, 'Rashid Khan', 23, 'Afghanistan', 'Right-handed', 'Right-arm leg break', 717, 141);



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
