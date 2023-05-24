create table Parents
(
	Parent varchar(20),
	Child varchar(20)
)


insert into Parents
values
('Alice', 'Carol'),
('Bob', 'Carol'),
('Carol', 'Dave'),
('Carol', 'George'),
('Dave', 'Mary'),
('Eve', 'Mary'),
('Mary', 'Frank')


select * from Parents


with cte_Parents as
(
	select Parent as p from Parents 
	where Child = 'Frank'

	union all

	select Parent from cte_Parents, Parents
	where cte_Parents.p = Parents.Child
)

select * from cte_Parents


create table Files
(
	FileID int primary key,
	FileName varchar(100),
	ParentFileID int
)


select * from Files


INSERT INTO Files (FileID, FileName, ParentFileID)
VALUES
(1, 'FolderA', NULL),
(2, 'FileA1', 1),
(3, 'FileA2', 1),
(4, 'FolderB', NULL),
(5, 'FileB1', 4),
(6, 'SubFolderB', 4),
(7, 'FileB2', 6),
(8, 'FileB3', 6),
(9, 'FileA3', 1)


select * from Files


with RecursiveFileSystem as
(
	select FileID, FileName, ParentFileID, 0 as Level
	from Files
	where ParentFileID is null

	union all

	select f.FileID, f.FileName, f.ParentFileID, r.Level + 1
	from Files f
	inner join RecursiveFileSystem r
	on r.FileID = f.ParentFileID
)

select * from RecursiveFileSystem


create table BillsOfMaterial
(
	ProductID int,
	ProductName varchar(100),
	ParentProductID int
)


insert into BillsOfMaterial
values
(1, 'ProductA', NULL),
(2, 'ComponentA1', 1),
(3, 'ComponentA2', 1),
(4, 'ProductB', NULL),
(5, 'ComponentB1', 4),
(6, 'SubComponentB', 4),
(7, 'ComponentB2', 6),
(8, 'ComponentB3', 6),
(9, 'ComponentA3', 1)


select * from BillsOfMaterial


with RecursiveBillsOfMaterial as
(
	select ProductID, ProductName, ParentProductID, 0 as Level
	from BillsOfMaterial
	where ParentProductID is null

	union all

	select b.ProductID, b.ProductName, b.ParentProductID, r.Level + 1
	from BillsOfMaterial b
	inner join RecursiveBillsOfMaterial r
	on b.ParentProductID = r.ProductID
)

select * from RecursiveBillsOfMaterial
