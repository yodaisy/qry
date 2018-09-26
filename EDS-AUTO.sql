
----- ############################################################
--- * *********** AUTOMATION    ***************************************************************************************************************************************************

select *
from DBREGRC.plan_prov_grp
where account_no in ('TT080313MB00001','TT069112MB00001','TT069202DB00001','TT069071MB00001','QK62165MB 00001','QK62027MB 00001','QK61855MB 00001','QK61440MB 00001','JK62197DB 00001',
'QK62132MB 00001','JK62150DB 00001','QK62536MB 00001')
;

--'JK62202MB%'
select *
from DBSYSTC.plan_prov_grp
where account_no like 'TT069090MP%' --(account_no like 'PE61743MB%'  or account_no like 'QK62302DL %')
and CONV_STAT_C <> 0
;

select *
from DBSYSTC.plan_prov_grp
where account_no like 'TT069090%'
and RELATED_GRP_TYP_C = 361
;

--if returns values this mean this plan exists in P3->plan
select *
from DBSYSTC.plan_prov_grp pgrp
where pgrp.account_no like 'TT06909%'
and pgrp.enrl_prov_grp_I in (select enrl_prov_grp_i from DBSYSTC.part_def_data where enrl_prov_grp_i = pgrp.enrl_prov_grp_i)
for fetch only with ur;
--PLAN_ENRL_I,       ENRL_PROV_GRP_I
--66200220732437520, 5211220732437520
--


select *
from DBSYSTC.plan_prov_grp pgrp
where pgrp.enrl_prov_grp_I in (71407655095665130)
;

select *
from DBSYSTC.plan_provision
where enrl_prov_grp_I = 71407655095665130  -- 5211220732437520 
and provision_i in (select class_prov_i from DBSYSTC.plan_class where class_prov_i = provision_i)
;
--return the class_code
--class_prov_i is provision_i
select *
from DBSYSTC.plan_class
where class_prov_i= 8162001732437520
;

-- it returns the class code of a plan
select * --pc.*
from DBSYSTC.plan_prov_grp pg,
     DBSYSTC.plan_provision pprov,
     DBSYSTC.plan_class pc
where pg.account_no like 'TT069090JM%'
and pg.enrl_prov_grp_i = pprov.enrl_prov_grp_i
and pprov.provision_i = pc.class_prov_i
FOR FETCH ONLY
;



--it returns all class code for a plan that exists in P3->plan
select * --pc.*
from DBSYSTC.plan_prov_grp pg,
     DBSYSTC.plan_provision pprov,
     DBSYSTC.plan_class pc
where pg.account_no in ( select account_no
						from DBSYSTC.plan_prov_grp pgrp
						where pgrp.account_no like 'QK62454LG 00001%'
						and pgrp.enrl_prov_grp_I in (select enrl_prov_grp_i from DBSYSTC.part_def_data where enrl_prov_grp_i = pgrp.enrl_prov_grp_i)
						)
and pg.enrl_prov_grp_i = pprov.enrl_prov_grp_i
and pprov.provision_i = pc.class_prov_i
FOR FETCH ONLY WITH UR
;

--list of division per plan
Select * FROM dbsystc.DIVISION_DATA WHERE CASE_NO = 'JK61095LG 00001'
--'QK61855JM 00001'   
;

Select distinct case_no
FROM dbsystc.DIVISION_DATA 
WHERE (ee_div_no ='CSI1' and case_no like 'JK6238%') or (ee_div_no ='CGI1' and case_no like 'JK6238%') or (ee_div_no ='AMS' and case_no like 'JK6238%')
;
--JK62385ZZ 00001 - AMS

Select distinct case_no
FROM dbsystc.DIVISION_DATA 
WHERE (ee_div_no ='CSI1' or ee_div_no ='CGI1' )
;



Select distinct case_no
FROM dbsystc.DIVISION_DATA 
WHERE 
ee_div_no ='6710'
;

SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE ee_div_no not in (Select distinct ee_div_no
	                    FROM dbsystc.DIVISION_DATA )
;

-- it returns plan numbers from employee that DO NOT has division configured in P3 -> plan -> division
-- and that do not have outbound file service active
--serv_typ_c = 16 => meaning "outbound file" service
--serv_offering_c = 0 => meaning the outbound file service is not activated
--serv_offering_c = 1 => meaning the outbound file service is activated
SELECT distinct ee.case_no
from  DBSYSTC.EMPLOYEE EE, dbsystc.DIVISION_DATA div
WHERE div.case_no <> ee.case_no
and ee.case_no in (
	                select pgrp.account_no
                    from DBSYSTC.plan_prov_grp pgrp
                    where pgrp.account_no = ee.case_no
                        and pgrp.enrl_prov_grp_I in (select enrl_prov_grp_i from DBSYSTC.part_def_data where enrl_prov_grp_i = pgrp.enrl_prov_grp_i)

                   )
and ee.case_no in (
						SELECT A.ACCOUNT_NO
						FROM DBSYSTc.PLAN_PROV_GRP  A, DBSYSTc.PLAN_PROVISION B, 
						     DBSYSTc.OUTSRC_SERVICE C, DBSYSTc.OUTSRC_DEFERRAL D   
						WHERE A.ENRL_PROV_GRP_I = B.ENRL_PROV_GRP_I 
						    AND B.PROVISION_I     = C.OUTSRC_I 
						    and C.OUTSRC_I = D.OUTSRC_I 
						AND C.SERV_TYP_C = 16
						AND C.SERV_OFFERING_C = 0  )
for fetch only with ur;


--to see number in each group setup in outsourcing tab for a plan number->enrol_prov_grp_i
SELECT * FROM DBSYSTC.OUTBND_PAY_GRP_DAT
WHERE ENRL_PROV_GRP_I = 5211220732437520
AND DATE(MOD_TS) = '2016-06-10'
FOR FETCH ONLY WITH UR;

-- for plan QK62454LG - it will return the pay group num configured. ex: PAY_GRP_NM= KSI0 KIC0 KII0 KCI0 KTCO TERM 0000
SELECT * FROM DBSYSTP.OUTBND_PAY_GRP_DAT
WHERE ENRL_PROV_GRP_I = 42791425095665361 -- 5211220732437520
FOR FETCH ONLY WITH UR;
;

---will show you list of ppts to be reported for deferrals
SELECT * FROM DBSYSTC.OUTBND_PE_DIV_DEF
WHERE OUTBND_ACT_I = 509403429459561
FOR FETCH ONLY WITH UR; 

---will show you list of loans to be reported 
SELECT * FROM DBSYSTP.OUTBND_PE_DIV_LOAN
WHERE OUTBND_ACT_I =509403429459561
FOR FETCH ONLY WITH UR;


SELECT * FROM DBSYSTC.OUTSRC_SERVICE 
;

-- returns the plan that are configured or not at the outbound file, according to serv_offering_c informed.
--serv_typ_c = 16 => se refere aos servicos de "outbound file"
--serv_offering_c = 0 => diz se que esse serviço nao está ativo
--serv_offering_c = 1 => diz se que esse serviço está ativo
SELECT A.ACCOUNT_NO, C.SERV_OFFERING_C, C.OUTSRC_I
FROM DBSYSTc.PLAN_PROV_GRP  A, DBSYSTc.PLAN_PROVISION B, 
     DBSYSTc.OUTSRC_SERVICE C, DBSYSTc.OUTSRC_DEFERRAL D   
WHERE A.ENRL_PROV_GRP_I = B.ENRL_PROV_GRP_I 
    AND B.PROVISION_I     = C.OUTSRC_I 
    and C.OUTSRC_I = D.OUTSRC_I 
AND C.SERV_TYP_C = 16
AND C.SERV_OFFERING_C = 1
FOR FETCH ONLY WITH UR; 



-- returns plans that are configured in the outbound file, and has group named CGI or CSI
SELECT ACCOUNT_NO as cont_no, pay_grp_nm as grp_nm, org_nm as org_nm
FROM  DBSYSTP.OUTBND_PAY_GRP_DAT  
WHERE org_nm IN ('ALL') AND account_no in ( SELECT A.ACCOUNT_NO
                                         FROM DBSYSTc.PLAN_PROV_GRP  A, DBSYSTc.PLAN_PROVISION B, 
                                              DBSYSTc.OUTSRC_SERVICE C, DBSYSTc.OUTSRC_DEFERRAL D   
                                         WHERE A.ENRL_PROV_GRP_I = B.ENRL_PROV_GRP_I 
                                         AND B.PROVISION_I     = C.OUTSRC_I 
                                         and C.OUTSRC_I = D.OUTSRC_I 
                                         AND C.SERV_TYP_C = 16
                                         AND C.SERV_OFFERING_C = 1
                                        )           
group by account_no, org_nm, pay_grp_nm
order by cont_no, org_nm, grp_nm 
FOR FETCH ONLY WITH UR;

SELECT ACCOUNT_NO as cont_no, pay_grp_nm as grp_nm, org_nm as org_nm
FROM  DBSYSTP.OUTBND_PAY_GRP_DAT  
WHERE pay_grp_nm IN ('ALL') AND account_no in ( SELECT A.ACCOUNT_NO
                                         FROM DBSYSTc.PLAN_PROV_GRP  A, DBSYSTc.PLAN_PROVISION B, 
                                              DBSYSTc.OUTSRC_SERVICE C, DBSYSTc.OUTSRC_DEFERRAL D   
                                         WHERE A.ENRL_PROV_GRP_I = B.ENRL_PROV_GRP_I 
                                         AND B.PROVISION_I     = C.OUTSRC_I 
                                         and C.OUTSRC_I = D.OUTSRC_I 
                                         AND C.SERV_TYP_C = 16
                                         AND C.SERV_OFFERING_C = 1
                                        )           
group by account_no, org_nm, pay_grp_nm
order by cont_no, org_nm, grp_nm 
FOR FETCH ONLY WITH UR;



SELECT account_no as cno, org_nm as onm, pay_grp_nm as grnm FROM DBSYSTP.OUTBND_PAY_GRP_DAT
WHERE ENRL_PROV_GRP_I = 11067543195665293 -- 5211220732437520
group by account_no, org_nm, pay_grp_nm
order by cno, onm, grnm
FOR FETCH ONLY WITH UR;
;
--OUTBND_ACT_I,ENRL_PROV_GRP_I,RPT_TYP_C,PAY_GRP_NM,PAYR_NEXT_RPT_D,ACCOUNT_NO,E_MAIL_ADDR
--572087608649661,42791425095665361,1,ALL,2013-07-03,JK60810NK 00001,SUSAN.RUHSER@TRANSAMERICA.COM


SELECT * FROM DBSYSTP.OUTBND_PAY_GRP_DAT
WHERE account_no = 'QK62360TR 00001' and pay_grp_nm = 'CSI'
order by mod_ts desc
FOR FETCH ONLY WITH UR;
;

SELECT distinct account_no FROM DBSYSTP.OUTBND_PAY_GRP_DAT
WHERE  pay_grp_nm = 'CGI' or pay_grp_nm = 'CSI'
FOR FETCH ONLY WITH UR;
;


--------------------------


select *
from DBREGRP.eds_enrl
for fetch only with ur;

select * from DBREGRC.part_auto_def
where soc_sec_no in ('003-62-3867')
for fetch only with ur;



-- DBREGRT ou C
SELECT * 
from  DBREGRC.EMPLOYEE
WHERE 
--CASE_NO ='QK62536MB 00001' 
  soc_sec_no in ( '999-99-9912','999-99-9913','999-99-9914','999-99-9915','999-99-9916','999-99-9917','999-99-9918','999-91-9919','999-99-1000','999-99-1001','023-44-0869','041-54-1025',
'150-44-3958')
--order by soc_sec_no
for fetch only with ur;

	

SELECT * 
from  DBREGRC.EMPLOYEE
WHERE 
--CASE_NO ='QK62536MB 00001' QK62158MB 00001
   soc_sec_no in ('999-99-1004', '999-99-1005' ) --'275-76-9187', '311-78-3373', '484-76-6357')
for fetch only with ur;

SELECT * 
from  DBREGRP.EDS_ENRL
WHERE 
--CASE_NO ='QK62536MB 00001' QK62158MB 00001
   soc_sec_no in ('999-99-1004', '999-99-1005' ) --('150-44-3958')
for fetch only with ur;



SELECT * FROM DBREGRC.EMPLOYEE
WHERE CASE_NO = 'QK62536MB 00001'
AND SOC_SEC_NO = '023-44-0869'

SELECT * FROM DBSYSTC.EDS_LOAD_DATA
WHERE SOC_SEC_NO = '023-44-0869'

SELECT * FROM DBSYSTC.EDS_ENRL
WHERE 
--CASE_NO = 'QK62536MB 00001'
 SOC_SEC_NO = '041-54-1025'
;

--get the list of valid remit codes for specific case number
SELECT PSD.SRC_I, PSD.SRC_TYP_C, PSD.TRANSLATION_C, PSD.SRC_S, PSD.DEFAULT_SRC_C, PSD.DIRECTED_SRC_C, PSD.ANNUAL_MTCH_C, PSD.COMBIN_DEFER_C, PSD.COMBIN_DEFER_LIM_P, PSD.CALC_FREQ_PER_C, PSD.CNDTL_CTRB_C, PSD.DEFER_CHG_PER_C, PSD.REINST_PER_C, PSD.DEFER_CHG_FREQ_CT, PSD.REINST_FREQ_CT, PSD.MAND_CTRB_EXCS_P, PSD.INTEG_LVL_C, PSD.MTCH_CTRB_DEPEND_C, PSD.SAFE_HRBR_MTCH_C, PSD.EFF_D, PSD.SRC_T, PSD.SRC_MIN_P, PSD.SRC_MIN_A, PSD.SRC_MAX_P, PSD.SRC_MAX_A, PSD.SRC_HCE_MIN_P, PSD.SRC_HCE_MAX_P, PSD.FORMULA_C, PSD.BKPT_I, PSD.ACTIVE_SRC_C, PSD.SETUP_COMPLETE_C, PSD.ENRL_ALLOW_C, PSD.REPORT_1_NM, PSD.REPORT_2_NM, PSD.SRC_HCE_LMT_A, PSD.SRC_HCE_LMT_P, PSD.SRC_LMT_P, PSD.SRC_LMT_A, PSD.FORMULA_HCE_C, PSD.PRINT_SEQ_NO, PSD.HCE_ALLOW_C, PSD.HCE_OVRD_C, PSD.CATCHUP_ALLOW_C, PSD.CATCHUP_MTCH_C, PSD.CATCHUP_METH_C, PSD.EXCS_BONUS_DEFER_C, PSD.EXCS_BONUS_DEFER_P, PSD.EXCS_BONUS_DEFER_A, PSD.HCE_SEP_FORMULA_C, PSD.SRC_REMIT_DISP_C, PSD.SRC_ALLOW_C, PSD.EXEC_HCE_ALLOW_C, PSD.SRC_EXEC_HCE_MAX_P, PSD.SRC_EXEC_HCE_MIN_P, PSD.DOC_NM, PSD.FORMULA_T, PSD.CTRB_CALC_DESC_T, PSD.DEFER_CHG_FREQ_T, PSD.REINST_FREQ_T, PSD.INTEG_LVL_DESC_T, PSD.FORMULA_HCE_T, PSD.USER_I, PSD.MOD_TS, PSD.AUTO_ENRL_DEF_C, PSD.AUTO_ENRL_DEF_P, PSD.DISTRIB_GRP_I, PSD.DEF_GRP_EFF_YR, PSD.ROTH_AUTO_ENRL_P, PSD.SP_REPORT_1_NM, PSD.SP_REPORT_2_NM, PSD.SPANISH_DOC_NM, PSD.RELATED_SRC_I, PSD.SUB_FORMULA_C, PSD.SUB_FORMULA_T, PSD.AUTO_ESCLT_C, PSD.AUTO_ESCLT_P, PSD.AUTO_ESCLT_MAX_P, PSD.AUTO_ESCLT_MMDD, PSD.AUTO_ESCLT_EFF_D, PSD.AUTO_ENRL_EFF_D, PSD.AUTO_ESCLT_GRP_C, PSD.DIST_GRP_EFF_YR, PSD.AUTO_ESCLT_INCR_C, PSD.AUTO_ESCLT_WAIT_NO, PSD.HCE_MAX_DEFER_A, PSD.EACA_EFF_D, PSD.EACA_IND_C, PSD.PPA_QACA_EFF_D, PSD.ER_CTRB_PFT_IND_C, PSD.AUTO_ENRL_APPLY_C, PSD.SIX_MONTH_REFUND_C, PSD.CREATION_TS, PSD.AUTO_RE_ENRL_C, PSD.AUTO_RE_ENRL_EFF_D, PSD.TRS_MNY_TYP_C, PSD.ALL_403B_CATCHUP_C, PSD.MONEY_TYP_NM, PSD.RELIUS_TYP_NM, PSD.EXT_SRC_C, PSD.HCE_4_ALLOW_C, PSD.HCE_4_MAX_P, PSD.HCE_4_MIN_P, PSD.DOC_APPL_OF_AE_C, PSD.ACA_ANY_EE_EXCL_C, PSD.ACA_ELIG_EE_EXCL_T, PSD.AE_AFF_ELEC_C, PSD.AE_AFF_ELEC_EXP_D, PSD.AE_AFF_ELEC_INC_P, PSD.AI_AFF_ELEC_C, PSD.AI_AFF_ELEC_INC_P, PSD.AI_AFF_ELEC_INC_MAX_P, PSD.AUTO_ESCLT_INITIAL_D, PSD.MTCH_CTRB_MAX_LIMIT_C, PSD.MTCH_CTRB_MAX_LIMIT_P, PSD.MTCH_CTRB_MAX_LIMIT_A, PSD.MTCH_CTRB_APPLIES_C, PSD.HCE_5_ALLOW_C, PSD.HCE_5_MAX_P, PSD.HCE_5_MIN_P, PSD.HCE_6_ALLOW_C, PSD.HCE_6_MAX_P, PSD.HCE_6_MIN_P, PSD.REQ_MAND_ELEC_C, PSD.REHIRE_AUTO_ENRL_C FROM   
	DBSYSTC.CO_SOURCE CS, 
	DBSYSTC.PLAN_PROV_GRP PPG, 
    DBSYSTC.PLAN_PROVISION PP, 
    DBSYSTC.PLAN_SRC_DETAIL PSD 
WHERE PPG.ACCOUNT_NO like 'JK62197PM 00001%'
AND PPG.ENRL_PROV_GRP_I = PP.ENRL_PROV_GRP_I
AND PP.PROV_TYP_C = 13
AND PP.PROVISION_I = PSD.SRC_I
AND PSD.SRC_TYP_C = CS.SRC_TYP_C
AND PSD.ACTIVE_SRC_C IN ('A')  FOR FETCH ONLY
;

SELECT * FROM   
	DBSYSTC.CO_SOURCE CS, 
	DBSYSTC.PLAN_PROV_GRP PPG, 
    DBSYSTC.PLAN_PROVISION PP, 
    DBSYSTC.PLAN_SRC_DETAIL PSD 
WHERE (PSD.REPORT_1_NM like '8%' or PSD.REPORT_2_NM like '8%')
AND PPG.ENRL_PROV_GRP_I = PP.ENRL_PROV_GRP_I
AND PP.PROV_TYP_C = 13
AND PP.PROVISION_I = PSD.SRC_I
AND PSD.SRC_TYP_C = CS.SRC_TYP_C
AND PSD.ACTIVE_SRC_C IN ('A')  FOR FETCH ONLY
;



--scenario 4.4
SELECT * FROM DBREGRC.EMPLOYEE
WHERE CASE_NO = 'JK62202MB 00001' and soc_sec_no in ('003-62-3867')
for fetch only with ur; 
--deferrals
select * from DBREGRC.part_def_data
where soc_sec_no in ('999-99-1002', '999-99-1003')
order by mod_ts desc;


--deferrals  corp
select *
from DBSYSTC.plan_prov_grp pgrp
where pgrp.account_no like 'QK62536%'-- 'JK62130%'
--'QK62158LY%'
--'JK62150FC%'
and pgrp.enrl_prov_grp_I in (select enrl_prov_grp_i from DBSYSTC.part_def_data where enrl_prov_grp_i = pgrp.enrl_prov_grp_i)
for fetch only with ur
;
--70943919652222739



select * from DBSYSTC.part_enrl_xref
where soc_sec_no in ('004-37-0834') and account_no = 'QK62454LG 00001' --('999-99-1003')
--ACCOUNT_NO,ENRL_PROV_GRP_I,RELATED_GRP_TYP_C,SOC_SEC_NO,PART_ENRL_I,PERSON_I,CREATE_TS,MOD_TS,SURROGATE_KEY
--JK62197PM 00001,21673123238594386,361,999-99-1003,6675043749483500,95675043749483500,2018-01-24-13.52.20.880578,2018-01-24-13.52.20.880578,106223446
;
select * from DBSYSTC.part_def_data
where ENRL_PROV_GRP_I=21673123238594386
;

select * from DBSYSTC.part_enrl_xref --part_def_data
where soc_sec_no in ('999-99-1003');
--part_enrol_i = 6675043749483500    
;
select * from DBSYSTC.part_enrl_xref
where part_enrl_i = 28040919652222739 ; 

--i created row for this SSN
select * from DBSYSTC.part_def_data
where 
--part_enrl_i = 28040919652222739 ;
soc_sec_no in ('999-99-1003',  '026-78-0537')
order by mod_ts desc;
*
--to automation queries
select * from DBSYSTC.part_def_data
where soc_sec_no = '026-78-0537' and stat_c = 'A'
order by mod_ts desc;

SELECT * FROM DBSYSTC.EMPLOYEE
WHERE soc_sec_no in ( '999-99-1004', '999-99-1005','026-78-0537' ) --,'999-99-1003') 026780537
and case_no = 'JK62197PM 00001' 
for fetch only with ur;

SELECT * FROM DBSYSTC.EMPLOYEE
WHERE soc_sec_no in ('026-78-0537')
and case_no = 'JK62197PM 00001'
for fetch only with ur;

--returns ENRL_PROV_GRP_I and PART_ENRL_I
select ACCOUNT_NO,SOC_SEC_NO,ENRL_PROV_GRP_I,PART_ENRL_I 
from DBSYSTC.part_enrl_xref
where account_no = 'JK62197PM 00001' and soc_sec_no = '026-78-0537'
for fetch only with ur

-- to automation queries
select * from DBSYSTC.part_def_data
where 
soc_sec_no = '026-78-0537' 
and ENRL_PROV_GRP_I = '21673123238594386'
and PART_ENRL_I = '40092305429686'
and stat_c = 'A'
order by mod_ts desc
;

--qry for automation
Update DBSYSTC.PART_DEF_DATA 
Set DEF_A=0.00, DEF_P=0.000, DATA_CH_ORIG_C = ''
where SOC_SEC_NO='026-78-0537' AND STAT_C='A' AND ENRL_PROV_GRP_I=21673123238594386 AND PART_ENRL_I=40092305429686 AND src_i = 30510975058594386 and def_grp_i = 46777513169142486
;


--join
select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
where xref.account_no = 'QK62158LY 00001' and xref.soc_sec_no = '487-16-2463'--'JK62197PM 00001' and xref.soc_sec_no = '026-78-0537'
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
--and dd.STAT_C='A'
order by dd.mod_ts desc
for fetch only with ur
--return  ENRL_PROV_GRP_I and PART_ENRL_I, SRC_I and DEF_GRP_I, DEF_A and DEF_P  of the newest active record
;

--PART_ENRL_I    ,ENRL_PROV_GRP_I,SOC_SEC_NO  ,DEF_GRP_I
--40092305429686,21673123238594386,026-78-0537,46777513169142486
select *
from DBSYSTC.eds_enrl
where ENRL_PROV_GRP_I = 21673123238594386
and soc_sec_no = '026-78-0537'
for fetch only with ur;

select *
from DBSYSTC.eds_enrl
where 
soc_sec_no = '026-78-0537'
for fetch only with ur;

select * from DBSYSTC.part_auto_def
where soc_sec_no = '026-78-0537' --and account_no = 'JK62197PM 00001'
for fetch only with ur;


-- regression
--sc 4.3
SELECT *
from  DBREGRC.EMPLOYEE
WHERE 
case_no = 'QK62158MB 00001' and
 soc_sec_no = '540-34-2314'
for fetch only with ur;

	

select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBREGRC.part_enrl_xref xref, DBREGRC.part_def_data dd
where xref.account_no = 'QK62158MB 00001' and xref.soc_sec_no = '540-34-2314' --xref.account_no = 'JK62130MB 00001' and xref.soc_sec_no = '534-52-1922'
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
--and dd.STAT_C='A'
order by dd.mod_ts desc
for fetch only with ur
;
select * from DBREGRC.part_def_data
where
 DEF_A > 0
--soc_sec_no = '539-46-8344'
;

-- sc 4.3  corp
SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
--case_no = 'QK62158LY 00001' and
soc_sec_no = '455-87-2928' --'896-34-5416' --'487-16-2463'
for fetch only with ur;
--join
select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
where xref.account_no = 'QK62158LY 00001' and xref.soc_sec_no = '896-34-5416' --'996-10-9297' -- '487-16-2463'
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
--and dd.STAT_C='A'
order by dd.mod_ts desc
for fetch only with ur
--return  ENRL_PROV_GRP_I and PART_ENRL_I, SRC_I and DEF_GRP_I, DEF_A and DEF_P  of the newest active record
;
select * from DBSYSTC.part_def_data
where DEF_A > 0
;
--get the list of valid remit codes for specific case number
SELECT PSD.SRC_I, PSD.SRC_TYP_C, PSD.TRANSLATION_C, PSD.SRC_S, PSD.DEFAULT_SRC_C, PSD.DIRECTED_SRC_C, PSD.ANNUAL_MTCH_C, PSD.COMBIN_DEFER_C, PSD.COMBIN_DEFER_LIM_P, PSD.CALC_FREQ_PER_C, PSD.CNDTL_CTRB_C, PSD.DEFER_CHG_PER_C, PSD.REINST_PER_C, PSD.DEFER_CHG_FREQ_CT, PSD.REINST_FREQ_CT, PSD.MAND_CTRB_EXCS_P, PSD.INTEG_LVL_C, PSD.MTCH_CTRB_DEPEND_C, PSD.SAFE_HRBR_MTCH_C, PSD.EFF_D, PSD.SRC_T, PSD.SRC_MIN_P, PSD.SRC_MIN_A, PSD.SRC_MAX_P, PSD.SRC_MAX_A, PSD.SRC_HCE_MIN_P, PSD.SRC_HCE_MAX_P, PSD.FORMULA_C, PSD.BKPT_I, PSD.ACTIVE_SRC_C, PSD.SETUP_COMPLETE_C, PSD.ENRL_ALLOW_C, PSD.REPORT_1_NM, PSD.REPORT_2_NM, PSD.SRC_HCE_LMT_A, PSD.SRC_HCE_LMT_P, PSD.SRC_LMT_P, PSD.SRC_LMT_A, PSD.FORMULA_HCE_C, PSD.PRINT_SEQ_NO, PSD.HCE_ALLOW_C, PSD.HCE_OVRD_C, PSD.CATCHUP_ALLOW_C, PSD.CATCHUP_MTCH_C, PSD.CATCHUP_METH_C, PSD.EXCS_BONUS_DEFER_C, PSD.EXCS_BONUS_DEFER_P, PSD.EXCS_BONUS_DEFER_A, PSD.HCE_SEP_FORMULA_C, PSD.SRC_REMIT_DISP_C, PSD.SRC_ALLOW_C, PSD.EXEC_HCE_ALLOW_C, PSD.SRC_EXEC_HCE_MAX_P, PSD.SRC_EXEC_HCE_MIN_P, PSD.DOC_NM, PSD.FORMULA_T, PSD.CTRB_CALC_DESC_T, PSD.DEFER_CHG_FREQ_T, PSD.REINST_FREQ_T, PSD.INTEG_LVL_DESC_T, PSD.FORMULA_HCE_T, PSD.USER_I, PSD.MOD_TS, PSD.AUTO_ENRL_DEF_C, PSD.AUTO_ENRL_DEF_P, PSD.DISTRIB_GRP_I, PSD.DEF_GRP_EFF_YR, PSD.ROTH_AUTO_ENRL_P, PSD.SP_REPORT_1_NM, PSD.SP_REPORT_2_NM, PSD.SPANISH_DOC_NM, PSD.RELATED_SRC_I, PSD.SUB_FORMULA_C, PSD.SUB_FORMULA_T, PSD.AUTO_ESCLT_C, PSD.AUTO_ESCLT_P, PSD.AUTO_ESCLT_MAX_P, PSD.AUTO_ESCLT_MMDD, PSD.AUTO_ESCLT_EFF_D, PSD.AUTO_ENRL_EFF_D, PSD.AUTO_ESCLT_GRP_C, PSD.DIST_GRP_EFF_YR, PSD.AUTO_ESCLT_INCR_C, PSD.AUTO_ESCLT_WAIT_NO, PSD.HCE_MAX_DEFER_A, PSD.EACA_EFF_D, PSD.EACA_IND_C, PSD.PPA_QACA_EFF_D, PSD.ER_CTRB_PFT_IND_C, PSD.AUTO_ENRL_APPLY_C, PSD.SIX_MONTH_REFUND_C, PSD.CREATION_TS, PSD.AUTO_RE_ENRL_C, PSD.AUTO_RE_ENRL_EFF_D, PSD.TRS_MNY_TYP_C, PSD.ALL_403B_CATCHUP_C, PSD.MONEY_TYP_NM, PSD.RELIUS_TYP_NM, PSD.EXT_SRC_C, PSD.HCE_4_ALLOW_C, PSD.HCE_4_MAX_P, PSD.HCE_4_MIN_P, PSD.DOC_APPL_OF_AE_C, PSD.ACA_ANY_EE_EXCL_C, PSD.ACA_ELIG_EE_EXCL_T, PSD.AE_AFF_ELEC_C, PSD.AE_AFF_ELEC_EXP_D, PSD.AE_AFF_ELEC_INC_P, PSD.AI_AFF_ELEC_C, PSD.AI_AFF_ELEC_INC_P, PSD.AI_AFF_ELEC_INC_MAX_P, PSD.AUTO_ESCLT_INITIAL_D, PSD.MTCH_CTRB_MAX_LIMIT_C, PSD.MTCH_CTRB_MAX_LIMIT_P, PSD.MTCH_CTRB_MAX_LIMIT_A, PSD.MTCH_CTRB_APPLIES_C, PSD.HCE_5_ALLOW_C, PSD.HCE_5_MAX_P, PSD.HCE_5_MIN_P, PSD.HCE_6_ALLOW_C, PSD.HCE_6_MAX_P, PSD.HCE_6_MIN_P, PSD.REQ_MAND_ELEC_C, PSD.REHIRE_AUTO_ENRL_C FROM   
	DBSYSTC.CO_SOURCE CS, 
	DBSYSTC.PLAN_PROV_GRP PPG, 
    DBSYSTC.PLAN_PROVISION PP, 
    DBSYSTC.PLAN_SRC_DETAIL PSD 
WHERE PPG.ACCOUNT_NO = 'QK61311KR 00001'
AND PPG.ENRL_PROV_GRP_I = PP.ENRL_PROV_GRP_I
AND PP.PROV_TYP_C = 13
AND PP.PROVISION_I = PSD.SRC_I
AND PSD.SRC_TYP_C = CS.SRC_TYP_C
AND PSD.ACTIVE_SRC_C IN ('A')  FOR FETCH ONLY
;

select * from DBSYSTC.PLAN_SRC_DETAIL PSD
where SRC_I = 30510975058594386 
and SRC_TYP_C = 3
and SRC_S = 6
and DEFAULT_SRC_C = 1
and FORMULA_C = 5
and ACTIVE_SRC_C = 'A'
and REPORT_1_NM = '401(k)'
and REPORT_2_NM = 'Elective'
;


UPDATE DBSYSTC.PLAN_SRC_DETAIL PSD
SET TRANSLATION_C = '6'
WHERE SRC_I = 30510975058594386 
and SRC_TYP_C = 3
and SRC_S = 6
and DEFAULT_SRC_C = 1
and FORMULA_C = 5
and ACTIVE_SRC_C = 'A'
and REPORT_1_NM = '401(k)'
and REPORT_2_NM = 'Elective'
;


select * from DBSYSTC.PLAN_SRC_DETAIL PSD
where SRC_I = 51809085058594386 
and SRC_TYP_C = 4
and SRC_S = 8
and DEFAULT_SRC_C = 1
and FORMULA_C = 1
and ACTIVE_SRC_C = 'A'
and REPORT_1_NM = 'Employer'
and REPORT_2_NM = 'Match'
;

UPDATE DBSYSTC.PLAN_SRC_DETAIL PSD
SET TRANSLATION_C = '8'
WHERE SRC_I = 51809085058594386 
and SRC_TYP_C = 4
and SRC_S = 8
and DEFAULT_SRC_C = 1
and FORMULA_C = 1
and ACTIVE_SRC_C = 'A'
and REPORT_1_NM = 'Employer'
and REPORT_2_NM = 'Match'
;





select *
from DBSYSTC.eds_enrl
where 
soc_sec_no = '896-34-5416' and CASE_NO = 'QK62158LY 00001'
for fetch only with ur;
;
select * from DBSYSTC.part_auto_def
where soc_sec_no = '896-34-5416' --and account_no = 'JK62197PM 00001'
for fetch only with ur;


-- sc 4.2  corp
--returns all CLASS CODE for a PLAN
select * --pc.*
from DBSYSTC.plan_prov_grp pg,
     DBSYSTC.plan_provision pprov,
     DBSYSTC.plan_class pc
where pg.account_no like 'Q51736    00001%'
and pg.enrl_prov_grp_i = pprov.enrl_prov_grp_i
and pprov.provision_i = pc.class_prov_i
FOR FETCH ONLY
;


--78614338540138387
select *
from DBSYSTC.plan_prov_grp
where account_no like '%62536%'
;
select *
from DBSYSTC.plan_provision
where enrl_prov_grp_I = 78614338540138387
and provision_i in (select class_prov_i from DBSYSTC.plan_class where class_prov_i = provision_i)
;
--plan_class.class_prov_i = plan_provision.provision_i
select *
from DBSYSTC.plan_class
where class_prov_i= 38956378540138387
;



SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
EE_DIV_NO = 'D001'
--and  EE_PAYROLL_FREQ_CD = 24
and case_no <> 'JK62130LH 00001'
for fetch only with ur
;
SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
case_no = 'QK62158TR 00001'
--'JK62476TR 00001'
and
soc_sec_no = '027-01-8990' 
--and EE_PAYROLL_FREQ_CD = 26
for fetch only with ur;

--sc 12
SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
case_no = 'QK62158TR 00001' and
--'JK62476TR 00001'
soc_sec_no = '004-70-4500' 
--and EE_PAYROLL_FREQ_CD = 26
for fetch only with ur;


UPDATE DBSYSTC.EMPLOYEE
SET EE_REHIRE_DT = NULL, EE_TERM_DT = '00000000'
WHERE CASE_NO = 'QK62158TR 00001' AND SOC_SEC_NO = '004-70-4500'
;


--sc 13 and 14

SELECT * 
from  DBSYSTC.EMPLOYEE
WHERE 
--CASE_NO ='QK62158TR 00001' and ee_div_no = 'NMI0'
  soc_sec_no in ( '999-99-1003')
--order by soc_sec_no
for fetch only with ur;

SELECT * 
from  DBSYSTC.EDS_ENRL
WHERE 
--CASE_NO ='QK62536MB 00001' 
  soc_sec_no in ('999-99-1002', '999-99-1003')
--order by soc_sec_no
for fetch only with ur;


SELECT *
from  DBSYSTC.eds_load_data
where soc_sec_no = '004-70-4500'
;

--sc 15

SELECT * 
from  DBSYSTC.EMPLOYEE
WHERE 
CASE_NO ='QK62158TR 00001' 
and  soc_sec_no in ('027-01-8990', '026-34-0961')
for fetch only with ur;

SELECT * 
from  DBSYSTC.EDS_ENRL
WHERE 
--CASE_NO ='QK62536MB 00001' 
  soc_sec_no in ('027-01-8990', '026-34-0961')
--order by soc_sec_no
for fetch only with ur;

--sc 16
SELECT * 
from  DBSYSTC.EMPLOYEE
WHERE 
CASE_NO ='QK62158TR 00001' and
--  ee_div_no = 'NMI0'
soc_sec_no = '024-22-0369'
for fetch only with ur;


--sc 19

--returns all CLASS_C for a PLAN
select * --pc.*
from DBSYSTC.plan_prov_grp pg,
     DBSYSTC.plan_provision pprov,
     DBSYSTC.plan_class pc
where pg.account_no like 'QK62158TR %'
and pg.enrl_prov_grp_i = pprov.enrl_prov_grp_i
and pprov.provision_i = pc.class_prov_i
FOR FETCH ONLY
;

--sc 18
UPDATE DBSYSTC.EMPLOYEE
SET EE_FST_MID_NM='JOHNPAUL'
WHERE CASE_NO = 'QK62158TR 00001' AND SOC_SEC_NO = '027-01-8990'

Update DBSYSTC.EMPLOYEE Set EE_FST_MID_NM='JOHNPAUL2' where CASE_NO='QK62158TR 00001' AND SOC_SEC_NO='027-01-8990';


Update DBSYSTC.EMPLOYEE Set EE_LAST_NM='MEENEN' where CASE_NO='QK62158TR 00001' AND SOC_SEC_NO='026-34-0961' 
;


--join
select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
where xref.account_no = 'QK62158TR 00001' and xref.soc_sec_no = '004-70-4500'     --and xref.soc_sec_no = '516-30-6584'--'007-11-8144' --'996-10-9297' -- '487-16-2463'
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
--and dd.DEF_A > 0
--and dd.STAT_C='A'
--order by dd.SOC_SEC_NO, dd.mod_ts desc
order by dd.mod_ts desc
for fetch only with ur
--return  ENRL_PROV_GRP_I and PART_ENRL_I, SRC_I and DEF_GRP_I, DEF_A and DEF_P  of the newest active record
;
--get the list of valid remit codes for specific case number
SELECT PSD.SRC_I, PPG.ACCOUNT_NO, PSD.SRC_TYP_C, PSD.TRANSLATION_C, PSD.SRC_S, PSD.DEFAULT_SRC_C, PSD.DIRECTED_SRC_C, PSD.ANNUAL_MTCH_C, PSD.COMBIN_DEFER_C, PSD.COMBIN_DEFER_LIM_P, PSD.CALC_FREQ_PER_C, PSD.CNDTL_CTRB_C, PSD.DEFER_CHG_PER_C, PSD.REINST_PER_C, PSD.DEFER_CHG_FREQ_CT, PSD.REINST_FREQ_CT, PSD.MAND_CTRB_EXCS_P, PSD.INTEG_LVL_C, PSD.MTCH_CTRB_DEPEND_C, PSD.SAFE_HRBR_MTCH_C, PSD.EFF_D, PSD.SRC_T, PSD.SRC_MIN_P, PSD.SRC_MIN_A, PSD.SRC_MAX_P, PSD.SRC_MAX_A, PSD.SRC_HCE_MIN_P, PSD.SRC_HCE_MAX_P, PSD.FORMULA_C, PSD.BKPT_I, PSD.ACTIVE_SRC_C, PSD.SETUP_COMPLETE_C, PSD.ENRL_ALLOW_C, PSD.REPORT_1_NM, PSD.REPORT_2_NM, PSD.SRC_HCE_LMT_A, PSD.SRC_HCE_LMT_P, PSD.SRC_LMT_P, PSD.SRC_LMT_A, PSD.FORMULA_HCE_C, PSD.PRINT_SEQ_NO, PSD.HCE_ALLOW_C, PSD.HCE_OVRD_C, PSD.CATCHUP_ALLOW_C, PSD.CATCHUP_MTCH_C, PSD.CATCHUP_METH_C, PSD.EXCS_BONUS_DEFER_C, PSD.EXCS_BONUS_DEFER_P, PSD.EXCS_BONUS_DEFER_A, PSD.HCE_SEP_FORMULA_C, PSD.SRC_REMIT_DISP_C, PSD.SRC_ALLOW_C, PSD.EXEC_HCE_ALLOW_C, PSD.SRC_EXEC_HCE_MAX_P, PSD.SRC_EXEC_HCE_MIN_P, PSD.DOC_NM, PSD.FORMULA_T, PSD.CTRB_CALC_DESC_T, PSD.DEFER_CHG_FREQ_T, PSD.REINST_FREQ_T, PSD.INTEG_LVL_DESC_T, PSD.FORMULA_HCE_T, PSD.USER_I, PSD.MOD_TS, PSD.AUTO_ENRL_DEF_C, PSD.AUTO_ENRL_DEF_P, PSD.DISTRIB_GRP_I, PSD.DEF_GRP_EFF_YR, PSD.ROTH_AUTO_ENRL_P, PSD.SP_REPORT_1_NM, PSD.SP_REPORT_2_NM, PSD.SPANISH_DOC_NM, PSD.RELATED_SRC_I, PSD.SUB_FORMULA_C, PSD.SUB_FORMULA_T, PSD.AUTO_ESCLT_C, PSD.AUTO_ESCLT_P, PSD.AUTO_ESCLT_MAX_P, PSD.AUTO_ESCLT_MMDD, PSD.AUTO_ESCLT_EFF_D, PSD.AUTO_ENRL_EFF_D, PSD.AUTO_ESCLT_GRP_C, PSD.DIST_GRP_EFF_YR, PSD.AUTO_ESCLT_INCR_C, PSD.AUTO_ESCLT_WAIT_NO, PSD.HCE_MAX_DEFER_A, PSD.EACA_EFF_D, PSD.EACA_IND_C, PSD.PPA_QACA_EFF_D, PSD.ER_CTRB_PFT_IND_C, PSD.AUTO_ENRL_APPLY_C, PSD.SIX_MONTH_REFUND_C, PSD.CREATION_TS, PSD.AUTO_RE_ENRL_C, PSD.AUTO_RE_ENRL_EFF_D, PSD.TRS_MNY_TYP_C, PSD.ALL_403B_CATCHUP_C, PSD.MONEY_TYP_NM, PSD.RELIUS_TYP_NM, PSD.EXT_SRC_C, PSD.HCE_4_ALLOW_C, PSD.HCE_4_MAX_P, PSD.HCE_4_MIN_P, PSD.DOC_APPL_OF_AE_C, PSD.ACA_ANY_EE_EXCL_C, PSD.ACA_ELIG_EE_EXCL_T, PSD.AE_AFF_ELEC_C, PSD.AE_AFF_ELEC_EXP_D, PSD.AE_AFF_ELEC_INC_P, PSD.AI_AFF_ELEC_C, PSD.AI_AFF_ELEC_INC_P, PSD.AI_AFF_ELEC_INC_MAX_P, PSD.AUTO_ESCLT_INITIAL_D, PSD.MTCH_CTRB_MAX_LIMIT_C, PSD.MTCH_CTRB_MAX_LIMIT_P, PSD.MTCH_CTRB_MAX_LIMIT_A, PSD.MTCH_CTRB_APPLIES_C, PSD.HCE_5_ALLOW_C, PSD.HCE_5_MAX_P, PSD.HCE_5_MIN_P, PSD.HCE_6_ALLOW_C, PSD.HCE_6_MAX_P, PSD.HCE_6_MIN_P, PSD.REQ_MAND_ELEC_C, PSD.REHIRE_AUTO_ENRL_C FROM   
	DBSYSTC.CO_SOURCE CS, 
	DBSYSTC.PLAN_PROV_GRP PPG, 
    DBSYSTC.PLAN_PROVISION PP, 
    DBSYSTC.PLAN_SRC_DETAIL PSD 
WHERE PPG.ACCOUNT_NO like 'QK62158TR 00001%'
AND PPG.ENRL_PROV_GRP_I = PP.ENRL_PROV_GRP_I
AND PP.PROV_TYP_C = 13
AND PP.PROVISION_I = PSD.SRC_I
AND PSD.SRC_TYP_C = CS.SRC_TYP_C
AND PSD.ACTIVE_SRC_C IN ('A')  FOR FETCH ONLY
;

SELECT PSD.SRC_I, PSD.SRC_TYP_C, PSD.TRANSLATION_C, PSD.SRC_S, PSD.DEFAULT_SRC_C, PSD.DIRECTED_SRC_C, PSD.ANNUAL_MTCH_C, PSD.COMBIN_DEFER_C, PSD.COMBIN_DEFER_LIM_P, PSD.CALC_FREQ_PER_C, PSD.CNDTL_CTRB_C, PSD.DEFER_CHG_PER_C, PSD.REINST_PER_C, PSD.DEFER_CHG_FREQ_CT, PSD.REINST_FREQ_CT, PSD.MAND_CTRB_EXCS_P, PSD.INTEG_LVL_C, PSD.MTCH_CTRB_DEPEND_C, PSD.SAFE_HRBR_MTCH_C, PSD.EFF_D, PSD.SRC_T, PSD.SRC_MIN_P, PSD.SRC_MIN_A, PSD.SRC_MAX_P, PSD.SRC_MAX_A, PSD.SRC_HCE_MIN_P, PSD.SRC_HCE_MAX_P, PSD.FORMULA_C, PSD.BKPT_I, PSD.ACTIVE_SRC_C, PSD.SETUP_COMPLETE_C, PSD.ENRL_ALLOW_C, PSD.REPORT_1_NM, PSD.REPORT_2_NM, PSD.SRC_HCE_LMT_A, PSD.SRC_HCE_LMT_P, PSD.SRC_LMT_P, PSD.SRC_LMT_A, PSD.FORMULA_HCE_C, PSD.PRINT_SEQ_NO, PSD.HCE_ALLOW_C, PSD.HCE_OVRD_C, PSD.CATCHUP_ALLOW_C, PSD.CATCHUP_MTCH_C, PSD.CATCHUP_METH_C, PSD.EXCS_BONUS_DEFER_C, PSD.EXCS_BONUS_DEFER_P, PSD.EXCS_BONUS_DEFER_A, PSD.HCE_SEP_FORMULA_C, PSD.SRC_REMIT_DISP_C, PSD.SRC_ALLOW_C, PSD.EXEC_HCE_ALLOW_C, PSD.SRC_EXEC_HCE_MAX_P, PSD.SRC_EXEC_HCE_MIN_P, PSD.DOC_NM, PSD.FORMULA_T, PSD.CTRB_CALC_DESC_T, PSD.DEFER_CHG_FREQ_T, PSD.REINST_FREQ_T, PSD.INTEG_LVL_DESC_T, PSD.FORMULA_HCE_T, PSD.USER_I, PSD.MOD_TS, PSD.AUTO_ENRL_DEF_C, PSD.AUTO_ENRL_DEF_P, PSD.DISTRIB_GRP_I, PSD.DEF_GRP_EFF_YR, PSD.ROTH_AUTO_ENRL_P, PSD.SP_REPORT_1_NM, PSD.SP_REPORT_2_NM, PSD.SPANISH_DOC_NM, PSD.RELATED_SRC_I, PSD.SUB_FORMULA_C, PSD.SUB_FORMULA_T, PSD.AUTO_ESCLT_C, PSD.AUTO_ESCLT_P, PSD.AUTO_ESCLT_MAX_P, PSD.AUTO_ESCLT_MMDD, PSD.AUTO_ESCLT_EFF_D, PSD.AUTO_ENRL_EFF_D, PSD.AUTO_ESCLT_GRP_C, PSD.DIST_GRP_EFF_YR, PSD.AUTO_ESCLT_INCR_C, PSD.AUTO_ESCLT_WAIT_NO, PSD.HCE_MAX_DEFER_A, PSD.EACA_EFF_D, PSD.EACA_IND_C, PSD.PPA_QACA_EFF_D, PSD.ER_CTRB_PFT_IND_C, PSD.AUTO_ENRL_APPLY_C, PSD.SIX_MONTH_REFUND_C, PSD.CREATION_TS, PSD.AUTO_RE_ENRL_C, PSD.AUTO_RE_ENRL_EFF_D, PSD.TRS_MNY_TYP_C, PSD.ALL_403B_CATCHUP_C, PSD.MONEY_TYP_NM, PSD.RELIUS_TYP_NM, PSD.EXT_SRC_C, PSD.HCE_4_ALLOW_C, PSD.HCE_4_MAX_P, PSD.HCE_4_MIN_P, PSD.DOC_APPL_OF_AE_C, PSD.ACA_ANY_EE_EXCL_C, PSD.ACA_ELIG_EE_EXCL_T, PSD.AE_AFF_ELEC_C, PSD.AE_AFF_ELEC_EXP_D, PSD.AE_AFF_ELEC_INC_P, PSD.AI_AFF_ELEC_C, PSD.AI_AFF_ELEC_INC_P, PSD.AI_AFF_ELEC_INC_MAX_P, PSD.AUTO_ESCLT_INITIAL_D, PSD.MTCH_CTRB_MAX_LIMIT_C, PSD.MTCH_CTRB_MAX_LIMIT_P, PSD.MTCH_CTRB_MAX_LIMIT_A, PSD.MTCH_CTRB_APPLIES_C, PSD.HCE_5_ALLOW_C, PSD.HCE_5_MAX_P, PSD.HCE_5_MIN_P, PSD.HCE_6_ALLOW_C, PSD.HCE_6_MAX_P, PSD.HCE_6_MIN_P, PSD.REQ_MAND_ELEC_C, PSD.REHIRE_AUTO_ENRL_C     --psd.TRANSLATION_C 
FROM   DBSYSTC.CO_SOURCE CS, 
       DBSYSTC.PLAN_PROV_GRP PPG, 
       DBSYSTC.PLAN_PROVISION PP, 
       DBSYSTC.PLAN_SRC_DETAIL PSD 
WHERE  PSD.TRANSLATION_C like '6%'  --PPG.ACCOUNT_NO ='JK62197PM 00001'  
      AND PPG.ENRL_PROV_GRP_I = PP.ENRL_PROV_GRP_I 
      AND PP.PROV_TYP_C = 13 
      AND PP.PROVISION_I = PSD.SRC_I 
      AND PSD.SRC_TYP_C = CS.SRC_TYP_C 
                --AND CS.CTRB_SRC_C = '1'
      AND PSD.ACTIVE_SRC_C IN ('A')
FOR FETCH ONLY WITH UR;

select * from DBSYSTC.PLAN_PROVISION;

select *
from DBSYSTC.eds_enrl
where 
soc_sec_no = '896-34-5416' and CASE_NO = 'QK62158LY 00001'
for fetch only with ur;
;
select * from DBSYSTC.part_auto_def
where soc_sec_no = '896-34-5416' --and account_no = 'JK62197PM 00001'
for fetch only with ur;

select * from DBSYSTC.part_def_data
where soc_sec_no = '896-34-5416' --and account_no = 'JK62197PM 00001'
for fetch only with ur;

SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
soc_sec_no = '896-34-5416' 
for fetch only with ur;


--sc4.1
SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
case_no = 'QK62158TA 00001'
 and
soc_sec_no = '796-11-4637' 
for fetch only with ur;


--sc 5.2 - 26


SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
case_no = 'JK62197PM 00001'
 and
soc_sec_no = '999-99-9007' 
for fetch only with ur;

--remit
select * from DBSYSTC.BILL_REMIT_DETAIL
where --tr_ref_no like '20180219922225%'
--or  soc_sec_no = '999-99-1005' ;
case_no = 'QK61311KR 00001'
for fetch only with ur;

select * from DBSYSTC.EDS_BILL_REMIT
where soc_sec_no = '999-99-1005' 
for fetch only with ur;
-- result:
--CASE_NO,SOC_SEC_NO,TR_REF_NO,BILL_SUBM_AMT
--JK62197PM 00001,999-99-1005,20180219922225,100.00
--JK62197PM 00001,999-99-1005,20180219922225,200.00

--EDS_ENRL
--EDS_ADDRESS
--EDS_HOURS

--sc 5.3 - 27

SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
case_no = 'JK62197PM 00001'
 and
soc_sec_no in ( '003-31-7251', '043-28-8430' )
for fetch only with ur;

--sc 5.1 to 5.4


SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
soc_sec_no in ( '999-71-1001','999-72-1001','999-73-1001','999-74-1001' )
for fetch only with ur;




-- remit 6 => SRC_I = 30510975058594386 
-- remit 8 => SRC_I = 51809085058594386 
--remit
select * from DBSYSTC.BILL_REMIT_DETAIL
where --tr_ref_no like '20180219922225%'
case_no = 'JK62197PM 00001'
and soc_sec_no = '003-31-7251' 
and SRC_I = 30510975058594386 
for fetch only with ur;

select * from DBSYSTC.EDS_BILL_REMIT
where soc_sec_no in ( '003-31-7251', '043-28-8430' )
order by mod_ts desc
for fetch only with ur;


--sc 6.1 - sc 28

select *
from DBSYSTC.plan_prov_grp
where (account_no like 'PE61743%'  or account_no like 'QK62302DL %')
and CONV_STAT_C <> 0
;
--PE61743DB 00001

--clas code
select * --pc.*
from DBSYSTC.plan_prov_grp pg,
     DBSYSTC.plan_provision pprov,
     DBSYSTC.plan_class pc
where pg.account_no like 'QK62158LY%'-- 'PE61743DB%'
and pg.enrl_prov_grp_i = pprov.enrl_prov_grp_i
and pprov.provision_i = pc.class_prov_i
FOR FETCH ONLY
;


--clas code - regression
select * --pc.*
from DBREGRC.plan_prov_grp pg,
     DBREGRC.plan_provision pprov,
     DBREGRC.plan_class pc
where pg.account_no like 'PE61743MB%'-- 'PE61743DB%'
and pg.enrl_prov_grp_i = pprov.enrl_prov_grp_i
and pprov.provision_i = pc.class_prov_i
FOR FETCH ONLY
;


select *
from DBSYSTC.plan_prov_grp pgrp
where pgrp.account_no like 'JK62202MB%'
and pgrp.enrl_prov_grp_I in (select enrl_prov_grp_i from DBSYSTC.part_def_data where enrl_prov_grp_i = pgrp.enrl_prov_grp_i)
for fetch only with ur;

SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
--case_no = 'PE61743DB 00001' and class_i = 0
soc_sec_no in ( '999-99-1007',  '999-99-1008')
for fetch only with ur;



--sc 7.1 to 7.4  - 31 to 34

-- Will list the services available for enrollment along with their respective code.
SELECT   *
FROM     DBSYSTC.HELPER2
WHERE    HLP_CODE like 'SERVICES%';
--retuned:
--PKG_ID,HLP_CODE,HLP_VALUE,HLP_LINE_NO,HLP_TEXT
--CORP,SERVICES,6001,006001,Portfolio Xpress
--CORP,SERVICES,6003,006003,Secure Plan For Life

------
SET CURRENT_SCHEMA = 'DBSYSTC';

--PX - plan with serv_typ_c = 6001
SELECT DISTINCT   
         ESD.SOC_SEC_NO,
         ESD.CUSTOMER_SIGNIN_I,
         ESD.PASS_WORD,
         PSD.ACCOUNT_NO,
         PSD.SOC_SEC_NO,
         PSD.SERV_TYP_C,
         H2.HLP_CODE,
         H2.HLP_TEXT
FROM     DBSYSTC.PART_SERVICE_DATA PSD,
         DBSYSTC.HELPER2 H2,
         DBSYSTC.EE_SECURE_DATA ESD
WHERE    ESD.SOC_SEC_NO = PSD.SOC_SEC_NO
AND      H2.HLP_CODE = 'SERVICES'
AND      H2.HLP_VALUE = '6001'
AND      PSD.SERV_TYP_C = '6001'
FOR FETCH ONLY;

--SPL - plan with serv_typ_c = 6003
SELECT DISTINCT   
         ESD.SOC_SEC_NO,
         ESD.CUSTOMER_SIGNIN_I,
         ESD.PASS_WORD,
         PSD.ACCOUNT_NO,
         PSD.SOC_SEC_NO,
         PSD.SERV_TYP_C,
	     PSD.SERV_STAT_C,
         H2.HLP_CODE,
         H2.HLP_TEXT
FROM     DBSYSTC.PART_SERVICE_DATA PSD,
         DBSYSTC.HELPER2 H2,
         DBSYSTC.EE_SECURE_DATA ESD
WHERE    ESD.SOC_SEC_NO = PSD.SOC_SEC_NO
AND      H2.HLP_CODE = 'SERVICES'
AND      H2.HLP_VALUE = '6003'
AND      PSD.SERV_TYP_C = '6003'
--AND      PSD.ACCOUNT_NO in (SELECT case_no from  DBSYSTC.EMPLOYEE WHERE ee_div_no = 'MSWC' )
FOR FETCH ONLY;


--SPL
SELECT *
FROM     DBREGRC.PART_SERVICE_DATA PSD,
         DBREGRC.HELPER2 H2,
         DBREGRC.EE_SECURE_DATA ESD
WHERE    ESD.SOC_SEC_NO = PSD.SOC_SEC_NO
AND      H2.HLP_CODE = 'SERVICES'
AND      H2.HLP_VALUE = '6003'
AND      PSD.SERV_TYP_C = '6003'
AND      PSD.ACCOUNT_NO = 'QK62302DL 00001'
FOR FETCH ONLY;

------
select *
from DBSYSTC.plan_prov_grp
where (account_no like '%62302%'  or account_no like '%62343%' or account_no like '%62329%' or account_no like '%080313%')
and RELATED_GRP_TYP_C = 361
and TAKEOVER_CARRIER_IND_C = 0
;

SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
soc_sec_no in ('999-71-1001', '999-72-1001', '999-73-1001', '999-74-1001')
for fetch only with ur;

select *
from DBREGRC.plan_prov_grp
where (account_no like 'QK62302DL%'  or account_no like 'QK62343DB%' or account_no like 'JK62329RW%' or account_no like 'TT080313MB%')
;

SELECT *
from  DBREGRC.EMPLOYEE
WHERE 
--case_no = 'PE61743DB 00001' and class_i = 0
soc_sec_no in ('999-71-1001', '999-72-1001', '999-73-1001', '999-74-1001')
for fetch only with ur;

select *
from DBREGRC.eds_enrl
where 
soc_sec_no in ('999-71-1001', '999-72-1001', '999-73-1001', '999-74-1001')
for fetch only with ur;
;

--sc 34


SELECT *
from  DBSYSTC.PART_PPA_DEFAULT
WHERE ACCOUNT_NO = '932256    00004' and SOC_SEC_NO = '976-11-2157'
--932256    00004,976-11-2157
--ENRL_PROV_GRP_I,PART_ENRL_I
--1045558123494,624928233818946
;

SELECT *
from  DBSYSTC.PART_PPA_DEFAULT PD, DBSYSTC.PART_ELECT_DETAIL EDT
WHERE PD.account_no = '651744RT  00001' --and PD.soc_sec_no = '976-11-2157'
and  PD.ENRL_PROV_GRP_I = EDT.ENRL_PROV_GRP_I
and  PD.PART_ENRL_I = EDT.PART_ENRL_I 
;

--sc 10.1

select *
from DBSYSTC.plan_prov_grp
where (account_no like 'TT069090%' )
and RELATED_GRP_TYP_C = 361
and TAKEOVER_CARRIER_IND_C = 0
;

--clas code - corp
select * --pc.*
from DBSYSTC.plan_prov_grp pg,
     DBSYSTC.plan_provision pprov,
     DBSYSTC.plan_class pc
where pg.account_no like 'JK62250LY 00001%'--'TT069090%'
and pg.enrl_prov_grp_i = pprov.enrl_prov_grp_i
and pprov.provision_i = pc.class_prov_i
FOR FETCH ONLY
;


SELECT *
from   DBSYSTC.EMPLOYEE
WHERE 
case_no like 'TT069090TA%' 
order by mod_ts desc;

SELECT *
from   DBSYSTC.EMPLOYEE
WHERE 
ALT_TERM_REASON_CD <> ''
for fetch only with ur;

SELECT *
from  DBSYSTC.EMPLOYEE
WHERE 
ee_div_no = '1600' 
--case_no like 'TT0690%' 
--soc_sec_no in  ('002-52-1239', '002-62-4773', '003-60-4711') --('002-52-1239', '002-62-4773', '003-60-4711', '004-44-7746')
for fetch only with ur;

--ALT_TERM_REASON_CD values
SELECT * 
FROM DBSYSTC.HELPER2
WHERE HLP_CODE = 'ALTTERMR'
FOR FETCH ONLY WITH UR; 


--sc 10.6


SELECT CASE_NO, SOC_SEC_NO, EE_DIV_NO, ER_DIV_NO, KEY_PER_STAT_CD, EE_BRTH_DT, EE_PLAN_ENTRY_DT, EE_HIRE_DT, EE_TERM_DT, EE_NO, EE_FST_MID_NM, EE_LAST_NM, EE_SEX_CD, EMPL_STAT_CD, PART_STAT_CD, EE_MARITAL_STAT_CD, EE_REHIRE_DT, EE_REENTRY_DT, MIDDLE_NM, class_i, MOD_TS 
FROM DBSYSTC.EMPLOYEE
WHERE 
ee_div_no = '6704' --CASE_NO like 'TT0690%'
for fetch only with ur
;


--sc 10.1
SELECT CASE_NO, SOC_SEC_NO, EE_DIV_NO, ER_DIV_NO, KEY_PER_STAT_CD, EE_BRTH_DT, EE_HIRE_DT, EE_TERM_DT, EE_FST_MID_NM, EE_LAST_NM, EE_MARITAL_STAT_CD, EE_REHIRE_DT, EE_SEX_CD, EMPL_STAT_CD, PART_STAT_CD, class_i, MOD_TS 
FROM DBSYSTC.EMPLOYEE
WHERE 
--CASE_NO = 'TT080332LK00001'
SOC_SEC_NO in ( '002-52-1239', '002-62-4773', '003-60-4711', '004-44-7746')
;


SELECT CASE_NO, SOC_SEC_NO, EE_DIV_NO, ER_DIV_NO, KEY_PER_STAT_CD, EE_BRTH_DT, EE_HIRE_DT, EE_TERM_DT, EE_FST_MID_NM, EE_LAST_NM, EE_MARITAL_STAT_CD, EE_REHIRE_DT, EE_SEX_CD, EMPL_STAT_CD, PART_STAT_CD, class_i, MOD_TS 
FROM DBSYSTC.EMPLOYEE
WHERE 
SOC_SEC_NO in ( '527-11-1717','065-42-6056','434-27-8948','567-64-0824')

;


-----------

--join
select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
where xref.account_no = 'QK62158TA 00001' and xref.soc_sec_no = '796-11-4637' -- '516-30-6584'--'007-11-8144' --'996-10-9297' -- '487-16-2463'
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
--and dd.DEF_P > 0
--and dd.STAT_C='A'
--order by dd.SOC_SEC_NO, dd.mod_ts desc
order by dd.STAT_C, dd.mod_ts desc
for fetch only with ur
;

-- new sc 31 - sc 11.1


SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'001-44-2482',
'004-50-2815',
'005-86-3116' )
for fetch only with ur
;

select * from DBSYSTC.part_def_data
where soc_sec_no in (
'001-44-2482',
'004-50-2815',
'005-86-3116' )
order by mod_ts desc;


-- new sc 34 - sc 12.1  to   37


SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'074-70-3780',
'006-72-5841',
'002-90-6609',
'003-58-7148' )
for fetch only with ur
;

select * from DBSYSTC.part_def_data
where soc_sec_no in (
'074-70-3780',
'006-72-5841',
'002-90-6609',
'003-58-7148' )
order by mod_ts desc;


--************************************************************************************


SELECT * FROM DBREGRC.EDS_LOAD_DATA
;

Select * from DBSYSTC.EDS_LOAD_DATA 
order by mod_ts desc
for fetch only;

WHERE DATA_ACT_FILE_I=80317715195469070

SELECT * FROM DBREGRC.EDS_LOAD_MAP
;

SELECT * from DBREGRC.EDS_BATCH_QUEUE
WHERE DATA_ACT_FILE_I in (79229803318743500)
for fetch only;

--corp test

--sc4.3

select * from DBSYSTC.EMPLOYEE
where 
case_no =  'QK62158SA 00001' -- 'QK62158TR 00001'
and soc_sec_no in ('395-55-3131')--('026-34-0961', '046-09-5987')
for fetch only;

select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
where 
xref.account_no = 'QK62158SA 00001' 
and xref.soc_sec_no = '395-55-3131' --'896-34-5416' -- '516-30-6584'--'007-11-8144' --'996-10-9297' -- '487-16-2463'
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
--and dd.DEF_P > 0
--and dd.transmit_c = 'T'
--and dd.STAT_C='A'
--order by dd.SOC_SEC_NO, dd.mod_ts desc
order by dd.STAT_C, dd.mod_ts desc
for fetch only with ur;


--sc 4.4  --'999-99-1003', '003-62-3867')

--sc 5.2 - 26
select *--CASE_NO,SOC_SEC_NO,EE_DIV_NO,ER_DIV_NO,EMPL_STAT_CD,CLASS_I,EE_SUB_LOCATION,UNION_IND_C,FULL_PART_IND_C,EE_BRTH_DT,EE_HIRE_DT,EE_FST_MID_NM,EE_LAST_NM,EE_REHIRE_DT,PART_STAT_CD,EE_CYC_DT,ELIG_PRC_STAT_C,MOD_TS
from DBSYSTC.EMPLOYEE
where 
soc_sec_no in ('999-99-1005', '999-99-1006', '999-99-1007')
for fetch only;

select *
from DBSYSTC.EDS_ENRL
where soc_sec_no in ('999-99-1005')
for fetch only;


select *
from DBSYSTC.EE_BEN_ADDRES
where soc_sec_no in ('999-99-1005')
for fetch only;


select *
from DBSYSTC.EE_HRS_WORKED
where soc_sec_no in ('999-99-1005') and case_no = 'JK62197PM 00001'
for fetch only;


select *
from DBSYSTC.BILL_REMIT_DETAIL
where soc_sec_no in ('999-99-1005')
 and case_no = 'JK62197PM 00001'
for fetch only;


select *
from DBSYSTC.EDS_ENRL
where soc_sec_no in ('999-99-1005')
for fetch only;


select *
from DBSYSTC.EDS_ADDRESS
where soc_sec_no in ('999-99-1005') and case_no = 'JK62197PM 00001'
for fetch only;


select *
from DBSYSTC.EDS_HOURS
where soc_sec_no in ('999-99-1005')
for fetch only;


select *
from DBSYSTC.EDS_BILL_REMIT
where soc_sec_no in ('999-99-1005')
for fetch only;

-- from sc 10.5 - rehire



SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in ('002-62-4773','005-84-4121', '274-82-0573',
'271-80-5864',
'228-17-2254',
'163-52-6948',
'063-54-3671',
'270-76-1436',
'271-68-0146')
;



--test corp
SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE CASE_NO in ('TT080313MB 00001','TT069112MB 00001','TT069202DB 00001','TT069071MB 00001','QK62165MB 00001','QK62027MB 00001','QK61855MB 00001','QK61440MB 00001','JK62197DB 00001','QK62132MB 00001')
;

--test corp
select * from DBSYSTC.PLAN_PROV_GRP
where account_no in ('QK62158LY 00001')
--('TT080313MB 00001','TT069112MB 00001','TT069202DB 00001','TT069071MB 00001','QK62165MB 00001','QK62027MB 00001','QK61855MB 00001','QK61440MB 00001','JK62197DB 00001','QK62132MB 00001')
FOR FETCH ONLY WITH UR;

select * from DBSYSTC.PLAN_PROV_GRP
where account_no like '%62202%'
FOR FETCH ONLY WITH UR;

SELECT *
FROM DBSYSTC.PLAN_CLASS
WHERE CLASS_I=91855506081903125 --9320646235960500; 
;

SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE CASE_NO = 'JK62385LG 00001'
FOR FETCH ONLY WITH UR;

---------------------------------------------------------------sc term date


SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT,EE_MARITAL_STAT_CD,EE_PAYROLL_FREQ_CD, ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'551-57-9680',
'003-58-7148',
'772-16-3184',
'010720872')
--and case_no like 'QK62454%'
;
'576-46-8384',
'004-37-0834',
'037-14-6031',
'003-85-1498',
'004-16-5669',
'027-11-7642',
'017-51-7924',
'006-66-4164',
'772-16-3184',
'010-72-0872',
'001-38-6984',
'001-44-2482',
'004-50-2815',
'005-86-3116',
'001-36-6685',
'003-78-6360',
'009-62-6332',
'074-70-3780',
'006-72-5841',

-- sc 9 to 11


SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE ee_div_no like 'CSI%'
and EE_PAYROLL_FREQ_CD = '24'
for fetch only with ur
;


-- *****  sc 1 to 8

SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'067-42-4842',
'568-97-0563',
'395-60-4266',
'156-46-7907',
'527-11-1717',
'065-42-6056',
'434-27-8948',
'567-64-0824'
 )
for fetch only with ur
;

select * from DBSYSTC.part_def_data
where soc_sec_no in (
'067-42-4842',
'568-97-0563',
'395-60-4266',
'156-46-7907',
'527-11-1717',
'065-42-6056',
'434-27-8948',
'567-64-0824'
  )
order by soc_sec_no, mod_ts desc;
;

--sc 5 and 6

SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'527-11-1717','065-42-6056')
;

select * from DBSYSTC.part_def_data
where soc_sec_no in (
'527-11-1717','065-42-6056')
;

--sc 7 and 8

SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'434-27-8948','567-64-0824')
;

select * from DBSYSTC.part_def_data
where soc_sec_no in (
'434-27-8948','567-64-0824')
;




-- to duplicate deferral row from an existing ppt
-- fisrt:
--	a) Probably there are 2 rows for each SSN (stat_=A). you must to duplicate each row, updating the values for yours SSN, PART_ENRL_I and ENRL_PROV_GRP_I

--	b) Use this qry to CONSULT your PART_ENL_I and ENRL_PROV_GRP_I to insert data into Part_def_data
			SELECT   *
			FROM     DBSYSTC.part_enrl_xref
			WHERE    soc_sec_no like '004-50-2815%'
			--AND account_no = 'Q51680    00001' 
			FOR FETCH ONLY WITH UR;
--	c) then insert the new deferral row informing the SSN , PART_ENRL_I, ENRL_PROV_GRP_I,  DEF_A and DEF_P,  MODT_TS (current date), EFF_D (current date)

			Insert into 
			DBSYSTC.PART_DEF_DATA (PART_ENRL_I, ENRL_PROV_GRP_I, SOC_SEC_NO, DEF_GRP_I, DEF_A, DEF_P, EFF_YR, STAT_C, SRC_C, USER_I, MOD_TS, TRANSMIT_C, EFF_D, DATA_CH_ORIG_C, SRC_I, CONF_CHG_C, DIV_I, CATCHUP_A, CATCHUP_EFF_D, CATCHUP_P, START_D, DEF_CHNG_REASON_C, TRIMESTER_BONUS_C, CATCHUP_ELEC_C, OBF_TRIG_EFF_D, OBF_TRIG_REASON_C, REVERSE_FEED_TRANSMIT_C, REVERSE_FEED_PROCESS_TS) 
            VALUES(47659593279224500, 11067543195665293, '??', 34157522294919393, 0.00, 3.000, 0, 'A', '3', 'developer', '2018-03-15-11.07.14.670581', 'T', '2018-03-15', '3', 18900898995665293, 1, 57576687363872393, 0.00, Null, 0.000, Null, 1, '', '0', '1001-01-01', 0, 0, Null) ;


			-- sc 32

			Insert into DBSYSTC.PART_DEF_DATA (PART_ENRL_I, ENRL_PROV_GRP_I, SOC_SEC_NO, DEF_GRP_I, DEF_A, DEF_P, EFF_YR, STAT_C, SRC_C, USER_I, MOD_TS, TRANSMIT_C, EFF_D, DATA_CH_ORIG_C, SRC_I, CONF_CHG_C, DIV_I, CATCHUP_A, CATCHUP_EFF_D, CATCHUP_P, START_D, DEF_CHNG_REASON_C, TRIMESTER_BONUS_C, CATCHUP_ELEC_C, OBF_TRIG_EFF_D, OBF_TRIG_REASON_C, REVERSE_FEED_TRANSMIT_C, REVERSE_FEED_PROCESS_TS) 
            VALUES(47659593279224500, 11067543195665293, '004-50-2815', 79833722294919393, 0.00, 5.000, 0, 'A', '3', 'developer', '2018-03-15-19.53.16.945672', 'A', '2018-03-15', '3', 36171538656119393, 1, 57576687363872393, 0.00, Null, 0.000, Null, 1, '', '0', '1001-01-01', 0, 0, Null)
;

-- sc 9 to 11


SELECT distinct CASE_NO
from  DBSYSTC.EMPLOYEE
WHERE ee_div_no like 'AMS%'
--and EE_PAYROLL_FREQ_CD = '24'
for fetch only with ur
;

select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
where 
xref.account_no = 'QK62158SA 00001' 
--and xref.soc_sec_no = 
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
and dd.DEF_P > 0
--and dd.transmit_c = 'T'
--and dd.STAT_C='A'
--order by dd.SOC_SEC_NO, dd.mod_ts desc
order by dd.STAT_C, dd.mod_ts desc
for fetch only with ur;

SELECT xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.MOD_TS 
FROM DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
WHERE xref.account_no = 'QK62454LG 00001' AND xref.soc_sec_no = '003-85-1498'
AND xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
AND xref.PART_ENRL_I = dd.PART_ENRL_I
AND dd.STAT_C = 'A'
ORDER BY dd.mod_ts DESC
for fetch only with ur
;
--enrl_prov_grp_I = 5211220732437520 
--class_prov_i(provision_i)= 8162001732437520

SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'281-80-3283',
'394-44-3631',
'251-08-9294',
'072-76-8440',
'066-46-8675',
'225-43-0862' )
--and case_no like 'QK61855MB %'
for fetch only with ur
;


select * from DBSYSTC.part_def_data
where soc_sec_no in ('281-80-3283',
'394-44-3631',
'251-08-9294',
'072-76-8440',
'066-46-8675',
'225-43-0862')
order by soc_sec_no,mod_ts desc;

select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
where xref.account_no = 'QK61311KR 00001' and xref.soc_sec_no = '226-15-6018' -- 'QK62454LG 00001' and '281-80-3283'--'JK62197PM 00001' and xref.soc_sec_no = '026-78-0537'
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
--and dd.STAT_C='A'
order by dd.mod_ts desc
for fetch only with ur
--return  ENRL_PROV_GRP_I and PART_ENRL_I, SRC_I and DEF_GRP_I, DEF_A and DEF_P  of the newest active record
;



SELECT SUM(TOTAL_A) AS TOTAL_A
FROM     DBSYSTC.EE_PART_BALANCE
WHERE    SOC_SEC_NO = '226-15-6018' 
AND TRANSACT_I IN ( SELECT TRANSACT_I FROM DBSYSTC.EE_PART_BAL_HEADER EPBH, DBSYSTK.PLAN_PROVISION PP, DBSYSTC.PLAN_SRC_DETAIL PSD, DBSYSTc.CO_SOURCE CS
                   WHERE EPBH.CASE_NO = 'QK61311KR 00001' 
                   AND EPBH.SRC_CD=1
                   AND EPBH.EFF_D = (SELECT MAX(EFF_D) FROM DBSYSTC.EE_PART_BAL_HEADER WHERE CASE_NO = 'QK61311KR 00001' AND SRC_CD=1)
                   AND PP.ENRL_PROV_GRP_I = EPBH.ENRL_PROV_GRP_I
		           AND PP.PROV_TYP_C = 13 
                   AND PP.PROVISION_I = PSD.SRC_I 
                   AND PSD.SRC_TYP_C = CS.SRC_TYP_C
                   AND PSD.ACTIVE_SRC_C IN ('A')
                   AND PSD.translation_c IN ('A', 'G', '1', 'M','W'))
FOR FETCH ONLY;

-- sc 12 to 23



SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'615-17-6410',
'551-43-1082',
'582-45-9535',
'319-66-2406',
'349-36-5580',
'361-46-9695',
'574-72-5228',
'551-57-9680',
'148-56-1982',
'141-50-5491',
'526-52-3113',
'576-46-8384' )
--and case_no like 'QK61855MB %'
for fetch only with ur
;


select * from DBSYSTC.part_def_data
where soc_sec_no in (
'615-17-6410',
'551-43-1082',
'582-45-9535',
'319-66-2406',
'349-36-5580',
'361-46-9695',
'574-72-5228',
'551-57-9680',
'148-56-1982',
'141-50-5491',
'526-52-3113',
'576-46-8384' )
order by soc_sec_no,mod_ts desc;

select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
where xref.account_no = 'QK62454LG 00001' and xref.soc_sec_no = '281-80-3283'--'JK62197PM 00001' and xref.soc_sec_no = '026-78-0537'
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
--and dd.STAT_C='A'
order by dd.mod_ts desc
for fetch only with ur
;


-- sc 18 to 21

SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'574-72-5228',
'551-57-9680',
'148-56-1982' )
--and case_no like 'QK61855MB %'
for fetch only with ur
;


select * from DBSYSTC.part_def_data
where soc_sec_no in (
'574-72-5228',
'551-57-9680',
'148-56-1982'
);




--sc 27 to 29


SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT,EE_MARITAL_STAT_CD, ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_PAYROLL_FREQ_CD,EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'004-37-0834',
'037-14-6031',
'003-85-1498' )
and case_no like 'QK62454LG%'
;

SELECT TERM_PART_DEF_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'004-37-0834');



--deferrals
select * from DBSYSTC.part_def_data
where soc_sec_no in ('004-37-0834')
order by mod_ts desc;

-- what is src_i ????????
select * from DBSYSTC.part_def_data
where src_i in (61261412765601911)
order by mod_ts desc;


-- what is outsrc_i ????????
SELECT TERM_PART_DEF_C,TERM_PART_INCL_C
from  DBSYSTC.OUTSRC_DEFERRAL
where outsrc_i = 66751166417637558
;


select * from DBSYSTC.part_def_data
where soc_sec_no in ( '003-85-1498')
order by mod_ts desc;

select * from DBSYSTC.part_def_data
where soc_sec_no in ('037-14-6031')
order by mod_ts desc;


--deferrals  corp
select *
from DBSYSTC.plan_prov_grp pgrp
where pgrp.account_no like 'QK62454LG%'-- 'JK62130%'
--'QK62158LY%'
--'JK62150FC%'
and pgrp.enrl_prov_grp_I in (select enrl_prov_grp_i from DBSYSTC.part_def_data where enrl_prov_grp_i = pgrp.enrl_prov_grp_i)
for fetch only with ur
;

-- new sc 27 to 30



select CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT, EE_DIV_NO, EE_MARITAL_STAT_CD, EE_PAYROLL_FREQ_CD,ELIG_PRC_STAT_C, CLASS_I, MOD_TS, EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from DBSYSTC.employee
where soc_sec_no in (
'006-66-4164',
'772-16-3184',
'010-72-0872',
'001-38-6984'
 )
;




select * from DBSYSTC.part_def_data
where soc_sec_no in (
'006-66-4164',
'772-16-3184',
'010-72-0872',
'001-38-6984' )
order by mod_ts desc;


--join
select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
where xref.account_no = 'QK62454LG 00001' and xref.soc_sec_no = '004-37-0834'--'JK62197PM 00001' and xref.soc_sec_no = '026-78-0537'
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
--and dd.STAT_C='A'
order by dd.mod_ts desc
for fetch only with ur
--return  ENRL_PROV_GRP_I and PART_ENRL_I, SRC_I and DEF_GRP_I, DEF_A and DEF_P  of the newest active record
;


-- sc 30 to 32

SELECT CASE_NO, SOC_SEC_NO, EE_FST_MID_NM,  EE_LAST_NM, EE_HIRE_DT, EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT,EE_MARITAL_STAT_CD, ELIG_PRC_STAT_C, CLASS_I, EE_div_no, MOD_TS, EE_PAYROLL_FREQ_CD,EE_SUB_LOCATION, PART_STAT_CD, ALT_PART_STAT_CD,ALT_TERM_REASON_CD,EXPECT_YR_SERV_C
from  DBSYSTC.EMPLOYEE
WHERE soc_sec_no in (
'004-16-5669',
'017-51-7924',
'027-11-7642')
and case_no like 'QK62454LG%'
;


select * from DBSYSTC.part_def_data
where soc_sec_no in (
'017-51-7924',
'004-16-5669',
'027-11-7642')
order by soc_sec_no, mod_ts desc;
--it returned data


select xref.ACCOUNT_NO, xref.SOC_SEC_NO, dd.ENRL_PROV_GRP_I, dd.PART_ENRL_I, dd.SRC_I, dd.DEF_GRP_I, dd.DEF_A, dd.DEF_P, dd.STAT_C, dd.DATA_CH_ORIG_C, dd.TRANSMIT_C, dd.EFF_D, dd.MOD_TS 
from DBSYSTC.part_enrl_xref xref, DBSYSTC.part_def_data dd
where xref.account_no = 'QK62454LG 00001' and xref.soc_sec_no = '017-51-7924'--'JK62197PM 00001' and xref.soc_sec_no = '026-78-0537'
and xref.ENRL_PROV_GRP_I = dd.ENRL_PROV_GRP_I
and xref.PART_ENRL_I = dd.PART_ENRL_I
--and dd.STAT_C='A'
order by dd.mod_ts desc
for fetch only with ur
--return  ENRL_PROV_GRP_I and PART_ENRL_I, SRC_I and DEF_GRP_I, DEF_A and DEF_P  of the newest active record
;



-- ****************************************************************



--//////   LOAD DATA    SYSTC

--var = 51149990257770926

INSERT INTO DBSYSTC.EDS_LOAD_MAP (
DATA_ACT_FILE_I
, MAP_TYP_C
, FILE_NM
, ACCOUNT_NO
, FILE_TYP_C
, SKIP_ROW_NO
, HEADER_ROW_C
, ORIG_MAP_DESC_T
, CONTROL_MAP_DETL_T
, EDS_NOTES_T
, EDS_DATA_MESG_T
, USER_I
, MOD_TS
, SERVICER_CD
, AWD_FLAG_C
, VALIDATE_FLAG_C
, IS_CASH_CONV_C
, DISC_TESTING_FLAG_C) 
values (99998909738563726
, '7'
, 'ENRLTERM35_1520627034792_99998909738563726.txt'
, 'GENERICEDB00001'
, '6', 1, ''
, 'KEY_VALUE_LAYOUT'
, '', '', '', 'EDB'
, '2018-03-09-15.54.00.091195'
, '', '0', '0', '0', '0' );


select * from DBSYSTC.EDS_LOAD_MAP
order by mod_ts desc;

select * from DBSYSTC.EDS_LOAD_MAP
where DATA_ACT_FILE_I= 99998909738563532
;

--get the layout file name and
select * --FILE_NM, DATA_ACT_FILE_I, MOD_TS 
from DBSYSTC.EDS_LOAD_MAP
where file_nm like 'SCENARIO1_1_%' --'SCENARIO1_1_1512650555043.XLS' 
order by mod_ts desc
;   

select * from DBSYSTC.EDS_LOAD_map_detl where DATA_ACT_FILE_I = 99998909738563540;

select * from DBSYSTC.EDS_load_data where DATA_ACT_FILE_I = 99998909738563631;



select * from DBSYSTC.EDS_load_data_msg where DATA_ACT_FILE_I = 99998909738563631;

select * from DBSYSTC.EDS_eds_load_data_m_h where DATA_ACT_FILE_I = 99998909738563539
;

select * from DBSYSTC.EDS_LOAD_MAP
WHERE 
DATA_ACT_FILE_I in (1512650555043)
for fetch only;


select * from DBSYSTC.EDS_LOAD_MAP
WHERE DATA_ACT_FILE_I in (99998909738563539)
;

select msg.EDS_DATA_MSG, lm.FILE_NM, lm.DATA_ACT_FILE_I, lm.MOD_TS, bq.STAT_C, bq.START_TS, msg.DATA_ACT_FILE_I, msg.SOC_SEC_NO, msg.MOD_TS 
from   DBSYSTC.EDS_LOAD_MAP lm, DBSYSTC.EDS_BATCH_QUEUE bq, DBSYSTC.EDS_LOAD_DATA_MSG msg
where  lm.file_nm = 'EDSSC015_1518114307553_99998909738563540.TXT' 
   and lm.DATA_ACT_FILE_I = bq.DATA_ACT_FILE_I
   and lm.DATA_ACT_FILE_I = msg.DATA_ACT_FILE_I
;

select DISTINCT (msg.EDS_DATA_MSG)
from   DBSYSTC.EDS_LOAD_MAP lm, DBSYSTC.EDS_BATCH_QUEUE bq, DBSYSTC.EDS_LOAD_DATA_MSG msg
where  lm.file_nm = 'EDSSC015_1518114307553_99998909738563540.TXT'
   and lm.DATA_ACT_FILE_I = bq.DATA_ACT_FILE_I
   and lm.DATA_ACT_FILE_I = msg.DATA_ACT_FILE_I
;


select *
from   DBSYSTC.EDS_LOAD_MAP lm, DBSYSTC.EDS_BATCH_QUEUE bq, DBSYSTC.EDS_LOAD_DATA_MSG msg
where  lm.file_nm = 'EDSSC015_1518114307553_99998909738563540.TXT' 
   and lm.DATA_ACT_FILE_I = bq.DATA_ACT_FILE_I
   and lm.DATA_ACT_FILE_I = msg.DATA_ACT_FILE_I
;



INSERT INTO DBSYSTC.EDS_BATCH_QUEUE (
BATCH_QUEUE_I
,DATA_ACT_FILE_I
,ENRL_PROV_GRP_I
,DATA_TYP_I
,LE_I
,LOAD_TYP_C
,STAT_C
,USER_I
,MOD_TS) 
VALUES 
(99998909738563726
,99998909738563726
,8
,8
,8
,'1'
,'1'
,'EDB'
, '2018-03-09-15.54.00.091195'
);


SELECT * from DBSYSTC.EDS_BATCH_QUEUE
WHERE DATA_ACT_FILE_I in (99998909738563726, 25114497327483500)
for fetch only;

--update STAT_C to 0 right after the key value file is moved to EDSincoming folder
Update DBSYSTC.EDS_BATCH_QUEUE Set STAT_C=0 
where BATCH_QUEUE_I=51149990257771025 AND DATA_ACT_FILE_I=51149990257771025;


select max(DATA_ACT_FILE_I)+1 as DATA_ACT_FILE_I
from DBSYSTC.EDS_LOAD_MAP
WITH UR FOR FETCH ONLY;


-- *****************************************
select * from dbsystc.plan_class 
where class_i in 
    (select class_i 
     from dbsystc.class_prov_xref 
     where provision_i in (select provision_i from dbsystc.plan_provision where enrl_prov_grp_i in( (select enrl_prov_grp_i from dbsystc.plan_prov_grp where account_no='651658    00001') )))
for fetch only with ur;

SELECT E.CASE_NO,e.SOC_SEC_NO,e.STAT_C,e.ENRL_TYP_C,e.EE_FST_MID_NM,e.EE_LAST_NM,e.EE_HIRE_D,e.EE_BRTH_D,e.INVESTOR_TYP_C,e.CLASS_I, p.PART_ENRL_I,p.ENRL_EFF_D,p.ENRL_STAT_C,p.INVESTOR_TYP_C
from DBSYSTC.EDS_ENRL E, DBSYSTC.PART_ENRL P
where e.case_no = 'Q51576    00001' and e.soc_sec_no in ('888-77-0083') --, '888-77-0081', '888-77-0082', '888-77-0083')
    and e.ENRL_PROV_GRP_I = p.ENRL_PROV_GRP_I
	and e.PART_ENRL_I = p.PART_ENRL_I
	and e.PART_i = p.PART_i
FOR FETCH ONLY WITH UR;


--get the layout file name and data_act_file
select FILE_NM, DATA_ACT_FILE_I, MOD_TS from DBSYSTC.EDS_LOAD_MAP
where file_nm = 'SCENARIO1_1_1513110130583.XLS' --'SCENARIO1_1_1512650555043.XLS' 
order by mod_ts desc
;   

select DATA_ACT_FILE_I, EDS_DATA_MSG, MOD_TS from DBSYSTC.EDS_LOAD_DATA_MSG;


--final query
select lm.FILE_NM, lm.DATA_ACT_FILE_I, lm.MOD_TS, bq.STAT_C, bq.START_TS, msg.DATA_ACT_FILE_I, msg.SOC_SEC_NO, msg.EDS_DATA_MSG, msg.MOD_TS 
from DBSYSTC.EDS_LOAD_MAP lm, DBSYSTC.EDS_BATCH_QUEUE bq, DBSYSTC.EDS_LOAD_DATA_MSG msg
where lm.file_nm like 'CAMPBELL_NEWFORALL_22353_1513123109110.TXT%' --'SCENARIO1_1_1513110130583.XLS'
      and lm.DATA_ACT_FILE_I = bq.DATA_ACT_FILE_I
      and lm.DATA_ACT_FILE_I = msg.DATA_ACT_FILE_I
FOR FETCH ONLY WITH ur
; 




-------------------- ######################################################################################


SELECT PLAN_ENRL_I
,ENRL_PROV_GRP_I
,ACCOUNT_NO
,TAKEOVER_CARRIER_IND_C
,PROV_GRP_SRCH_NM
,PROV_GRP_DESC_T
,RELATED_GRP_TYP_C
FROM DBSYSTC.PLAN_PROV_GRP
WHERE 
ACCOUNT_NO like '%62536%'
--AND TAKEOVER_CARRIER_IND_C = 1 --Mercer
AND TAKEOVER_CARRIER_IND_C = 0 --TA
--AND PROV_GRP_DESC_T like 'DEFAULT CARVE OUT GROUP%'
;

SELECT *
FROM DBSYSTC.PLAN_PROV_GRP
WHERE 
--ACCOUNT_NO = 'Q51215    00001'
--AND TAKEOVER_CARRIER_IND_C = 1 --Mercer
TAKEOVER_CARRIER_IND_C = 0 --TA
AND RELATED_GRP_TYP_C = 361
AND PROV_GRP_DESC_T like 'DEFAULT CARVE OUT GROUP%'
AND PROV_GRP_SRCH_NM like '%INCYTE%'
;

--
--PLAN_ENRL_I,ENRL_PROV_GRP_I,ACCOUNT_NO,TAKEOVER_CARRIER_IND_C,PROV_GRP_SRCH_NM,PROV_GRP_DESC_T,RELATED_GRP_TYP_C
--62679982143344729,42092143344729,QK62963PB 00001,0,DURO HILEX POLY, LLC ARIZONA HOURLY EMPLOYEES 401(K) PLAN,DEFAULT CARVE OUT GROUP UNDER THIS PLAN,361

--sc9-reg
--PLAN_ENRL_I,ENRL_PROV_GRP_I,DFLT_GRP_C,RELATED_GRP_I,RELATED_GRP_TYP_C,PROV_GRP_SRCH_NM,ACCOUNT_NO,BUS_LINE_C,ENRL_STAT_C,CONV_STAT_C,CONV_D,CREATION_USER_I,CREATION_TS,PROV_GRP_RSN_C,REL_C,PROV_GRP_OPT_C,PROV_GRP_DESC_T,USER_I,MOD_TS,TAKEOVER_CARRIER_IND_C,TAKEOVER_CARRIER_TYP_C,EMPLOYER_ID,CLIENT_ID
--86229023238594100,21673123238594100,1,0,361,INCYTE CORPORATION 401(K) PLAN,JK62197DB 00001,2,7,0,NULL,,2005-09-28-06.55.27.114000,,0,,DEFAULT CARVE OUT GROUP UNDER THIS PLAN,UTILVIXP,2009-03-23-10.59.50.671000,0,0,,


--SC9- test
--PLAN_ENRL_I,ENRL_PROV_GRP_I,DFLT_GRP_C,RELATED_GRP_I,RELATED_GRP_TYP_C,PROV_GRP_SRCH_NM,ACCOUNT_NO,BUS_LINE_C,ENRL_STAT_C,CONV_STAT_C,CONV_D,CREATION_USER_I,CREATION_TS,PROV_GRP_RSN_C,--REL_C,PROV_GRP_OPT_C,PROV_GRP_DESC_T,USER_I,MOD_TS,TAKEOVER_CARRIER_IND_C,TAKEOVER_CARRIER_TYP_C,EMPLOYER_ID,CLIENT_ID
--86229023238594386,21673123238594386,1,0,361,INCYTE CORPORATION 401(K) PLAN,JK62197PM 00001,2,7,0,NULL,,2005-09-28-06.55.27.114000,,0,,DEFAULT CARVE OUT GROUP UNDER THIS PLAN,UYS108,2016-11-30-19.32.25.034313,0,0,,


select CASE_NO,SOC_SEC_NO,EE_DIV_NO,EE_BRTH_DT,EE_HIRE_DT,EE_REHIRE_DT, EE_TERM_DT,EE_FST_MID_NM,EE_LAST_NM,MIDDLE_NM,CLASS_I,ALT_PART_STAT_CD,ADJUSTED_HIRE_DT, MOD_TS
from DBSYSTC.EMPLOYEE
where 
--case_no like 'JK62150FC%'  and ee_div_no like 'D%'
soc_sec_no in ('999-99-9912', '999-99-9913', '999-99-1000', '999-99-1001')
WITH UR FOR FETCH ONLY; 



Delete
from  DBSYSTC.EMPLOYEE
where CASE_NO = 'QK62963PB 00001'
AND   SOC_SEC_NO = '999-99-9912'



