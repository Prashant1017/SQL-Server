select * from production.brands


select * from production.categories


select * from production.products


select * from production.stocks


select * from sales.customers


select * from sales.order_items


select * from sales.orders


select * from sales.staffs


select * from sales.stores


select p.product_id, p.product_name, b.brand_name, c.category_name, p.model_year, p.list_price
from production.products p
inner join production.brands b on p.brand_id = b.brand_id
inner join production.categories c on p.category_id = c.category_id


create view [ProductDetails]
as
	select p.product_id, p.product_name, b.brand_name, c.category_name, p.model_year, p.list_price
	from production.products p
	inner join production.brands b on p.brand_id = b.brand_id
	inner join production.categories c on p.category_id = c.category_id


select * from ProductDetails


select p.*, s.quantity, s.store_id
from ProductDetails p
inner join production.stocks s
on p.product_id = s.product_id


create view [ProductStock] as
	select p.*, s.quantity, s.store_id
	from ProductDetails p
	inner join production.stocks s
	on p.product_id = s.product_id


select * from ProductStock


select * from ProductStock where quantity = 0


select * from ProductDetails


select * from ProductDetails order by list_price desc


select p.*, o.discount, (o.list_price - (o.list_price * o.discount)) as final_price
from ProductDetails p
inner join sales.order_items o
on p.product_id = o.product_id


create procedure BikeDetails @product_id int
as
select p.*, o.discount, (o.list_price - (o.list_price * o.discount)) as final_price
from ProductDetails p
inner join sales.order_items o
on p.product_id = o.product_id
where p.product_id = @product_id


execute BikeDetails 21


select * from sales.order_items


select product_id, list_price, discount from sales.order_items order by product_id


select * from sales.order_items where quantity = 1


select product_id, discount, count(*) from sales.order_items group by product_id, discount order by product_id


select * from sales.order_items


select * from sales.customers


select * from sales.customers where phone is not null


select * from sales.order_items


select i.product_id, i.order_id, o.customer_id, o.store_id, o.staff_id, i.quantity, i.list_price, i.discount, o.order_status, o.order_date,	o.required_date, o.shipped_date
from sales.order_items i
inner join sales.orders o
on i.order_id = o.order_id


create view [OrderDetails] as
select i.product_id, i.order_id, o.customer_id, o.store_id, o.staff_id, i.quantity, i.list_price, i.discount, o.order_status, o.order_date,	o.required_date, o.shipped_date
from sales.order_items i
inner join sales.orders o
on i.order_id = o.order_id


select * from OrderDetails


create view [OrderFullDetails]  as
select o.order_id, o.product_id, 
concat_ws(' ' , c.first_name, c.last_name) as CustomerName, c.phone as CustomerNumber, c.email as CustomerMail, concat_ws(',', c.street, c.city) as CustomerAddress,
s.store_name, s.phone as StoreNumber, s.email as StoreMail, concat_ws(',', s.street, s.city) as StoreAddress,
concat_ws(' ', st.first_name, st.last_name) as StaffName, st.email as StaffMail, st.phone as StaffNumber, st.store_id
from OrderDetails o
inner join sales.customers c on c.customer_id = o.customer_id
inner join sales.stores s on s.store_id = o.store_id
inner join sales.staffs st on st.staff_id = o.staff_id


select * from OrderFullDetails


select * from ProductDetails


select * from OrderDetails


select concat_ws(' ', c.first_name, c.last_name) as CustomerName, c.phone, p.product_name, s.store_name, o.quantity, o.list_price,
o.discount, (o.list_price - (o.list_price * o.discount)) as FinalPrice, o.order_status, o.order_date, o.required_date, o.shipped_date
into CustomerOrders
from OrderDetails o
inner join sales.customers c on o.customer_id = c.customer_id
inner join sales.stores s on o.store_id = s.store_id
inner join production.products p on o.product_id = p.product_id


select * from CustomerOrders


select * from CustomerOrders where FinalPrice > 2000


select * from CustomerOrders order by FinalPrice desc


select store_name, count(*) as Total from CustomerOrders group by store_name


select * from sales.orders where shipped_date is null 


select * from sales.orders where staff_id = 4


select * from sales.staffs


select * from OrderFullDetails 


update sales.staffs
set active = 0, store_id = 3, manager_id = null
where staff_id = 10


select distinct staff_id from sales.orders


select distinct StaffName from OrderFullDetails


execute BikeDetails 222


select * from ProductDetails


select * from ProductDetails order by list_price desc
