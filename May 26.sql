--	CTE [Common Table Expressions]	--

select * from Cats


with Ancestors as
(
	select cat_id, cat, ancestor_id, 0 as level, cast(cat as varchar(max)) as lineage
	from Cats
	where ancestor_id is null

	union all

	select c.cat_id, c.cat, c.ancestor_id, level + 1, a.lineage + '>' + c.cat
	from Cats c
	inner join Ancestors a
	on c.ancestor_id = a.cat_id
)

select * from Ancestors


create view CatFamily 
as
with Ancestors as
(
	select cat_id, cat, ancestor_id, 0 as level, cast(cat as varchar(max)) as lineage
	from Cats
	where ancestor_id is null

	union all

	select c.cat_id, c.cat, c.ancestor_id, level + 1, a.lineage + '>' + c.cat
	from Cats c
	inner join Ancestors a
	on c.ancestor_id = a.cat_id
)

select * from Ancestors


select * from CatFamily


select * from HumanResources.vEmployeeDepartment


select Department, count(*) from HumanResources.vEmployeeDepartment group by Department


select * from HumanResources.vEmployee


select * from HumanResources.vEmployeeDepartmentHistory


with DepartmentEmployee as
(
	select concat_ws(' ', FirstName, MiddleName, LastName) as FullName, JobTitle
	from HumanResources.vEmployeeDepartment
	where Department = 'Production'
)

select * from DepartmentEmployee


with Fibonacci (n, fib_n, next_fib_n) as
(
	select 1, 0, 1

	union all

	select n + 1, next_fib_n, fib_n + next_fib_n
	from Fibonacci where n < 10
)

select * from Fibonacci


with cte as
(
	select 1 as n, 1 as p, -1 as q

	union all

	select n + 1, q * 2, p * 2
	from cte
	where n < 5
)

select * from cte


with cte (n) as
(
	select 1

	union all

	select n + 1
	from cte
	where n < 10
)

select * from cte


select * from Sales.SalesOrderDetail


select ModifiedDate, LineTotal from Sales.SalesOrderDetail


select format(ModifiedDate, 'yyyy-MM-dd') as Date, cast(sum(LineTotal) as int) as TotalPrice 
into DailyAnnual
from Sales.SalesOrderDetail 
group by ModifiedDate


select * from DailyAnnual order by TotalPrice desc


select * from Staffs


insert into Staffs
values
(6, 'Parasar', 5),
(7, 'Ural', 4),
(8, 'Sakushal', 6),
(9, 'Sudan', 6),
(10, 'Bibash', 9)


select * from Staffs


with cte as
(
	select id, Name, manager_id, 0 as level, cast(Name as varchar(max)) as lineage
	from Staffs
	where manager_id is null

	union all

	select s.id, s.Name, s.manager_id, level + 1, c.lineage + '<-' + s.Name
	from Staffs s
	inner join cte c
	on s.manager_id = c.id
)

select * from cte order by lineage
