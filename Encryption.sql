-- Creating Master Key
USE Master;
GO
CREATE MASTER KEY ENCRYPTION
BY PASSWORD='Password@123';
GO


-- Creating Certificate Protected by Master Key
create certificate ClientDB_Cert
with
subject = 'Database_Encryption'
go


-- Creating Database Encryption Key
use Client
create database encryption key
with algorithm = AES_256
encryption by server certificate ClientDB_Cert


-- Enable Encryption
alter database Client
set encryption on


-- Backup Certificate
use master
backup certificate ClientDB_Cert
to file = 'D:\Certificate\ClientDB_Cert'
with private key (file = 'D:\Certificate\ClientDB_Cert.pvk',
encryption by password = 'Password@123')



/*

-- Restoring Certificate
use master 
create master key encryption
by password = 'Password@123'

use master 
create certificate ClientDB_Cert
from file = 'D:\Certificate\ClientDB_Cert'
with private key (file = 'D:\Certificate\ClientDB_Cert.pvk,
decrption by password = 'Password@123')


*/