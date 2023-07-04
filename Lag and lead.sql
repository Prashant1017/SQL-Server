--		LAG() and LEAD() Operators


create table Employee
(
	EmpCode varchar(10),
	EmpName varchar(40),
	JoiningDate date
)


insert into Employee
values
('1', 'Rajendra', '1-Sep-2018'),
('2', 'Manoj', '1-Oct-2018'),
('3', 'Sonu', '10-Mar-2018'),
('4', 'Kashish', '25-Oct-2018'),
('5', 'Tim', '1-Dec-2018'),
('6', 'Akshita', '1-Nov-2018')


select * from Employee


select *, lag(JoiningDate, 1) over(order by JoiningDate asc) from Employee


select *, lag(JoiningDate, 1, '2001-03-10') over(order by JoiningDate asc) from Employee


select *, lag(JoiningDate, 2, '2001-03-10') over(order by JoiningDate asc) from Employee


select *, lead(JoiningDate) over(order by JoiningDate asc)  from Employee


create table QuarterSale
(
	Year int,
	Quarter int,
	Sales decimal(7, 2)
)


insert into QuarterSale
values
(2017, 1, 55000.00),
(2017, 2, 78000.00),
(2017, 3, 49000.00),
(2017, 4, 32000.00),
(2018, 1, 83472.00),
(2018, 2, 72942.00),
(2018, 3, 25215.00),
(2018, 4, 92752.00),
(2019, 1, 46284.00),
(2019, 2, 86462.00),
(2019, 3, 98634.00),
(2019, 4, 98734.00)


select * from QuarterSale


select *, lag(Sales, 1, 0) over(order by Year, Quarter asc) as NextQuarterSales
from QuarterSale


select *, lead(Sales, 1, 0) over(order by Year, Quarter asc) as PrevQuarterSales
from QuarterSale
