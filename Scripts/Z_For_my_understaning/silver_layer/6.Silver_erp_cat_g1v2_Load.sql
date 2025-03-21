select * from bronze.erp_cat_g1v2

select * from silver.crm_prd_info
----------------------------------------------
--check for unwanted spaces

select * from bronze.erp_cat_g1v2
where cat !=TRIM(cat) or subcat !=TRIM(subcat)
-------------------------------------------------------------
--- Data Standardization & Consistency

select distinct
cat
from bronze.erp_cat_g1v2

----------------------------------------
insert into silver.erp_cat_g1v2(id,cat,subcat,maintenance)

select 
id,
cat,
subcat,maintenance
from bronze.erp_cat_g1v2




select * from silver.erp_cat_g1v2
