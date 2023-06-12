create database CustomerData

use CustomerData


create table CustomerInfo
(
	ID int primary key,
	Name varchar(50) not null,
	BankAcc varchar(10) not null
)


insert into CustomerInfo
values
(1, 'Tikaram', 1234567),
(2, 'Manish', 246632),
(3, 'Parasar', 46758541),
(4, 'Bibash', 578426),
(5, 'Anjal', 8623488)


select * from CustomerInfo


-- Creating a master key
create master key encryption by password = 'Customer_123'

SELECT name KeyName, 
    symmetric_key_id KeyID, 
    key_length KeyLength, 
    algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys


-- Creating a certificate
create certificate Certificate_Test with subject = 'Data Protection'

SELECT name CertName, 
    certificate_id CertID, 
    pvt_key_encryption_type_desc EncryptType, 
    issuer_name Issuer
FROM sys.certificates


-- Creating a key
create symmetric key SymKey_Test with algorithm = AES_256 encryption by certificate Certificate_Test

SELECT name KeyName, 
    symmetric_key_id KeyID, 
    key_length KeyLength, 
    algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys


alter table CustomerInfo
add BankAcc_encrypt varbinary(max)


open symmetric key SymKey_Test decryption by certificate Certificate_Test


update CustomerInfo
set BankAcc_encrypt = encryptbykey (key_guid('SymKey_Test'), BankAcc)	-- Displays encrypted value of BankAcc
from CustomerInfo


close symmetric key SymKey_Test


select * from CustomerInfo


alter table CustomerInfo
drop column BankAcc


open symmetric key SymKey_Test decryption by certificate Certificate_Test

select *, convert(varchar, decryptbykey (BankAcc_encrypt)) as Decrypted		-- Displays decrypted value 
from CustomerInfo


close symmetric key SymKey_Test 


select * from CustomerInfo


use master
create login [pra] with password = N'NewLogin', default_database = [CustomerData], check_expiration = off, check_policy = off


use CustomerData
create user [pra] for login [pra]

alter role [db_datareader] add member [pra]		-- Assigning role to new user


open symmetric key SymKey_Test decryption by certificate Certificate_Test

select *, convert(varchar, decryptbykey (BankAcc_encrypt)) as DecryptedNumber
from CustomerInfo


-- Providing permissions to symmetric key and certificate
GRANT VIEW DEFINITION ON SYMMETRIC KEY::SymKey_test TO SQLShack; 
GO
GRANT VIEW DEFINITION ON Certificate::[Certificate_test] TO SQLShack;
GO
GRANT CONTROL ON Certificate::[Certificate_test] TO SQLShack;
