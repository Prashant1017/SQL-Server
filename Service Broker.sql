--		Service Broker		--


alter database Test
set enable_broker


create message type ReceivedOrders
authorization dbo
validation = none


create contract postmessages
(ReceivedOrders sent by any)


create queue OrderQueue
with status = on, retention = off	
-- If status is off, we cannot send or recieve message from queue, if retention is off, message will be deleted from queue.


create service OrderService
authorization dbo
on queue OrderQueue
(postmessages)


create table Orders
(
	OrderID int primary key,
	OrderDate date,
	ProductCode varchar(50),
	Quantity numeric(9, 2),
	UnitPrice numeric(9, 2)
)


-- Create a stored procedure that will insert records to the Order table and send the message to the previously defined queue.
create procedure CreateOrders
(
	@OrderID int,
	@ProductCode varchar(50),
	@Quantity numeric(9, 2),
	@UnitPrice numeric(9, 2)
)
as
begin
	declare @OrderDate as smalldatetime
	set @OrderDate = getdate()
	declare @xmlmessage xml

	create table #Message
	(
		OrderID int primary key,
		OrderDate date,
		ProductCode varchar(50),
		Quantity numeric(9, 2),
		UnitPrice numeric(9, 2)
	);

	insert into #Message
	values
	(
		@OrderID,
		@OrderDate,
		@ProductCode,
		@Quantity,
		@UnitPrice
	);

	insert into Orders
	values
	(
		@OrderID,
		@OrderDate,
		@ProductCode,
		@Quantity,
		@UnitPrice
	);

	select @xmlmessage = (select * from #Message for xml path('Order'), type)

	declare @handle uniqueidentifier
	-- Sending message to queue
	begin
		dialog conversation @handle
		from service OrderService to service 'OrderService' on contract [postmessages]
		with encryption = off;

		send on conversation @handle message type ReceivedOrders(@xmlmessage)
	end


execute CreateOrders 202003, 'PD0001', 1, 10.50
execute CreateOrders 202004, 'PD0002', 2, 10.75
execute CreateOrders 202005, 'PD0003', 1.5, 20.0


select * from Orders


-- Since we have sent three messages to the OrderQueue, we can verify those entries from the following query.
select
	service_name, 
	priority,
	queuing_order,
	service_contract_name,
	message_type_name,
	validation,
	message_body,
	message_enqueue_time,
	status
from OrderQueue


-- Consume the queue from the following code.
declare @handle uniqueidentifier
declare @MessageType sysname
declare @Message xml
declare @OrderDate date
declare @OrderID int
declare @ProductCode varchar(50)
declare @Quantity numeric(9, 2)
declare @UnitPrice numeric(9, 2)


waitfor
(
	receive top(1)
	@handle = conversation_handle,
	@MessageType = message_type_name,
	@Message = message_body from OrderQueue
), timeout 1000

set @OrderID = cast(cast(@Message.query('/Order/OrderID/text()') as nvarchar(max)) as int)
set @OrderDate = cast(cast(@Message.query('/Order/OrderDate/text()') as nvarchar(max)) as date)
set @ProductCode = cast(cast(@Message.query('/Order/ProductCode/text()') as nvarchar(max)) as varchar(50))
set @Quantity = cast(cast(@Message.query('/Order/Quantity/text()') as nvarchar(max)) as numeric(9, 2))
set @UnitPrice = cast(cast(@Message.query('/Order/UnitPrice/text()') as nvarchar(max)) as numeric(9, 2))

print @OrderID
print @OrderDate
print @ProductCode
print @Quantity
print @UnitPrice
