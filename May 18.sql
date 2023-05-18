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


execute BikeDetails 1



select * from sales.order_items


select product_id, list_price, discount from sales.order_items order by product_id



create table Discount
(
	product_id int,
	discount decimal(2,2)
)


select * from sales.order_items where quantity = 1


select product_id, discount, count(*) from sales.order_items group by product_id, discount order by product_id


select * from sales.order_items
