select * from CustomerOrders


select * from CustomerOrders order by discount desc


select * from CustomerOrders order by FinalPrice desc


select * from CustomerOrders where phone is not null


select * from OrderDetails


select * from OrderFullDetails


select store_name, StoreNumber, StaffName, StaffNumber, store_id from  OrderFullDetails


select distinct store_name, StaffName from OrderFullDetails where store_id = 1
select distinct store_name, StaffName from OrderFullDetails where store_id = 2
select distinct store_name, StaffName from OrderFullDetails where store_id = 3


select * from sales.staffs


select * from sales.order_items


select * from sales.orders


select * from ProductDetails


select distinct product_name from ProductDetails


select * from ProductStock


execute BikeDetails 222


select * from Stocks where quantity = 0


select * from sales.orders


select distinct staff_id from sales.orders order by staff_id


update sales.staffs
set active = 0, manager_id = null
where staff_id = 1


update sales.staffs
set active = 0, manager_id = null
where staff_id = 4


update sales.staffs
set active = 0, manager_id = null
where staff_id = 5


select * from sales.staffs


select * from CustomerOrders


select * from OrderFullDetails


select distinct StaffName from OrderFullDetails


select * from CustomerOrders


create procedure Customer_Order_Details @customerid int 
as
select c.customer_id, o.* 
from sales.customers c
inner join CustomerOrders o
on concat_ws(' ' , c.first_name, c.last_name) = o.CustomerName
where customer_id = @customerid


execute Customer_Order_Details 313


select * from sales.customers


execute Customer_Order_Details 1445


execute BikeDetails 111


select * from production.products
