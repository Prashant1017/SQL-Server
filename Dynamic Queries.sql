--	Dynamic Queries in SQL Server

declare @sql nvarchar(1000)

declare @Cid varchar(50)
set @Cid = 100

select @sql = 'select CustomerID, StoreID, AccountNumber from Sales.Customer where CustomerID = ' + @Cid

execute (@sql)



declare @ColumnName nvarchar(50) = 'FirstName'
declare @SearchValue nvarchar(50) = 'John'

declare @sqlquery nvarchar(max) = N'select * from Person.Person where ' + @ColumnName + ' = @SearchValue'

execute sp_executesql @sqlquery, N'@SearchValue nvarchar(50)', @SearchValue
