select * from bronze.crm_prd_info;


--------------------------------------------
--Ckeck for nulls or duplicates in primary key
-- Expextation :no result

select 
prd_id, 
count(*)
from silver.crm_prd_info
group by prd_id
having COUNT(*)>1 or prd_id is null;

------------------------------------------------------------------------

select prd_nm
from silver.crm_prd_info
where prd_nm !=TRIM(prd_nm)

-------------------------------------------------------------------------
--check for null or negative numbers
-- Expectarion : no results

select prd_cost
from silver.crm_prd_info
where prd_cost<0 or prd_cost is null

-------------------------------------------------------------------

--Data Standardization & Consistency
select distinct prd_line
from silver.crm_prd_info


---------------------------------------------
--check for invalid date orders
select  *
from silver.crm_prd_info
where prd_end_dt<prd_start_dt
---------------------------------------------------------------
select
prd_id,
prd_key,
prd_nm,
prd_start_dt,
prd_end_dt,
LEAD(prd_start_dt) over (partition by prd_key order by prd_start_dt)-1 as prd_end_dt_test
from bronze.crm_prd_info
where prd_key in ('AC-HE-HL-U509-R','AC-HE-HL-U509')


--------------------------------------------------------------------------

IF OBJECT_ID('silver.crm_prd_info','U') is not null
drop table silver.crm_prd_info;
create table silver.crm_prd_info(
prd_id int,
cat_id nvarchar(50),
prd_key nvarchar(50),
prd_nm nvarchar(50),
prd_cost int,
prd_line nvarchar(50),
prd_start_dt Date,
prd_end_dt date,
dwh_create_date datetime2 default getdate()
);


insert into silver.crm_prd_info(
prd_id,
cat_id,
prd_key,
prd_nm,
prd_cost,
prd_line,
prd_start_dt,
prd_end_dt
)







select
prd_id,
REPLACE(SUBSTRING( prd_key,1,5),'-','_') as cat_id,
SUBSTRING(prd_key, 7,LEN(prd_key)) as prd_key,
prd_nm,
isnull(prd_cost,0) as prd_cost,
case when UPPER(TRIM(prd_line))='M' then 'Mountain'
     when UPPER(TRIM(prd_line))='R' then 'Road'
	 when UPPER(TRIM(prd_line))='S' then 'other Sales'
	 when UPPER(TRIM(prd_line))='T' then 'Touring'
	 else 'n/a'
end  as prd_line,
CAST(prd_start_dt AS DATE) AS prd_start_dt,
cast(LEAD(prd_start_dt) over (partition by prd_key order by prd_start_dt)-1 as DATE) prd_end_dt
from bronze.crm_prd_info


select * from silver.crm_prd_info
