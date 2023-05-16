select * from Cricket_audit


select * from CustomerDetails


select * from Sales.vIndividualCustomer


select * from Sales.vSalesPerson


select distinct SalesPersonID from CustomerDetails


select * from ScrapProductDetails


select * from ScrapReason


select * from Production.WorkOrder


select * from Production.WorkOrder where ScrapReasonID is not null


select * from ScrapProducts


select s.*, w.StartDate, w.EndDate, w.DueDate 
from ScrapProducts s
inner join Production.WorkOrder w
on s.WorkOrderID = w.WorkOrderID
where StartDate between '2011-07-01' and '2013-07-01'
