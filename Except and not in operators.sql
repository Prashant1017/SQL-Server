--		EXCEPT and NOT IN Operators		--


create table Books1
(
	id int,
	name varchar(30),
	category varchar(30),
	price int
)


create table Books2
(
	id int,
	name varchar(30),
	category varchar(30),
	price int
)


INSERT INTO Books1
VALUES
(1, 'Book1', 'Cat1', 1800),
(2, 'Book2', 'Cat2', 1500),
(3, 'Book3', 'Cat3', 2000),
(4, 'Book4', 'Cat4', 1300),
(5, 'Book5', 'Cat5', 1500),
(6, 'Book6', 'Cat6', 5000),
(7, 'Book7', 'Cat7', 8000),
(8, 'Book8', 'Cat8', 5000),
(9, 'Book9', 'Cat9', 5400),
(10, 'Book10', 'Cat10', 3200)


insert into Books2
values
(6, 'Book6', 'Cat6', 5000),
(7, 'Book7', 'Cat7', 8000),
(8, 'Book8', 'Cat8', 5000),
(9, 'Book9', 'Cat9', 5400),
(10, 'Book10', 'Cat10', 3200),
(11, 'Book11', 'Cat11', 5000),
(12, 'Book12', 'Cat12', 8000),
(13, 'Book13', 'Cat13', 5000),
(14, 'Book14', 'Cat14', 5400),
(15, 'Book15', 'Cat15', 3200)


select * from Books1
except
select * from Books2


select * from Books2
except
select * from Books1


select * from Books1
except
select * from Books1 where price > 5000


select * from Books1


select * from Books1
where id not in (select id from Books2)


select * from Books1
where name not in (select name from Books2)
