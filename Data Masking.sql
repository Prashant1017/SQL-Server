--		Data Masking		--


create table Employee_Financial
(
	EmpID int identity(1,1) primary key,
	EmpFName varchar(20) not null,
	EmpLName varchar(20) not null,
	EmpDOB date,
	EmpSalary int,
	EmpMail nvarchar(50)
)


insert into Employee_Financial
values
('John', 'Doe', '1990-05-15', 5000, 'john.doe@example.com'),
('Jane', 'Smith', '1985-12-02', 6000, 'jane.smith@example.com'),
('Michael', 'Johnson', '1992-09-25', 4500, 'michael.johnson@example.com'),
('Emily', 'Davis', '1988-06-10', 5500, 'emily.davis@example.com'),
('Daniel', 'Wilson', '1995-03-17', 4800, 'daniel.wilson@example.com'),
('Sarah', 'Anderson', '1991-11-30', 5200, 'sarah.anderson@example.com'),
('Christopher', 'Brown', '1987-08-07', 5900, 'christopher.brown@example.com'),
('Olivia', 'Taylor', '1993-04-23', 5100, 'olivia.taylor@example.com'),
('Matthew', 'Clark', '1989-10-12', 4700, 'matthew.clark@example.com'),
('Ava', 'Harris', '1994-07-19', 5400, 'ava.harris@example.com')


select * from Employee_Financial


create user TUser without login
grant select on Employee_Financial to TUser


execute as user = 'TUser'
select * from Employee_Financial
revert


alter table Employee_Financial
alter column EmpLName varchar(20) masked with (function = 'default()')


execute as user = 'TUser'
select * from Employee_Financial
revert


select * from Employee_Financial


alter table Employee_Financial
alter column EmpMail nvarchar(50) masked with (function = 'email()')


execute as user = 'TUser'
select * from Employee_Financial
revert


alter table Employee_Financial
alter column EmpSalary int masked with (function = 'random(1, 9)')


execute as user = 'TUser'
select * from Employee_Financial
revert


alter table Employee_Financial
alter column EmpFName varchar(20) masked with (function = 'partial(1, "xxxx", 1)')


execute as user = 'TUser'
select * from Employee_Financial
revert


select * from Employee_Financial


execute as user = 'TUser'
select * from Employee_Financial
revert
