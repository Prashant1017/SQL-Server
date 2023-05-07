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

update Student
set Phone_number = 9823673099 where id = 1

update Student
set Stu_name = 'Manisha', Gender = 'F' where id = 6

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

create procedure Details
as
begin	
	select Stu_id, Stu_name, Roll, Phone_number, Location, DOB from Student join Loc on Student.id = Loc.Stu_id
end

create procedure Full_details
as 
begin
	select Stu_id, Stu_name, Roll, Phone_number, Location, Pra_name, Ward_number, Dis_name, DOB 
	from Student 
	inner join Loc on Student.id = Loc.Stu_id
	inner join Pradesh on Stu_id = Pradesh.Pra_id
	inner join Ward on Stu_id = Ward.Ward_id
	inner join District on Stu_id = District.Dis_id
end

--	STUDENT DETAILS WITH FULL ADDRESS
execute Full_details


insert into Student
values
(5, 'Bibash', 3, 9818563412, 'M', 400),
(6, 'Manish', 6, 9815237645, 'M', 495),
(7, 'Tika', 24, 9851432970, 'M', 444)

insert into Loc
values
(5, 'Rolpa', '10-28-2001'),
(6, 'Sindupalchowk', '12-12-2002'),
(7, 'Surkhet', '05-22-1999')

insert into Pradesh
values
(5, 'Pradesh 6'),
(6, 'Pradesh 1'),
(7, 'Pradesh 4')

insert into Ward
values
(5, 12),
(6, 15),
(7, 32)

insert into District
values
(5, 'Khungri'),
(6, 'Chiyabagan'),
(7, 'Palanchok')

execute Details

execute Full_details

create table Stream
(
	St_id int not null,
	St_name varchar(40)
)

insert into Stream
values
(3, 'BSc CSIT'),
(7, 'BCA'),
(2, 'BBS'),
(6, 'BHM')

insert into Stream
values
(1, '+2'),
(4, 'School'),
(5, 'A level')

select * from Student

select id, Roll, Stu_name, St_name from Student inner join Stream on Student.id = St_id

create table College
(
	Co_id int not null,
	Co_name varchar(50),
	Co_addr varchar(50),
	Co_num numeric(10)
)

insert into College
values
(2, 'Kathford College', 'Balkumari', 9745321256),
(1, 'CCRC', 'Koteshwor', 9814563478),
(4, 'Don Bosco School', 'Kathmandu', 9815347681),
(5, 'Islington Academy', 'Kamalpokhari', 9860294155),
(3, 'Patan College', 'Patan', 9877258934),
(6, 'Academia College', 'Gwarko', 9845772299),
(7, 'Ambition College', 'Baneshwor', 9845882390)

select * from Student 
inner join Stream on Student.id = St_id
inner join College on Student.id = Co_id

select Stu_id, Stu_name, Phone_number, Gender, Location, DOB, Co_name, Co_addr, Co_num, St_name from
Student
inner join Loc on Student.id = Loc.Stu_id
inner join College on Stu_id = College.Co_id
inner join Stream on Stu_id = Stream.St_id

create procedure Stu_details
as
begin 
	select Stu_id, Stu_name, Phone_number, Gender, Location, DOB, Co_name, Co_addr, Co_num, St_name from
	Student
	inner join Loc on Student.id = Loc.Stu_id
	inner join College on Stu_id = College.Co_id
	inner join Stream on Stu_id = Stream.St_id
end

create procedure Stu_location
as 
begin
	select Stu_id, Stu_name, Phone_number, Location, Pra_name, Ward_number, Dis_name 
	from Student 
	inner join Loc on Student.id = Loc.Stu_id
	inner join Pradesh on Stu_id = Pradesh.Pra_id
	inner join Ward on Stu_id = Ward.Ward_id
	inner join District on Stu_id = District.Dis_id
end

execute Stu_location

--	Shows Students Details
execute Details

--	Shows Full Details Of Students
execute Full_details

--	Shows Details Of Student With College Details
execute Stu_details

--	Shows Details Of Students Location
execute Stu_location

select * from Student

select * from Loc

select Stu_name, Location from Student inner join Loc on Student.id = Loc.Stu_id

create table loc_details
(
	loc_id int identity(1,1) not null,
	loc_name varchar(40) not null
)

insert into loc_details
values
('Chitwan'),
('Rolpa'),
('Lumbini'),
('Kavre'),
('Rolpa'),
('Sindupalchowk'),
('Surkhet')

select * from loc_details

select Stu_name, loc_name from Student inner join loc_details on Student.id = loc_details.loc_id
