

---- **********************    REGRESSION

---DDOL/VRU
--1.	Terminations set to Non-outsourced and DDOL/VRU tab “Term withdrawals” set to “Allow Request”.
SELECT pw.WD_ONLINE_C FROM dbsystc.PLAN_WITHDRAWAL pw WHERE pw.WD_ONLINE_C = '2' for FETCH ONLY WITH UR; 


-- QUERY 1 - REG

SELECT PPG.account_no, PW.*
FROM DBREGRC.plan_prov_grp PPG
JOIN DBREGRC.plan_provision PP ON PP.enrl_prov_grp_i = PPG.enrl_prov_grp_i
JOIN DBREGRC.plan_withdrawal PW ON PP.provision_i = PW.plan_wd_prov_i
WHERE PW.wd_online_c = '2' 
FOR FETCH ONLY WITH UR;

--TEST
SELECT PPG.account_no, PW.wd_online_c-- PW.*
FROM dbsystc.plan_prov_grp PPG
JOIN dbsystc.plan_provision PP ON PP.enrl_prov_grp_i = PPG.enrl_prov_grp_i
JOIN dbsystc.plan_withdrawal PW ON PP.provision_i = PW.plan_wd_prov_i
WHERE PW.wd_online_c = '2'
 AND Account_NO in ( 'JK61963MS 00001', 'QK61311KR 00001') 
FOR FETCH ONLY WITH UR;



-- Vesting
--2.	Vesting set to Plan Admin PSOL.
SELECT gvd.APP_C FROM dbsystc.GEN_VESTING_DATA gvd WHERE gvd.APP_C = 2 FOR FETCH ONLY WITH UR; 

-- QUERY 2

SELECT PPG.account_no, gvd.*
FROM dbsystc.plan_prov_grp PPG
JOIN dbsystc.plan_provision PP ON PP.enrl_prov_grp_i = PPG.enrl_prov_grp_i
JOIN dbsystc.GEN_VESTING_DATA gvd ON PP.provision_i = gvd.vest_i
WHERE gvd.APP_C = 2 
AND Account_NO in ( 'JK61963MS 00001', 'QK61311KR 00001') 
--and vest_i = '32044042311440400'
FOR FETCH ONLY WITH UR; 


-- 3.	In P3 -> outsourcing tab
SELECT otr.NON_OUT_APP_METH FROM dbsystc.OUTSRC_TERM_RULES OTR WHERE otr.NON_OUT_APP_METH = '2' for FETCH ONLY WITH UR;

-- QUERY 3

SELECT PPG.account_no, otr.*
FROM dbsystc.plan_prov_grp PPG
JOIN dbsystc.plan_provision PP ON PP.enrl_prov_grp_i = PPG.enrl_prov_grp_i
JOIN dbsystc.OUTSRC_TERM_RULES OTR ON pp.provision_i = otr.outsrc_i
WHERE --otr.NON_OUT_APP_METH = '2' 
 Account_NO in ( 'JK61963MS 00001', 'QK61311KR 00001') 
for FETCH ONLY WITH UR;


-- REGRESSION
select *
from DBREGRC.ee_secure_data
where SOC_SEC_NO IN ('015-88-0384' ), '155-55-5466')
;





--AUTOMATION

--QK61311MB 00001 - 
  --     outsourcing -> PLAN PSD .....
--

SELECT *-- otr.NON_OUT_APP_METH 
FROM DBREGRC.OUTSRC_TERM_RULES OTR 
WHERE otr.NON_OUT_APP_METH = '2' for FETCH ONLY WITH UR; 
;

SELECT PPG.account_no, otr.*
FROM DBREGRC.plan_prov_grp PPG
JOIN DBREGRC.plan_provision PP ON PP.enrl_prov_grp_i = PPG.enrl_prov_grp_i
JOIN DBREGRC.OUTSRC_TERM_RULES OTR ON pp.provision_i = otr.outsrc_i
WHERE otr.NON_OUT_APP_METH = '2' 
AND Account_NO in ( 'QK61311MB  00001') 
for FETCH ONLY WITH UR;


select distinct EE.CASE_NO , EE.SOC_SEC_NO , EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT , CYE_BAL_EFF_DT, CYE_UNIT_CT
from DBREGRC.funds_detail FD, DBREGRC.EMPLOYEE EE, DBREGRC.plan_prov_grp ppg
where EE.case_no like 'QK61311MB%'-- 'QK61311PD%' --'QK61543PD%'
--and CYE_UNIT_CT < 50000 -- they have money
and fd.case_no = ppg.account_no
and ENRL_STAT_C = 7 -- plan is active
and FD_DESC_CD not in ('PCRA', 'CRF1', 'GDAF', 'G16B')
AND EE.CASE_NO = FD.CASE_NO
AND EE.SOC_SEC_NO = FD.SOC_SEC_NO
and ee.ee_term_dt <> '00000000' -- not terminated
--and CYE_BAL_EFF_DT = '20160630'
--and SRC_I count > 1
--and EE_BRTH_DT > '19700101'
for fetch only with UR