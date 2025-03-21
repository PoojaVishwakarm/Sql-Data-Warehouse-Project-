select 
cid,cntry
from bronze.erp_loc_a101

select cst_key from silver.crm_cust_info
-----------------------------------------

select  
REPLACE(cid,'-','') cid,
cntry
from bronze.erp_loc_a101
where REPLACE(cid,'-','') not in

(select cst_key  from silver.crm_cust_info)
------------------------------------------------------
-- Data Standardization & Consistency

select distinct cntry
from silver.erp_loc_a101
order by cntry


-------------------------------------------------
insert into silver.erp_loc_a101(cid,cntry)

select  
REPLACE(cid,'-','') cid,
case when TRIM(cntry)='DE' then 'Germany'
     when TRIM(cntry) in ('US','USA') then 'United States'
	 when TRIM(cntry) ='' or cntry is null then 'n/a'
	 else TRIM(cntry)
end  as cntry---- normalize and hanle missing or black country codes
from bronze.erp_loc_a101
