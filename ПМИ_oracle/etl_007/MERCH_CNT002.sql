 -- -1001 ^ Типы обслуживаемых карт 
select z1.Count_text, z2.Count_text_1, z1.Count_text - z2.Count_text_1 as dif  
from 
	(
	select count (*) as Count_text
	from prdn_db_dwh.t_chnl_class_val 
	where info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N') 
	and deleted_flag = 'N'
	and chnl_clsfctn_id = - 1001
		) as z1,

(select count (distinct a.CARD_TYPES) as Count_text_1
	from prd40_db_stg.B0571131410001_ACQ_TERMINAL a 
	where a.CARD_TYPES is not null ) as z2 

--и    
		
select a.ACQ_TERMINAL_LIST_ID, c.chnl_class_val_id from prd40_db_stg.B0571131410001_ACQ_TERMINAL a 
left join prd40_db_tmd.k_chnl_class_val b on a.ACQ_TERMINAL_LIST_ID = b.NK04_ACQ_TERMINAL_ID 
left join prdn_db_dwh.t_chnl_class_val  c on c.chnl_class_val_id = b.tgt_id 
and info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N') and deleted_flag = 'N' 
where a.CARD_TYPES in ('Магн.+ЧИП', 'Магн.+Чип', 'Магн.', 'ЧИП') 
and c.chnl_class_val_id is null 
	

--1004^ Тип доступа к УС (Общедоступный, С ограниченным доступом)
select z1.Count_text, z2.Count_text_1, z1.Count_text - z2.Count_text_1 as dif   -- -1004 ^ Типы доступа к УС 
from 
	(
	select count (*) as Count_text
	from prdn_db_dwh.t_chnl_class_val 
	where info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N')
	and deleted_flag = 'N'
	and chnl_clsfctn_id = - 1004 
		) as z1	,

	(select count (*) as Count_text_1
	from prd40_db_stg.B0571131410001_ACQ_TERM_ACCESS_TYPE  a 
	 ) as z2 

--и    
		
select a.ID, c.chnl_class_val_id, c.chnl_class_val_desc, a.NAME from prdn_db_stg.B0571131410009_ACQ_TM_ACS_TP  a  
left join prdn_db_tmd.k_chnl_class_val b on a.ID = b.NK04_TERM_ACC_TYPE_ID 
left join prdn_db_dwh.t_chnl_class_val  c on c.chnl_class_val_id = b.tgt_id 
and info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N') and deleted_flag = 'N' 
where c.chnl_class_val_desc not in (select distinct a.NAME from  prdn_db_stg.B0571131410009_ACQ_TM_ACS_TP a where a.NAME is not null) 
or c.chnl_class_val_id is null  
	
--и  
 --1005^ Собственник УС(Сбербанк, сторонняя организация) 
select z1.Count_text, z2.Count_text_1, z1.Count_text - z2.Count_text_1 as dif   -- -1005 ^ Собственник УС(Сбербанк, сторонняя организация)

from 
	(
	select count (*) as Count_text
	from prdn_db_dwh.t_chnl_class_val 
	where info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N')
	and deleted_flag = 'N'
	and chnl_clsfctn_id = - 1005
		) as z1	,

	(select count (*) as Count_text1
	from prd40_db_stg.B0571131410011_ACQ_TERM_PROPERTY_TYPE a 
	) as z2 

--и    
		
select a.ID, a. DESCRIPTION, c.chnl_class_val_id, c.chnl_class_val_desc  from prdn_db_stg.B0571131410011_ACQ_TERM_PROPERTY_TYPE a  
left join prdn_db_tmd.k_chnl_class_val b on a.ID = b.NK01_TERM_PROP_TYPE_ID 
left join prdn_db_dwh.t_chnl_class_val  c on c.chnl_class_val_id = b.tgt_id 
and info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N') and deleted_flag = 'N' 
where c.chnl_class_val_desc not in (select distinct a.DESCRIPTION from  prdn_db_stg.B0571131410011_ACQ_TERM_ACCESS_TYPE a where a.DESCRIPTION is not null) 
and c.chnl_class_val_id is null  

--и 
--1007^ Категория места установки (Свободный доступ, VIP место, Зарплатный) 

select z1.Count_text, z2.Count_text_1, z1.Count_text - z2.Count_text_1 as dif  -- -1007^ Категория места установки 
from 
	(
	select count (*) as Count_text
	from prdn_db_dwh.t_chnl_class_val 
	where info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N')
	and deleted_flag = 'N'
	and chnl_clsfctn_id = - 1007
		) as z1	,

	(select count (*) as Count_text1
	from prd40_db_stg.B0571131410012_ACQ_INST_PLACE_CAT a 
	 ) as z2 

--и    
		
select a.ID, c.chnl_class_val_id, c.chnl_class_val_desc, a.NAME from prdn_db_stg.B0571131410012_ACQ_INST_PLACE_CAT a   
left join prdn_db_tmd.k_chnl_class_val b on a.ID = b.NK02_INST_PL_CAT_ID 
left join prdn_db_dwh.t_chnl_class_val  c on c.chnl_class_val_id = b.tgt_id 
and info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N') and deleted_flag = 'N' 
where c.chnl_class_val_desc not in (select distinct a.NAME from  prdn_db_stg.B0571131410012_ACQ_INST_PLACE_CAT a where a.NAME is not null) 
or c.chnl_class_val_id is null  	


--и   
 --1008^ Категория вида размещения УС (Сбербанк, Предприятие)
select z1.Count_text, z2.Count_text_1, z1.Count_text - z2.Count_text_1 as dif   -- -1008^ Категория вида размещения УС (Сбербанк, Предприятие) 

from 
	(
	select count (*) as Count_text
	from prdn_db_dwh.t_chnl_class_val 
	where info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N')
	and deleted_flag = 'N'
	and chnl_clsfctn_id = - 1008
		) as z1	,

(select count (distinct a.INST_PLACE) as Count_text_1
	from prd40_db_stg.B0571131410001_ACQ_TERMINAL a 
	where a.INST_PLACE is not null ) as z2 

--и    
		
select a.ACQ_TERMINAL_LIST_ID, c.chnl_class_val_id,  a.INST_PLACE, c.chnl_class_val_desc  from prdn_db_stg.B0571131410001_ACQ_TERMINAL a  
left join prdn_db_tmd.k_chnl_class_val b on a.ACQ_TERMINAL_LIST_ID = b.NK04_ACQ_TERMINAL_ID 
left join prdn_db_dwh.t_chnl_class_val  c on c.chnl_class_val_id = b.tgt_id 
and info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N') and deleted_flag = 'N' 
where c.chnl_class_val_desc not in (select distinct a.INST_PLACE from  prdn_db_stg.B0571131410001_ACQ_TERMINAL a where a.INST_PLACE is not null) 
or c.chnl_class_val_id is null  	


--и    -1009^ Категория способа установки УС (Офисный, Через стену)
select z1.Count_text, z2.Count_text_1, z1.Count_text - z2.Count_text_1 as dif   ---1009^ Категория способа установки УС (Офисный, Через стену) 

from 
	(
	select count (*) as Count_text
	from prdn_db_dwh.t_chnl_class_val 
	where info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N')
	and deleted_flag = 'N'
	and chnl_clsfctn_id = - 1009
		) as z1,

	(select count (*) as Count_text1
	from prd40_db_stg.B0571131410013_ACQ_INST_TYPE a 
	) as z2 

--и    
		
select a.ID, c.chnl_class_val_id, c.chnl_class_val_desc, a.NAME from prdn_db_stg.B0571131410013_ACQ_INST_TYPE a 
left join prdn_db_tmd.k_chnl_class_val b on a.ID = b.NK03_INST_TYPE_ID 
left join prdn_db_dwh.t_chnl_class_val  c on c.chnl_class_val_id = b.tgt_id 
and info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N') and deleted_flag = 'N' 
where c.chnl_class_val_desc not in (select distinct a.NAME from  prdn_db_stg.B0571131410013_ACQ_INST_TYPE  a where a.NAME is not null) 
or c.chnl_class_val_id is null  	 

--и    -1012^ Тип режим работы УС(«круглосуточно», «в режиме работы места уст.»)
select z1.Count_text, z2.Count_text_1, z1.Count_text - z2.Count_text_1 as dif   -- -1012^ Тип режим работы УС(«круглосуточно», «в режиме работы места уст.»)

from 
	(
	select count (*) as Count_text
	from prdn_db_dwh.t_chnl_class_val 
	where info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N')
	and deleted_flag = 'N'
	and chnl_clsfctn_id = - 1012
		) as z1,

(select count (distinct a.WORK_TIME) as Count_text1
	from prd40_db_stg.B0571131410001_ACQ_TERMINAL a 
	where a.WORK_TIME  is not null ) as z2 

--и    
		
select a.ACQ_TERMINAL_LIST_ID, c.chnl_class_val_id,  a.WORK_TIME, c.chnl_class_val_desc from prdn_db_stg.B0571131410001_ACQ_TERMINAL a  
left join prdn_db_tmd.k_chnl_class_val b on a.ACQ_TERMINAL_LIST_ID = b.NK04_ACQ_TERMINAL_ID 
left join prdn_db_dwh.t_chnl_class_val  c on c.chnl_class_val_id = b.tgt_id 
and info_system_id in (select info_system_id from prdn_db_dwh.t_info_system where info_system_type_cd = '057' and deleted_flag ='N') and deleted_flag = 'N' 
where c.chnl_class_val_desc not in (select distinct a.WORK_TIME from  prdn_db_stg.B0571131410001_ACQ_TERMINAL a where a.WORK_TIME is not null) 
or c.chnl_class_val_id is null  	
