--	Recursive Functions	--

create table ParentOf
(
	Parent varchar(50),
	Child varchar(50)
)


insert into ParentOf
values
('Alice', 'Carol'),
('Bob', 'Carol'),
('Carol', 'Dave'),
('Carol', 'George'),
('Dave', 'Mary'),
('Eve', 'Mary'),
('Mary', 'Frank')


select * from ParentOf


with Ancestor as 
(
	select parent as p from ParentOf where Child = 'Frank'
	union all
	select parent from Ancestor, ParentOf
	where Ancestor.p = ParentOf.Child
)

select * from Ancestor


with cte_numbers(n, weekday) as
(
	select 0, datename(dw, 0)
	union all
	select n+1, datename(dw, n+1)
	from cte_numbers
	where n<6
)

select weekday from cte_numbers


create table Cats
(
	cat_id int,
	cat varchar(30),
	ancestor_id int
)


insert into Cats
values
(1, 'Felidae', null),
(2, 'Pantherinae', 1),
(3, 'Felinae', 1),
(4, 'Panthera', 2),
(5, 'Acinonyx', 3),
(6, 'Acinonyxa', 3),
(7, 'Leopard', 4),
(8, 'Lion', 4),
(9, 'Jaguar', 4),
(10, 'Snow Leopard', 4),
(11, 'Tiger', 4),
(12, 'Cheetah', 5),
(13, 'Cougar', 6)


select * from Cats


with RecursiveHierarchy as
(
	--	Anchor Member (Starting Point)
	
	select cat_id, cat, ancestor_id, 0 as level
	from Cats
--	where cat_id = 13
	union all

	--	Recursive Member

	select c.cat_id, c.cat, c.ancestor_id, level + 1
	from Cats c
	inner join RecursiveHierarchy rh
	on c.cat_id = rh.ancestor_id
)

select cat_id, cat, ancestor_id, level
from RecursiveHierarchy
