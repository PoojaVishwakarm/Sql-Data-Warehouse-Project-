
/*
=====================================
Create Database and Schema
=====================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/





---- Create Database 'Datawarehouse'

use master;
go

-- Drop and recreate the 'DataWareHouse' database
if exists (select 1 from sys.database where name='DataWarehouse')
begin
     alter database DataWarehouse set single_user with rollback immediate;
	 drop database DataWarehouse;
end;
go

create database DataWarehouse;
go

use DataWarehouse;
go


-- Create Schemas

create schema bronze;
go
create schema silver;
go
create schema gold;
