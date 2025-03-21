select * from bronze.erp_cust_az12

select * from silver.crm_cust_info
------------------------------------------
select 
cid,
bdate,
gen 
from bronze.erp_cust_az12
where cid like '%AW00011000%'

--------------------------------------------
select 
cid,
case when cid like 'NAS%' then SUBSTRING(cid,4,LEN(cid))
     else cid
end as cid,
bdate,
gen
from silver.erp_cust_az12

------------------------------------------------------------------
select 
cid,
case when cid like 'NAS%' then SUBSTRING(cid,4,LEN(cid))
     else cid
end as cid,
bdate,
gen
from bronze.erp_cust_az12
where case when cid like 'NAS%' then SUBSTRING(cid,4,LEN(cid))
      else cid
end not in (select distinct cst_key from silver.crm_cust_info)
--------------------------------------------------------------------------------
--- identify out-of-range Dates

select distinct 
bdate
from bronze.erp_cust_az12
where bdate<'1924-01-01' or bdate>getdate()
--------------------------------------------------------------------
--- Data Standardization & consistency

select distinct gen,
case when upper(trim(gen)) in ('F','Female') then 'Female'
     when upper(trim(gen))in ('M','Male') then 'Male'
	 else 'n/a'
end as gen
from bronze.erp_cust_az12

-------------------------------------------------------------------------------

insert into silver.erp_cust_az12(
cid,bdate,gen
)

select 

case when cid like 'NAS%' then SUBSTRING(cid,4,LEN(cid))
     else cid
end as cid,
case  when bdate >getdate() then null
      else bdate
 end as bdate,
case when upper(trim(gen)) in ('F','Female') then 'Female'
     when upper(trim(gen))in ('M','Male') then 'Male'
	 else 'n/a'
end as gen
from bronze.erp_cust_az12
