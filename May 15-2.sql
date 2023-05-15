select * from Player


select * from PlayerDetails


execute IndividualDetail 'Robert Lewandowski'


select * from Club


insert into Club
values
(26, 'Bayer Leverkusen', 2, 'Bay Arena')


select * from Manager


select * from Player where ClubID = 15


select * from Player where ClubID is null


insert into Player
values
(77, 'Yann Sommer', 'Switzerland', 'Goalkeeper', 31, 1, 2),
(78, 'Nicolo Zaniolo', 'Italy', 'Midfielder', 23, 18, 3),
(79, 'Pervis Estupinan', 'Colombia', 'Defender', 22, 19, 1),
(80, 'Rodrigo Moreno', 'Spain', 'Forward', 32, 5, 1),
(81, 'Joel Robles', 'Spain', 'Goalkeeper', 32, 5, 1),
(82, 'Luke Ayling', 'England', 'Defender', 30, 5, 1),
(83, 'Rasmus Kristensen', 'Denmark', 'Defender', 25, 5, 1),
(84, 'Maximilian Wober', 'Austria', 'Defender', 27,5, 1),
(85, 'Junior Firpo', 'Spain', 'Defender', 30, 5, 1),
(86, 'Robin Koch', 'Germany', 'Midfielder', 26, 5, 1),
(87, 'Sam Greenwood', 'England', 'Midfielder', 20, 5, 1),
(88, 'Weston Mckennie', 'USA', 'Midfielder', 22, 5, 1),
(89, 'Jack Harrison', 'England', 'Forward', 24, 5, 1),
(90, 'Adam Forshaw', 'England', 'Midfielder', 28, 5, 1),
(91, 'Ansu Fati', 'Spain', 'Forward', 20, 4, 4)


select * from Player


select * from Player where ClubID is null


delete from Player where PlayerID = 2
delete from Player where PlayerID = 21
delete from Player where PlayerID = 28


insert into Player 
values
(92, 'Florian Wirtz', 'Germany', 'Midfielder', 21, 26, 2),
(93, 'Karim Adeyemi', 'Germany', 'Forward', 22, 15, 2),
(94, 'Tammy Abraham', 'England', 'Forward', 23, 18, 3),
(95, 'Kaoru Mitoma', 'Japan', 'Forward', 24, 19, 1),
(96, 'Morgan Gibbs-White', 'England', 'Midfielder', 24, 25, 1),
(97, 'Marquinhos', 'Brazil', 'Defender', 28, 7, 5),
(98, 'Kenny Tete', 'Brazil', 'Forward', 21, 21, 1),
(99, 'Bruno Guimaraes', 'Brazil', 'Midfielder', 24, 12, 1),
(100, 'Raphinha', 'Brazil', 'Forward', 26, 4, 4)



select * from Player 


select * from Manager order by ClubID


update Manager
set ManagerName = 'Sean Dyche', ManagerCountry = 'England'
where ManagerID = 32


select * from Manager


select * from PlayerDetails


select * from Club


select m.ManagerName, m.ManagerCountry, c.ClubName, c.ClubStadium
into ClubManager
from Manager m
inner join Club c
on m.ClubID = c.ClubID


select * from ClubManager


select * from Manager where ClubID is null


select * from Player


select * from PlayerDetails


select LeagueName, count(*) as Number from PlayerDetails group by LeagueName


select * from PlayerDetails where LeagueName <> 'Premier League' order by PlayerPosition


select * from PlayerDetails where LeagueName = 'Premier League' order by PlayerPosition
