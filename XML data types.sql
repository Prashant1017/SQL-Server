--		XML Data Type In SQL Server		--


create table xmltable
(
	id int primary key,
	xmldata xml
)


insert into xmltable
values
(1, '<root><name>Tikaram</name><age>24</age></root>')


select * from xmltable


select xmldata from xmltable


select xmldata.value('(/root/name)[1]', 'varchar(50)') as Name
from xmltable



create table Employee_Details
(
	ID int primary key,
	Employee_Data xml not null
)


insert into Employee_Details
values
(
	3, '<employee><name>Manish Himalaya</name><city>Sindhupalchowk</city><salary>5000</salary></employee>'
)


select * from Employee_Details


--		Query Method		--


select 
	ed.Employee_Data.query('/employee/name[1]') as EmployeeName,
	ed.Employee_Data.query('/employee/city[1]') as EmployeeCity,
	ed.Employee_Data.query('/employee/salary[1]') as EmployeeSalary
from Employee_Details ed


select 
	ed.Employee_Data.query('/employee/name[1]/text()') as EmployeeName,
	ed.Employee_Data.query('/employee/city[1]/text()') as EmployeeCity,
	ed.Employee_Data.query('/employee/salary[1]/text()') as EmployeeSalary
from Employee_Details ed



--		Value Method		--


select 
	ed.Employee_Data.value('(/employee/name)[1]', 'nvarchar(max)') as EmployeeName,
	ed.Employee_Data.value('(/employee/city)[1]', 'nvarchar(max)') as EmployeeCity,
	ed.Employee_Data.value('(/employee/salary)[1]', 'int') as EmployeeSalary
from Employee_Details ed



--		Exist Method		--


select ed.Employee_Data.exist('/employee/name[1]') as EmployeeExist
from Employee_Details ed
where ed.ID = 2


select ed.Employee_Data.exist('/employee/name[2]') as EmployeeExist
from Employee_Details ed
where ed.ID = 2



--		Modify Method		--


update Employee_Details
set Employee_Data.modify('replace value of (/employee/salary/text())[1] with 30000')
where ID = 1


select * from Employee_Details


select * from Production.Illustration
