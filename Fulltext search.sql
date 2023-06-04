select serverproperty('isfulltextinstalled')


select name as [DBName], is_fulltext_enabled
from sys.databases


use New


create table Person
(
	id int primary key,
	Name varchar(100)
)


insert into Person
values
(1, 'Michael'),
(2, 'Michal'),
(3, 'Mikel'),
(4, 'Michelle')


select * from Person


select * from Person where Name like 'Michael'


select * from Person where contains (Name, 'Michael')


select * from Person where contains (Name, 'formsof(inflectional, run)')

select * from Person where contains (Name, 'formsof(thesaurus, fruit)')

select * from Person where contains (Name, 'mic*') 


insert into Person
values
(8, 'Apple'),
(9, 'Banana'),
(10, 'Grapes')
