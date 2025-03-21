SELECT * FROM bronze.crm_cust_info;
SELECT * FROM bronze.crm_prd_info;
SELECT * FROM bronze.crm_sales_details;
SELECT * FROM bronze.erp_cat_g1v2;
SELECT * FROM bronze.erp_cust_az12;
SELECT * FROM bronze.erp_loc_a101;
------------------------------------------------------
 

 --CKECK FOR NULLS OR DUPLICATES IN PRIMARY KEY
 -- EXPECTATION: NO RESULT

 SELECT 
 cst_id,
 count(*)
 from bronze.crm_cust_info
 group by cst_id
 having count(*)>1 or cst_id  is null

 -------------------------------------------------------

 select * from bronze.crm_cust_info
 where cst_id=29466

 ------------------------------------------------------------
 select 
 *,
 ROW_NUMBER() over(partition by cst_id order by cst_create_date desc) as flag_last
 from  bronze.crm_cust_info
 where cst_id=29466
-------------------------------------------------------------------------------------------
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
    FROM bronze.crm_cust_info
) t
WHERE flag_last != 1;
-----------------------------------------------------------------------------------------------------
select *
from (
select*,
ROW_NUMBER() over (partition by cst_id order by cst_create_date desc) as flag_last
from bronze.crm_cust_info
where cst_id is not null
) t where flag_last=1
=--------------------------------------------------------------------------------------------
--Ckeck for unwanted Space
select cst_firstname from bronze.crm_cust_info

------------------------------------------------------
select cst_firstname
from bronze.crm_cust_info
where cst_firstname !=TRIM(cst_firstname)

select cst_lastname
from bronze.crm_cust_info
where cst_lastname !=TRIM(cst_lastname)
--------------------------------------------------------------------
--expectation: no results
select cst_key
from bronze.crm_cust_info
where cst_key !=TRIM(cst_key)

--- Data Standardization & Consistency
select distinct cst_gndr
from bronze.crm_cust_info


---------------
select distinct cst_material_status
from bronze.crm_cust_info

-----------------------------------------------------------------
--Working with silver table
---------------------------------------------------------------------------------------
insert into silver.crm_cust_info(
cst_id,
cst_key,
cst_firstname,
cst_lastname,
cst_material_status,
cst_gndr,
cst_create_date)

select 
cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,
TRIM(cst_lastname) as cst_lastname,
case when UPPER(trim(cst_material_status))='M' then 'married'
     when UPPER(trim(cst_material_status))='S' then 'single'
	 else 'n/a'
end cst_material_status,---normmalize marital status to readable format
case when upper(trim(cst_gndr))='F' then 'Female'
     when upper(trim(cst_gndr))='M' then 'Male'
	 else 'n/a'
end cst_gndr,--normalize gender valus to readable format
cst_create_date
from(
select *,
ROW_NUMBER() over(partition by cst_id order by cst_create_date) as flag_last
from bronze.crm_cust_info
where cst_id is not null
) t where flag_last=1  --- select the most recent recoed per customer


------------------------------------------------------------------------------------------
--CKECK FOR NULLS OR DUPLICATES IN PRIMARY KEY
 -- EXPECTATION: NO RESULT

 SELECT 
 cst_id,
 count(*)
 from silver.crm_cust_info
 group by cst_id
 having count(*)>1 or cst_id  is null

 --expectation: no results
select cst_firstname
from silver.crm_cust_info
where cst_firstname !=TRIM(cst_firstname)

select cst_lastname
from silver.crm_cust_info
where cst_lastname !=TRIM(cst_lastname)

--- Data Standardization & Consistency
select distinct cst_gndr
from silver.crm_cust_info

select * from silver.crm_cust_info
