/*

select *  from pdw_diagnostics_sessions


insert into pdw_diagnostics_sessions
values
('Today', 'SSS', 'LKD', 'WDF', 'Table 3', 1)


select * from pdw_diagnostics_sessions


*/


select * from HumanResources.Department


select * from HumanResources.Employee


select * from Sales.vSalesPerson


select * from Production.vProductModelCatalogDescription


select * from Purchasing.vVendorWithAddresses


create table Staffs
(
	id int,
	Name varchar(50),
	manager_id int
)


insert into Staffs
values
(1, 'Max', null),
(2, 'Ana', 1),
(3, 'Varun', 1),
(4, 'Laxman', 2),
(5, 'Arush', 3)


with cte_org as
(
	select id, Name, manager_id
	from Staffs
	where manager_id is null

	union all

	select s.id, s.Name, s.manager_id
	from Staffs s
	inner join cte_org o 
	on o.id = s.manager_id
)

select * from cte_org


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


with cte_cat as
(
	select cat_id, cat, ancestor_id, 0 as level
	from Cats
	where ancestor_id is null

	union all

	select c.cat_id, c.cat, c.ancestor_id, level + 1
	from Cats c
	inner join cte_cat o
	on o.cat_id = c.ancestor_id
)

select * from cte_cat
