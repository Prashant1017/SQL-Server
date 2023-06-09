create table League
(
	LeagueID int primary key,
	LeagueName varchar(50),
	LeagueCountry varchar(50)
)


insert into League
values
(1, 'Premier League', 'England'),
(2, 'Bundesliga', 'Germany'),
(3, 'Serie A', 'Italy'),
(4, 'La Liga', 'Spain'),
(5, 'Ligue 1', 'France')


create table Club
(	
	ClubID int primary key,
	ClubName varchar(50),
	ClubLeague int,
	ClubStadium varchar(100)
)


insert into Club
values
(12, 'Newcastle United', 1, 'St. James Park')



select * from Club


create table Manager
(
	ManagerID int primary key,
	ManagerName varchar(50),
	ClubID int
)


alter table Manager
add ManagerCountry varchar(50)


select * from Manager


insert into Manager
values
(18, 'Massimiliano Allegri', 6, 'Italy'),
(19, 'Mikel Arteta', 13, 'Spain'),
(20, 'Steven Gerrard', null, 'England'),
(21, 'Luciano Spalletti', 20, 'Italy'),
(22, 'Eddie Howe', 12, 'England'),
(23, 'Jesse Marsch', null, 'United States'),
(24, 'Patrick Vieira', null, 'France'),
(25, 'Stefano Pioli', 2, 'Italy'),
(26, 'Xavi Hernandez', 4, 'Spain'),
(27, 'Sam Allardyce', 5, 'England'),
(28, 'Christophe Galtier', 7, 'France'),
(29, 'Simone Inzaghi', 16, 'Italy'),
(30, 'Ryan Mason', 17, 'England')


select * from Manager


create table Player
(
	PlayerID int primary key,
	PlayerName varchar(50),
	PlayerCountry varchar(50),
	PlayerPosition varchar(20),
	Age int,
	ClubID int,
	LeagueID int
)


select * from Club


insert into Player
values
(31, 'Trent Alexander-Arnold', 'England', 'Defender', 22, 8, 1),
(32, 'Joshua Kimmich', 'Germany', 'Midfielder', 26, 1, 2),
(33, 'Andrew Robertson', 'Scotland', 'Defender', 27, 8, 1),
(34, 'Heung-Min Son', 'South Korea', 'Forward', 29, 17, 1),
(35, 'Lautaro Martinez', 'Argentina', 'Forward', 24, 16, 3),
(36, 'Joshua Zirkzee', 'Netherlands', 'Forward', 20, null, 2),
(37, 'Ansu Fati', 'Spain', 'Forward', 18, 4, 4),
(38, 'Jo�o Felix', 'Portugal', 'Forward', 21, 11, 1),
(39, 'Timo Werner', 'Germany', 'Forward', 25, null, 2),
(40, 'Marcus Rashford', 'England', 'Forward', 23, 10, 1),
(41, 'Hakim Ziyech', 'Morocco', 'Midfielder', 28, 11, 1),
(42, 'Dayot Upamecano', 'France', 'Defender', 22, 1, 2),
(43, 'Declan Rice', 'England', 'Midfielder', 22, null, 1),
(44, 'Mason Mount', 'England', 'Midfielder', 22, 11, 1),
(45, 'Gianluigi Donnarumma', 'Italy', 'Goalkeeper', 22, 7, 5),
(46, 'Keylor Navas', 'Costa Rica', 'Goalkeeper', 34, null, 1),
(47, 'Achraf Hakimi', 'Morocco', 'Defender', 22, 7, 5),
(48, 'Kieran Tierney', 'Scotland', 'Defender', 24, 13, 1),
(49, 'Pedri', 'Spain', 'Midfielder', 18, 4, 4),
(50, 'Jamal Musiala', 'Germany', 'Midfielder', 18, 1, 2),
(51, 'Federico Chiesa', 'Italy', 'Forward', 23, 6, 3),
(52, 'Kingsley Coman', 'France', 'Forward', 25, 1, 2),
(53, 'Serge Gnabry', 'Germany', 'Forward', 26, 1, 2),
(54, 'Dani Olmo', 'Spain', 'Midfielder', 23, null, 2),
(55, 'Dominik Szoboszlai', 'Hungary', 'Midfielder', 20, null, 2),
(56, 'Dani Ceballos', 'Spain', 'Midfielder', 24, 9, 4),
(57, 'Eduardo Camavinga', 'France', 'Midfielder', 18, 9, 4),
(58, 'Youssoufa Moukoko', 'Germany', 'Forward', 16, 1, 2),
(59, 'Phil Foden', 'England', 'Midfielder', 21, 3, 1),
(60, 'Nicolo Barella', 'Italy', 'Midfielder', 24, 16, 3)


select * from Player


select p.PlayerName, p.PlayerCountry, p.PlayerPosition, p.Age, c.ClubName, c.ClubID
from Player p
inner join Club c
on p.ClubID = c.ClubID


alter view [PlayerClub]
as
	select p.PlayerName, p.PlayerCountry, p.PlayerPosition, p.Age, c.ClubName, c.ClubLeague, c.ClubID
	from Player p
	inner join Club c
	on p.ClubID = c.ClubID


select * from PlayerClub


select distinct ClubID from PlayerClub


select * from Club


select p.PlayerName, p.PlayerCountry, p.PlayerPosition, p.Age, p.ClubName, l.LeagueName
from PlayerClub p
inner join League l
on p.ClubLeague = l.LeagueID


create view [PlayerDetails]
as
	select p.PlayerName, p.PlayerCountry, p.PlayerPosition, p.Age, p.ClubName, l.LeagueName
	from PlayerClub p
	inner join League l
	on p.ClubLeague = l.LeagueID


select * from PlayerDetails


select LeagueName, count(*) as Players from PlayerDetails group by LeagueName


select * from PlayerDetails where LeagueName = 'Serie A'


select PlayerCountry, count(*) as TotalPlayers from Player group by PlayerCountry order by TotalPlayers desc


select * from Player where PlayerCountry = 'England' or PlayerCountry = 'Germany'


select * from Player where ClubID is null


delete from Player
where PlayerID = 36


insert into Club
values
(23, 'RB Leipzig', 2, 'Red Bull Arena'),
(24, 'West Ham United', 1, 'London Stadium'),
(25, 'Nottingham Forest', 1, 'City Ground')


select * from Club


select * from PlayerDetails where Age < 20


select PlayerPosition, count(*) as NumberOfPlayers from Player group by PlayerPosition


select LeagueName, count(*) as Players from PlayerDetails group by LeagueName


select * from PlayerDetails where LeagueName = 'Bundesliga'


update Player
set ClubID = 23
where PlayerID = 39


select * from Player


select * from Club


select * from Manager where ClubID is null


select c.ClubName, c.ClubStadium, m.ManagerName, m.ManagerCountry
from Club c
inner join Manager m
on c.ClubID = m.ClubID


select * from PlayerClub


select * from PlayerDetails where Age between 26 and 30


select * from Player where PlayerCountry = 'Brazil'


insert into Player
values
(67, 'Rafael Leao', 'Portugal', 'Forward', 21, 2, 3),
(68, 'Theo Hernandez', 'France', 'Defender', 23, 2, 3),
(69, 'Patrick Bamford', 'England', 'Forward', 28, 5 ,1),
(70, 'Wilfried Gnonto', 'Italy', 'Forward', 18, 5, 1),
(71, 'Alexander Isak', 'Sweden', 'Forward', 21, 12, 1),
(72, 'Kieran Trippier', 'England', 'Defender', 30, 12, 1),
(73, 'Lorenzo Pellegrini', 'Italy', 'Midfielder', 24, 18, 3),
(74, 'Khvicha Kvaratskhelia', 'Georgia', 'Forward', 22, 20, 3),
(75, 'James Maddison', 'Engalnd', 'Midfielder', 25, 21, 1),
(76, 'Amadou Onana', 'Belgium', 'Midfielder', 20, 22, 1)


select top 5 PlayerCountry, count(*) as Players from Player group by PlayerCountry order by Players desc


select * from Club


select * from PlayerDetails


select distinct ClubName from PlayerDetails


select * from PlayerDetails where Age < 23 and LeagueName = 'Premier League'


select LeagueName, count(*) as Players from PlayerDetails group by LeagueName 


select * from PlayerDetails where PlayerCountry = 'Spain'


select * from PlayerDetails where PlayerPosition = 'Midfielder'


select * from PlayerDetails where ClubName = 'Bayern Munich'


select ClubName , count(*) as Players from PlayerDetails group by ClubName order by Players desc


select PlayerName, ClubName from PlayerDetails


select * from Manager


select * from Club


select c.ClubName, m.ManagerName
from Club c
inner join Manager m
on c.ClubID = m.ClubID



insert into Manager
values
(31, 'Edin Terzic', 15, 'Croatia'),
(32, null, 22, null),
(33, 'Marco Rose', 23, 'Germany'),
(34, 'David Moyes', 24, 'Scotland'),
(35, 'Steve Cooper', 25, 'England')


delete from Club
where ClubID = 19


select PlayerCountry, count(*) as Players from PlayerDetails group by PlayerCountry


select LeagueName, avg(Age) as Average from PlayerDetails group by LeagueName


select * from PlayerDetails order by Age desc


select * from Manager


select * from Club


select ManagerCountry, count(*) as Managers from Manager group by ManagerCountry order by Managers desc


select * from Manager where ManagerCountry = 'Italy'


select * from PlayerDetails where Age = (select max(Age) from PlayerDetails)


select * from PlayerDetails where Age < 25 and PlayerPosition = 'Forward'


select PlayerPosition, count(*) as Players from PlayerDetails group by PlayerPosition


select ClubName, avg(Age) as AverageAge from PlayerDetails group by ClubName order by AverageAge desc


select * from PlayerDetails order by PlayerName


select * from Player


update Player
set PlayerName = 'Federico Valverde', PlayerCountry = 'Uruguay', PlayerPosition = 'Midfielder'
where PlayerID = 66


create procedure IndividualDetail @Name varchar(50)
as 
begin
	select * from PlayerDetails where PlayerName = @Name
end


execute IndividualDetail 'maSon mount'


create trigger NoDeletion
on PlayerDetails
instead of delete
as
begin	
	raiserror('***	THE DATAS OF THIS TABLE CANNOT BE DELETED	***', 16, 1)
	rollback transaction
	print '---	You dont have access to delete the contents of this table.	---'
end


delete from PlayerDetails
where PlayerName = 'Robert Lewandowski'


select * from PlayerDetails


select * from League


select * from PlayerDetails


select PlayerCountry, max(Age) as Oldest from PlayerDetails group by PlayerCountry order by Oldest desc


select Age, PlayerPosition, count(*) as Players from PlayerDetails group by Age, PlayerPosition order by Players desc


select * from PlayerDetails where Age > 30 and (PlayerPosition = 'Midfielder' or PlayerPosition = 'Forward')


select * from PlayerDetails where LeagueName = 'Premier League' and (PlayerCountry = 'France' or PlayerCountry = 'Brazil')


select * from PlayerDetails where PlayerCountry = (select PlayerCountry from PlayerDetails where PlayerName = 'Lucas Paqueta')
and PlayerName <> 'Lucas Paqueta'
