select * from silver.crm_sales_details
--------------------------------------------
--------------------------------------------------------------
select 
NULLIF(sls_order_dt,0) as sls_order_dt
from silver.crm_sales_details
where sls_order_dt<0 or len(sls_order_dt) !=8

-------------------------------------
--Check for invalid dates
select
nullif(sls_due_dt,0) sls_due_dt
from silver.crm_sales_details
where sls_due_dt<=0
or LEN(sls_due_dt)!=8
or sls_ship_dt>20500101
or sls_due_dt<19000101

------------------------------------------------
--Check for invalid date orders

select 
*
from silver.crm_sales_details
where sls_order_dt> sls_ship_dt or sls_order_dt> sls_due_dt

---------------------------------------------------
--Check Data Consistency :betweeen sales,Quantity ,and Price
-->> Sales = Quantity * Price
-->> values must not be null,zero , or negative.

select distinct
sls_sales,
sls_quantity,
sls_price
from silver.crm_sales_details
where sls_sales !=sls_quantity*sls_price
or sls_sales is null or sls_quantity is null or sls_price is null
or sls_sales<=0 or sls_quantity<=0 or sls_price<=0
order by sls_sales,
sls_quantity,
sls_price
-------------------------------------------------------------------------
select distinct
sls_sales as old_sls_sales,
sls_quantity,
sls_price as old_sls_price,
case when sls_sales is null or sls_sales<=0 or sls_sales!=sls_quantity *ABS(sls_price)
          then sls_quantity * ABS(sls_price)
		  else sls_sales
end as sls_sales,
case when sls_price is null or sls_price<=0
     then sls_sales/nullif(sls_quantity,0)
	 else sls_price
end sls_price

from silver.crm_sales_details
where sls_sales!=sls_quantity*sls_price
or sls_sales is null or sls_quantity is null or sls_price is null
or sls_sales <=0 or sls_quantity<=0 or sls_price<=0
order by sls_sales,sls_quantity,sls_price


----------------------------------------------------------
IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details;

CREATE TABLE silver.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt DATE,
    sls_ship_dt  DATE,
    sls_due_dt   DATE,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
-----------------------------------------------------------------------

insert into silver.crm_sales_details (
    sls_ord_num  ,
    sls_prd_key  ,
    sls_cust_id  ,
    sls_order_dt ,
    sls_ship_dt  ,
    sls_due_dt  ,
    sls_sales    ,
    sls_quantity ,
    sls_price    
   
)



select 
sls_ord_num,
sls_prd_key,
sls_cust_id,
case when sls_order_dt=0 or LEN(sls_order_dt) !=8 then null
     else CAST(CAST(sls_order_dt as varchar) as date)
end as sls_order_dt,
case when sls_ship_dt=0 or LEN(sls_ship_dt) !=8 then null
     else CAST(CAST(sls_ship_dt as varchar) as date)
end as sls_ship_dt,
case when sls_ship_dt=0 or LEN(sls_ship_dt) !=8 then null
     else CAST(CAST(sls_ship_dt as varchar) as date)
end as sls_due_dt,

sls_sales,
sls_quantity,
case when sls_price is null or sls_price<=0
     then sls_sales/nullif(sls_quantity,0)
	 else sls_price
end sls_price
from bronze.crm_sales_details
