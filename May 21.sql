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
