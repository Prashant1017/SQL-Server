--		Computed Columns		--


create table ComputedTable
(
	Col1 int,
	COl2 int,
	ComputedColumn as COl1 + Col2
)


insert into ComputedTable
values
	(23, 43),
	(12, 89),
	(2,5)


select * from ComputedTable


select * from HumanResources.Employee


alter table HumanResources.Employee
add Experience as datediff(year, HireDate, getdate())


select * from HumanResources.Employee where Experience > 14
