select * from Student

alter table Student
add Phone_number numeric

alter table Student
add Gender varchar

alter table Student
add Marks numeric

select * from Student

insert into Student
values
(3, 'Ram', 40, 9876543210, 'M', 480),
(4, 'Sam', 23, 9843473156, 'M', 480)

update Student
set Phone_number = 998754123, Gender = 'F', Marks = 490 where id = 1

update Student
set Phone_number = 9865342756, Gender = 'F', Marks = 433 where id = 2

select * from Student

create table Loc
(
	Stu_id int not null,
	Location varchar(50),
	DOB varchar(30),
	primary key (Stu_id)
)

insert into Loc
values
(1, 'Chitwan', '01-23-1990'),
(2, 'Rolpa', '05-14-1989'),
(3, 'Lumbini', '10-24-1991'),
(4, 'Kavre', '08-19-1990')

select * from Loc

select * from Student

select Stu_id, Stu_name, Roll, Phone_number, Location, DOB from Student join Loc on Student.id = Loc.Stu_id

create table Pradesh
(
	Pra_id int not null,
	Pra_name varchar(50)
)

insert into Pradesh
values
(1, 'Pradesh 3'),
(2, 'Pradesh 4'),
(3, 'Pradesh 7'),
(4, 'Pradesh 2')

create table Ward
(
	Ward_id int not null,
	Ward_number numeric 
)

insert into Ward
values
(1, 12),
(2,19),
(3, 24),
(4,3)

create table District
(
	Dis_id int not null,
	Dis_name varchar(40)
)

insert into District 
values
(1, 'Siraha'),
(2, 'Khungri'),
(3, 'Taplejung'),
(4, 'Dapcha')

select Stu_id, Stu_name, Roll, Phone_number, Location, Pra_name, Ward_number, Dis_name, DOB 
from Student 
inner join Loc on Student.id = Loc.Stu_id
inner join Pradesh on Stu_id = Pradesh.Pra_id
inner join Ward on Stu_id = Ward.Ward_id
inner join District on Stu_id = District.Dis_id 
