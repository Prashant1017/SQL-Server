--		Rank Functions		--

--	ROW_NUMBER()
--	RANK()
--	DENSE_RANK()
--	NTILE()


create table ExamResult
(
	StudentName varchar(50),
	Subject varchar(30),
	Marks int
)


insert into ExamResult
values
('Bibash', 'Maths', 60),
('Bibash', 'Science', 80),
('Bibash', 'English',75),
('Tikaram', 'Maths', 70),
('Tikaram', 'Science', 80),
('Tikaram', 'English', 90),
('Manish', 'Maths', 95),
('Manish', 'Science', 85),
('Manish', 'English', 65)


select * from ExamResult


select *, row_number() over(order by Marks desc) RowNumber
from ExamResult


select *, rank() over (partition by StudentName order by Marks desc) Rank
from ExamResult


select *, rank() over(order by Marks desc) Rank
from ExamResult


select *, dense_rank() over(order by Marks desc) Rank
from ExamResult


select *, ntile(2) over(order by Marks desc) Rank
from ExamResult


select *, ntile(3) over(order by Marks desc) Rank
from ExamResult


select *, ntile(7) over(order by Marks desc) Rank
from ExamResult


with StudentRank as 
(
	select *, row_number() over(order by Marks desc) as Rank
	from ExamResult
)

select * from StudentRank where Rank <= 3
