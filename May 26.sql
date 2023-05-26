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
