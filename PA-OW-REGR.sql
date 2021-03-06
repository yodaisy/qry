select case_no, tr_no, soc_sec_no, pymt_stat_cd, creation_ts, TR_REF_NO, eff_dt, cyc_dt
from DBSYSTC.withdrawal_detail 
where case_no like  'QK61311KR %' -- 'JK61095LG 00001%'--'QK62158TR%'  -- 'QK61311KR%' -- this plan is in test JK60455SD
and soc_sec_no = '295-08-3961' --'295-55-5965'
      and tr_no in ('3030', -- term withdrawal
                   '3040', -- retired
                   '3050') -- disabled
      and pymt_stat_cd = 1  -- equals to 1 + tr_no=3030,3040 or 3050 => then it is FOD
      and stat_cd = 8 -- completed successfully
      and CREATION_TS > '2015-01-01-00.00.00.000000'
FOR FETCH ONLY WITH UR;

select * 
from dbsystc.withdrawal_detail 
where case_no like 'JK61811LG%'
               and tr_no = 3040
for fetch only with UR;


--withdrawal type = Hardship  - tr_no = 3000
Select CASE_NO,SOC_SEC_NO,TR_REF_NO,TR_NO,STAT_CD,RQST_WD_AMT,RQST_WD_PCT,VEST_PCT,WD_ACCRD_INT_AMT,AVAIL_FD_RTO_PCT,TOT_WD_AMT,WHLD_FED_TAX_AMT,WHLD_ST_TAX_AMT,WHLD_LOCAL_TAX_AMT,FD_B_E_LOAD_AMT,CONT_B_E_LOAD_AMT,OVPYMT_AMT,FF_AMT,HEAD_CHRG_AMT,NET_PYMT_AMT,PRE87_TAX_BAS_AMT,POST86_TAX_BAS_AMT,EE_PAYOUT_AMT,PRE89_TYP3_WD_AMT,POST88_TYP3_WD_AMT,TAX_BAS_AMT,OUTSIDE_FD_WD_AMT,LOAN_DFLT_TOT_AMT,WD_AMT_TYP_CD,P_L_CALC_CD,PR_YR_VEST_CR_CD,CURR_YR_VEST_CR_CD,BOOK_DT,CYC_DT,EFF_DT,EE_TERM_DT,TERM_PAYT_DEF_DT,REVSL_DT,PROC_DT,P_L_DT,CHECK_CONF_REC_DT,STOCK_TRFR_DT,INT_CR_EXCEP_DT,RFND_RECHRZ_PYR_DT,RECHRZ_CD,EXP_CHRG_OVRD_CD,DISB_PAYEE_TYP_CD,ACCRD_INT_CALC_CD,PART_RTMT_NO,ST_FILING_FORM_CD,FORM_1099_IND_CD,PAYOUT_TYP_CD,PYMT_RELEASE_CD,CASH_VOUCHER_CD,DISALOW_MTCH_FD_CD,POST_TERM_WD_CD,PART_PAYT_AGE_CD,RFND_REASON_CD,HRDSHP_WTHDRL_CD,SERVICER_CD,PYMT_STAT_CD,WD_SEQ_STAT_CD,SUSP_CD,CT_RSTRC_OVRD_CD,PART_CONT_YR_NO,DISB_CD,EXCLS_ALOWNC_CD,B_E_LOAD_OVRD_CD,LN_SEQ_OVRD_CD,B_E_LOAD_OPT_CD,CTRB_ELIG_CD,IMMED_FF_CD,RSTRC_OVRD_CD,FD1_OVRD_B_E_AMT,FD2_OVRD_B_E_AMT,TYP6_HRDSHP_AMT,FD_1_FREE_B_E_AMT,FD_5_FREE_B_E_AMT,CONT_PR_2_PR_WD,AFFL_PR_2_PR_WD,CONFIRM_TYP_CD,ACCT_PROC_CD,ER_BAS_WD_AMT,LN_DFLT_CD,DEFAULT_STATUS_CD,PRNC_RLVR_CD,REASON_CD,IRA_FLEX_TAX_AMT,USER_I,SRC_CD,WD_OPTION_C,HRDSHP_REASON_C,WD_REASON_C,ROLLOVER_TYP_C,WHLD_FED_TAX_C,FED_TAX_OVRD_C,WHLD_FED_AMT_TYP_C,WHLD_FED_DLR_A,WHLD_FED_P,WHLD_ST_TAX_C,ST_TAX_OVRD_C,WHLD_ST_AMT_TYP_C,WHLD_ST_DLR_A,WHLD_ST_P,EE_ELECT_DEF_WD_A,AUTO_CASHOUT_TYP_C,FIN_ACT_I,RFND_TYP_C,RTH_HRDSHP_CTRB_A,RTH_TAXFREE_CTRB_A,RTH_TAXFREE_ROLL_A,RTH_ROLLOVER_TYP_C,DO_NOT_CHANGE_ME,YREND_86_WD_A,RTH_CTRB_FST_YR,STATE_TAX_C,ROTH_QUAL_C,PRNC_ROTH_RLVR_CD,INCL_SPL_FD_CD,SPL_OWED_GUAR_CD,WD_TR_TYP_C,CREATION_TS,MOD_TS,NON_CASH_CD,NON_CASH_FEE_CD,OVERNIGHT_CHK_C,SIGNATURE_C,OVERNIGHT_CHK_FEE_A,ORIG_RQST_AMT,EE_MARITAL_STAT_C,TRS_PPT_FEE_AMT,TPA_PPT_FEE_AMT,TRS_ER_FEE_AMT,TPA_ER_FEE_AMT,VNDR_TYP_C,OTHER_VNDR_DESC_T,DEATH_DISB_PAYEE_TYP_CD,REVERSE_TR_REF_NO,UNCASH_TR_REF_NO,CMS_PROC_C,PLAN_WD_PROV_I,WHLD_SUPPL_P,STANDARD_TAX_AMT,ER_STOCK_EXCLUDED,ACCT_TERM_FIN_ACT_I
from DBSYSTC.withdrawal_detail 
where --soc_sec_no = '295-08-3961' and case_no like 'QK61311KR%' --and tr_ref_no = ?
tr_no = 3000 --and case_no like 'QK6%'
--GROUP BY CASE_NO, SOC_SEC_NO
for fetch only with ur;

Hardship: 
•	tr_no = 3000
In-Service: 
•	tr_no = 3001
--withdrawal type = Hardship  - tr_no = 3000
Select CASE_NO,SOC_SEC_NO,RQST_WD_AMT,RQST_WD_PCT,VEST_PCT,WD_ACCRD_INT_AMT,AVAIL_FD_RTO_PCT,TOT_WD_AMT,WHLD_FED_TAX_AMT,WHLD_ST_TAX_AMT,WHLD_LOCAL_TAX_AMT,FD_B_E_LOAD_AMT,CONT_B_E_LOAD_AMT,OVPYMT_AMT,FF_AMT,HEAD_CHRG_AMT,NET_PYMT_AMT,PRE87_TAX_BAS_AMT,POST86_TAX_BAS_AMT,EE_PAYOUT_AMT,PRE89_TYP3_WD_AMT,POST88_TYP3_WD_AMT,TAX_BAS_AMT,OUTSIDE_FD_WD_AMT,LOAN_DFLT_TOT_AMT,WD_AMT_TYP_CD,P_L_CALC_CD,PR_YR_VEST_CR_CD,CURR_YR_VEST_CR_CD,BOOK_DT,CYC_DT,EFF_DT,EE_TERM_DT,TERM_PAYT_DEF_DT,REVSL_DT,PROC_DT,P_L_DT,CHECK_CONF_REC_DT,STOCK_TRFR_DT,INT_CR_EXCEP_DT,RFND_RECHRZ_PYR_DT,RECHRZ_CD,EXP_CHRG_OVRD_CD,DISB_PAYEE_TYP_CD,ACCRD_INT_CALC_CD,PART_RTMT_NO,ST_FILING_FORM_CD,FORM_1099_IND_CD,PAYOUT_TYP_CD,PYMT_RELEASE_CD,CASH_VOUCHER_CD,DISALOW_MTCH_FD_CD,POST_TERM_WD_CD,PART_PAYT_AGE_CD,RFND_REASON_CD,HRDSHP_WTHDRL_CD,SERVICER_CD,TR_REF_NO,TR_NO,STAT_CD,PYMT_STAT_CD,WD_SEQ_STAT_CD,SUSP_CD,CT_RSTRC_OVRD_CD,PART_CONT_YR_NO,DISB_CD,EXCLS_ALOWNC_CD,B_E_LOAD_OVRD_CD,LN_SEQ_OVRD_CD,B_E_LOAD_OPT_CD,CTRB_ELIG_CD,IMMED_FF_CD,RSTRC_OVRD_CD,FD1_OVRD_B_E_AMT,FD2_OVRD_B_E_AMT,TYP6_HRDSHP_AMT,FD_1_FREE_B_E_AMT,FD_5_FREE_B_E_AMT,CONT_PR_2_PR_WD,AFFL_PR_2_PR_WD,CONFIRM_TYP_CD,ACCT_PROC_CD,ER_BAS_WD_AMT,LN_DFLT_CD,DEFAULT_STATUS_CD,PRNC_RLVR_CD,REASON_CD,IRA_FLEX_TAX_AMT,USER_I,SRC_CD,WD_OPTION_C,HRDSHP_REASON_C,WD_REASON_C,ROLLOVER_TYP_C,WHLD_FED_TAX_C,FED_TAX_OVRD_C,WHLD_FED_AMT_TYP_C,WHLD_FED_DLR_A,WHLD_FED_P,WHLD_ST_TAX_C,ST_TAX_OVRD_C,WHLD_ST_AMT_TYP_C,WHLD_ST_DLR_A,WHLD_ST_P,EE_ELECT_DEF_WD_A,AUTO_CASHOUT_TYP_C,FIN_ACT_I,RFND_TYP_C,RTH_HRDSHP_CTRB_A,RTH_TAXFREE_CTRB_A,RTH_TAXFREE_ROLL_A,RTH_ROLLOVER_TYP_C,DO_NOT_CHANGE_ME,YREND_86_WD_A,RTH_CTRB_FST_YR,STATE_TAX_C,ROTH_QUAL_C,PRNC_ROTH_RLVR_CD,INCL_SPL_FD_CD,SPL_OWED_GUAR_CD,WD_TR_TYP_C,CREATION_TS,MOD_TS,NON_CASH_CD,NON_CASH_FEE_CD,OVERNIGHT_CHK_C,SIGNATURE_C,OVERNIGHT_CHK_FEE_A,ORIG_RQST_AMT,EE_MARITAL_STAT_C,TRS_PPT_FEE_AMT,TPA_PPT_FEE_AMT,TRS_ER_FEE_AMT,TPA_ER_FEE_AMT,VNDR_TYP_C,OTHER_VNDR_DESC_T,DEATH_DISB_PAYEE_TYP_CD,REVERSE_TR_REF_NO,UNCASH_TR_REF_NO,CMS_PROC_C,PLAN_WD_PROV_I,WHLD_SUPPL_P,STANDARD_TAX_AMT,ER_STOCK_EXCLUDED,ACCT_TERM_FIN_ACT_I
from DBSYSTC.withdrawal_detail 
where --soc_sec_no = '295-08-3961' and case_no like 'QK61311KR%' --and tr_ref_no = ?
tr_no = 3000 --and case_no like 'QK6%'
--GROUP BY CASE_NO, SOC_SEC_NO
for fetch only with ur;

--Termination:
--	tr_no = 3005 and wd_option_c = 2
--withdrawal type = termination  - tr_no = 3005 and wd_option_c = 2

Select CASE_NO,SOC_SEC_NO,WD_OPTION_C,RQST_WD_AMT,RQST_WD_PCT,VEST_PCT,WD_ACCRD_INT_AMT,AVAIL_FD_RTO_PCT,TOT_WD_AMT,WHLD_FED_TAX_AMT,WHLD_ST_TAX_AMT,WHLD_LOCAL_TAX_AMT,FD_B_E_LOAD_AMT,CONT_B_E_LOAD_AMT,OVPYMT_AMT,FF_AMT,HEAD_CHRG_AMT,NET_PYMT_AMT,PRE87_TAX_BAS_AMT,POST86_TAX_BAS_AMT,EE_PAYOUT_AMT,PRE89_TYP3_WD_AMT,POST88_TYP3_WD_AMT,TAX_BAS_AMT,OUTSIDE_FD_WD_AMT,LOAN_DFLT_TOT_AMT,WD_AMT_TYP_CD,P_L_CALC_CD,PR_YR_VEST_CR_CD,CURR_YR_VEST_CR_CD,BOOK_DT,CYC_DT,EFF_DT,EE_TERM_DT,TERM_PAYT_DEF_DT,REVSL_DT,PROC_DT,P_L_DT,CHECK_CONF_REC_DT,STOCK_TRFR_DT,INT_CR_EXCEP_DT,RFND_RECHRZ_PYR_DT,RECHRZ_CD,EXP_CHRG_OVRD_CD,DISB_PAYEE_TYP_CD,ACCRD_INT_CALC_CD,PART_RTMT_NO,ST_FILING_FORM_CD,FORM_1099_IND_CD,PAYOUT_TYP_CD,PYMT_RELEASE_CD,CASH_VOUCHER_CD,DISALOW_MTCH_FD_CD,POST_TERM_WD_CD,PART_PAYT_AGE_CD,RFND_REASON_CD,HRDSHP_WTHDRL_CD,SERVICER_CD,TR_REF_NO,TR_NO,STAT_CD,PYMT_STAT_CD,WD_SEQ_STAT_CD,SUSP_CD,CT_RSTRC_OVRD_CD,PART_CONT_YR_NO,DISB_CD,EXCLS_ALOWNC_CD,B_E_LOAD_OVRD_CD,LN_SEQ_OVRD_CD,B_E_LOAD_OPT_CD,CTRB_ELIG_CD,IMMED_FF_CD,RSTRC_OVRD_CD,FD1_OVRD_B_E_AMT,FD2_OVRD_B_E_AMT,TYP6_HRDSHP_AMT,FD_1_FREE_B_E_AMT,FD_5_FREE_B_E_AMT,CONT_PR_2_PR_WD,AFFL_PR_2_PR_WD,CONFIRM_TYP_CD,ACCT_PROC_CD,ER_BAS_WD_AMT,LN_DFLT_CD,DEFAULT_STATUS_CD,PRNC_RLVR_CD,REASON_CD,IRA_FLEX_TAX_AMT,USER_I,SRC_CD,HRDSHP_REASON_C,WD_REASON_C,ROLLOVER_TYP_C,WHLD_FED_TAX_C,FED_TAX_OVRD_C,WHLD_FED_AMT_TYP_C,WHLD_FED_DLR_A,WHLD_FED_P,WHLD_ST_TAX_C,ST_TAX_OVRD_C,WHLD_ST_AMT_TYP_C,WHLD_ST_DLR_A,WHLD_ST_P,EE_ELECT_DEF_WD_A,AUTO_CASHOUT_TYP_C,FIN_ACT_I,RFND_TYP_C,RTH_HRDSHP_CTRB_A,RTH_TAXFREE_CTRB_A,RTH_TAXFREE_ROLL_A,RTH_ROLLOVER_TYP_C,DO_NOT_CHANGE_ME,YREND_86_WD_A,RTH_CTRB_FST_YR,STATE_TAX_C,ROTH_QUAL_C,PRNC_ROTH_RLVR_CD,INCL_SPL_FD_CD,SPL_OWED_GUAR_CD,WD_TR_TYP_C,CREATION_TS,MOD_TS,NON_CASH_CD,NON_CASH_FEE_CD,OVERNIGHT_CHK_C,SIGNATURE_C,OVERNIGHT_CHK_FEE_A,ORIG_RQST_AMT,EE_MARITAL_STAT_C,TRS_PPT_FEE_AMT,TPA_PPT_FEE_AMT,TRS_ER_FEE_AMT,TPA_ER_FEE_AMT,VNDR_TYP_C,OTHER_VNDR_DESC_T,DEATH_DISB_PAYEE_TYP_CD,REVERSE_TR_REF_NO,UNCASH_TR_REF_NO,CMS_PROC_C,PLAN_WD_PROV_I,WHLD_SUPPL_P,STANDARD_TAX_AMT,ER_STOCK_EXCLUDED,ACCT_TERM_FIN_ACT_I
from DBSYSTC.withdrawal_detail 
where tr_no = 3005 and WD_OPTION_C = '2'
for fetch only with ur;
-- AN62097TN 00001


--withdrawal type = termination  
-- Tr_no = 3015 and wd_option_c = 2
Select CASE_NO,SOC_SEC_NO,WD_OPTION_C,RQST_WD_AMT,RQST_WD_PCT,VEST_PCT,WD_ACCRD_INT_AMT,AVAIL_FD_RTO_PCT,TOT_WD_AMT,WHLD_FED_TAX_AMT,WHLD_ST_TAX_AMT,WHLD_LOCAL_TAX_AMT,FD_B_E_LOAD_AMT,CONT_B_E_LOAD_AMT,OVPYMT_AMT,FF_AMT,HEAD_CHRG_AMT,NET_PYMT_AMT,PRE87_TAX_BAS_AMT,POST86_TAX_BAS_AMT,EE_PAYOUT_AMT,PRE89_TYP3_WD_AMT,POST88_TYP3_WD_AMT,TAX_BAS_AMT,OUTSIDE_FD_WD_AMT,LOAN_DFLT_TOT_AMT,WD_AMT_TYP_CD,P_L_CALC_CD,PR_YR_VEST_CR_CD,CURR_YR_VEST_CR_CD,BOOK_DT,CYC_DT,EFF_DT,EE_TERM_DT,TERM_PAYT_DEF_DT,REVSL_DT,PROC_DT,P_L_DT,CHECK_CONF_REC_DT,STOCK_TRFR_DT,INT_CR_EXCEP_DT,RFND_RECHRZ_PYR_DT,RECHRZ_CD,EXP_CHRG_OVRD_CD,DISB_PAYEE_TYP_CD,ACCRD_INT_CALC_CD,PART_RTMT_NO,ST_FILING_FORM_CD,FORM_1099_IND_CD,PAYOUT_TYP_CD,PYMT_RELEASE_CD,CASH_VOUCHER_CD,DISALOW_MTCH_FD_CD,POST_TERM_WD_CD,PART_PAYT_AGE_CD,RFND_REASON_CD,HRDSHP_WTHDRL_CD,SERVICER_CD,TR_REF_NO,TR_NO,STAT_CD,PYMT_STAT_CD,WD_SEQ_STAT_CD,SUSP_CD,CT_RSTRC_OVRD_CD,PART_CONT_YR_NO,DISB_CD,EXCLS_ALOWNC_CD,B_E_LOAD_OVRD_CD,LN_SEQ_OVRD_CD,B_E_LOAD_OPT_CD,CTRB_ELIG_CD,IMMED_FF_CD,RSTRC_OVRD_CD,FD1_OVRD_B_E_AMT,FD2_OVRD_B_E_AMT,TYP6_HRDSHP_AMT,FD_1_FREE_B_E_AMT,FD_5_FREE_B_E_AMT,CONT_PR_2_PR_WD,AFFL_PR_2_PR_WD,CONFIRM_TYP_CD,ACCT_PROC_CD,ER_BAS_WD_AMT,LN_DFLT_CD,DEFAULT_STATUS_CD,PRNC_RLVR_CD,REASON_CD,IRA_FLEX_TAX_AMT,USER_I,SRC_CD,HRDSHP_REASON_C,WD_REASON_C,ROLLOVER_TYP_C,WHLD_FED_TAX_C,FED_TAX_OVRD_C,WHLD_FED_AMT_TYP_C,WHLD_FED_DLR_A,WHLD_FED_P,WHLD_ST_TAX_C,ST_TAX_OVRD_C,WHLD_ST_AMT_TYP_C,WHLD_ST_DLR_A,WHLD_ST_P,EE_ELECT_DEF_WD_A,AUTO_CASHOUT_TYP_C,FIN_ACT_I,RFND_TYP_C,RTH_HRDSHP_CTRB_A,RTH_TAXFREE_CTRB_A,RTH_TAXFREE_ROLL_A,RTH_ROLLOVER_TYP_C,DO_NOT_CHANGE_ME,YREND_86_WD_A,RTH_CTRB_FST_YR,STATE_TAX_C,ROTH_QUAL_C,PRNC_ROTH_RLVR_CD,INCL_SPL_FD_CD,SPL_OWED_GUAR_CD,WD_TR_TYP_C,CREATION_TS,MOD_TS,NON_CASH_CD,NON_CASH_FEE_CD,OVERNIGHT_CHK_C,SIGNATURE_C,OVERNIGHT_CHK_FEE_A,ORIG_RQST_AMT,EE_MARITAL_STAT_C,TRS_PPT_FEE_AMT,TPA_PPT_FEE_AMT,TRS_ER_FEE_AMT,TPA_ER_FEE_AMT,VNDR_TYP_C,OTHER_VNDR_DESC_T,DEATH_DISB_PAYEE_TYP_CD,REVERSE_TR_REF_NO,UNCASH_TR_REF_NO,CMS_PROC_C,PLAN_WD_PROV_I,WHLD_SUPPL_P,STANDARD_TAX_AMT,ER_STOCK_EXCLUDED,ACCT_TERM_FIN_ACT_I
from DBSYSTC.withdrawal_detail 
where tr_no = 3015 and WD_OPTION_C = '2'
for fetch only with ur;

--withdrawal type = termination  
--   Tr_no = 3030
Select CASE_NO,SOC_SEC_NO,WD_OPTION_C,RQST_WD_AMT,RQST_WD_PCT,VEST_PCT,WD_ACCRD_INT_AMT,AVAIL_FD_RTO_PCT,TOT_WD_AMT,WHLD_FED_TAX_AMT,WHLD_ST_TAX_AMT,WHLD_LOCAL_TAX_AMT,FD_B_E_LOAD_AMT,CONT_B_E_LOAD_AMT,OVPYMT_AMT,FF_AMT,HEAD_CHRG_AMT,NET_PYMT_AMT,PRE87_TAX_BAS_AMT,POST86_TAX_BAS_AMT,EE_PAYOUT_AMT,PRE89_TYP3_WD_AMT,POST88_TYP3_WD_AMT,TAX_BAS_AMT,OUTSIDE_FD_WD_AMT,LOAN_DFLT_TOT_AMT,WD_AMT_TYP_CD,P_L_CALC_CD,PR_YR_VEST_CR_CD,CURR_YR_VEST_CR_CD,BOOK_DT,CYC_DT,EFF_DT,EE_TERM_DT,TERM_PAYT_DEF_DT,REVSL_DT,PROC_DT,P_L_DT,CHECK_CONF_REC_DT,STOCK_TRFR_DT,INT_CR_EXCEP_DT,RFND_RECHRZ_PYR_DT,RECHRZ_CD,EXP_CHRG_OVRD_CD,DISB_PAYEE_TYP_CD,ACCRD_INT_CALC_CD,PART_RTMT_NO,ST_FILING_FORM_CD,FORM_1099_IND_CD,PAYOUT_TYP_CD,PYMT_RELEASE_CD,CASH_VOUCHER_CD,DISALOW_MTCH_FD_CD,POST_TERM_WD_CD,PART_PAYT_AGE_CD,RFND_REASON_CD,HRDSHP_WTHDRL_CD,SERVICER_CD,TR_REF_NO,TR_NO,STAT_CD,PYMT_STAT_CD,WD_SEQ_STAT_CD,SUSP_CD,CT_RSTRC_OVRD_CD,PART_CONT_YR_NO,DISB_CD,EXCLS_ALOWNC_CD,B_E_LOAD_OVRD_CD,LN_SEQ_OVRD_CD,B_E_LOAD_OPT_CD,CTRB_ELIG_CD,IMMED_FF_CD,RSTRC_OVRD_CD,FD1_OVRD_B_E_AMT,FD2_OVRD_B_E_AMT,TYP6_HRDSHP_AMT,FD_1_FREE_B_E_AMT,FD_5_FREE_B_E_AMT,CONT_PR_2_PR_WD,AFFL_PR_2_PR_WD,CONFIRM_TYP_CD,ACCT_PROC_CD,ER_BAS_WD_AMT,LN_DFLT_CD,DEFAULT_STATUS_CD,PRNC_RLVR_CD,REASON_CD,IRA_FLEX_TAX_AMT,USER_I,SRC_CD,HRDSHP_REASON_C,WD_REASON_C,ROLLOVER_TYP_C,WHLD_FED_TAX_C,FED_TAX_OVRD_C,WHLD_FED_AMT_TYP_C,WHLD_FED_DLR_A,WHLD_FED_P,WHLD_ST_TAX_C,ST_TAX_OVRD_C,WHLD_ST_AMT_TYP_C,WHLD_ST_DLR_A,WHLD_ST_P,EE_ELECT_DEF_WD_A,AUTO_CASHOUT_TYP_C,FIN_ACT_I,RFND_TYP_C,RTH_HRDSHP_CTRB_A,RTH_TAXFREE_CTRB_A,RTH_TAXFREE_ROLL_A,RTH_ROLLOVER_TYP_C,DO_NOT_CHANGE_ME,YREND_86_WD_A,RTH_CTRB_FST_YR,STATE_TAX_C,ROTH_QUAL_C,PRNC_ROTH_RLVR_CD,INCL_SPL_FD_CD,SPL_OWED_GUAR_CD,WD_TR_TYP_C,CREATION_TS,MOD_TS,NON_CASH_CD,NON_CASH_FEE_CD,OVERNIGHT_CHK_C,SIGNATURE_C,OVERNIGHT_CHK_FEE_A,ORIG_RQST_AMT,EE_MARITAL_STAT_C,TRS_PPT_FEE_AMT,TPA_PPT_FEE_AMT,TRS_ER_FEE_AMT,TPA_ER_FEE_AMT,VNDR_TYP_C,OTHER_VNDR_DESC_T,DEATH_DISB_PAYEE_TYP_CD,REVERSE_TR_REF_NO,UNCASH_TR_REF_NO,CMS_PROC_C,PLAN_WD_PROV_I,WHLD_SUPPL_P,STANDARD_TAX_AMT,ER_STOCK_EXCLUDED,ACCT_TERM_FIN_ACT_I
from DBSYSTC.withdrawal_detail 
where tr_no = 3030 --and WD_OPTION_C = '2'
for fetch only with ur;


--PFA query to check if approver is Nonoutsourced
--if is NON-outcourced: For Termination the Approval_C will be 2 and for In-service and Hardship, it will be 3 (when is 'plan admin - psd'), and 2 (when is 'plan admin - paper'). and '1' (when 'transamerica)
--if is Outcourced: For Termination the Approval_C will be empty, for In-service = 1 and for Hardship = 2  - ex: QK61543PD
--check in P3 withdrawals rules
SELECT wp.WD_SUB_TYPE_DESC_T AS type, to_char(wp.APPROVAL_C) AS approval, ppg.account_no
FROM DBSYSTC.plan_prov_grp ppg, DBSYSTC.plan_provision pp, DBSYSTC.withdrawal_prov wp 
WHERE pp.enrl_prov_grp_i = ppg.enrl_prov_grp_i AND pp.provision_i = wp.plan_wd_prov_i AND pp.prov_typ_c IN(77, 78) AND ppg.account_no = 'QK61543PD 00001'
UNION SELECT 'Termination' AS type, OTR.NON_OUT_APP_METH AS approval, ppg.account_no 
FROM DBSYSTC.PLAN_PROV_GRP PPG, DBSYSTC.PLAN_PROVISION PP, DBSYSTC.OUTSRC_TERM_RULES OTR 
WHERE PP.ENRL_PROV_GRP_I = PPG.ENRL_PROV_GRP_I 
AND PP.PROV_TYP_C = 80 
AND OTR.OUTSRC_I = PP.PROVISION_I 
AND PPG.ACCOUNT_NO = 'QK61543PD 00001'  
FOR FETCH ONLY WITH UR;

    QK61543PD - is outsourced
    HARDSHIP    = PLAN ADMIN - PAPER    
    IN-SERVICE  = PLAN ADMIN - PAPER 
    TERMINATION = TRS

    TYPE,APPROVAL,ACCOUNT_NO
    Hardship,2,QK61543PD 00001
    Inservice,1,QK61543PD 00001
    Termination, ,QK61543PD 00001

SELECT wp.WD_SUB_TYPE_DESC_T AS type, to_char(wp.APPROVAL_C) AS approval, ppg.account_no
FROM DBSYSTC.plan_prov_grp ppg, DBSYSTC.plan_provision pp, DBSYSTC.withdrawal_prov wp 
WHERE pp.enrl_prov_grp_i = ppg.enrl_prov_grp_i AND pp.provision_i = wp.plan_wd_prov_i AND pp.prov_typ_c IN(77, 78) AND ppg.account_no = 'QK61311KR 00001'--'QK62866NC 00001' 
UNION SELECT 'Termination' AS type, OTR.NON_OUT_APP_METH AS approval, ppg.account_no 
FROM DBSYSTC.PLAN_PROV_GRP PPG, DBSYSTC.PLAN_PROVISION PP, DBSYSTC.OUTSRC_TERM_RULES OTR 
WHERE PP.ENRL_PROV_GRP_I = PPG.ENRL_PROV_GRP_I 
AND PP.PROV_TYP_C = 80 
AND OTR.OUTSRC_I = PP.PROVISION_I 
AND PPG.ACCOUNT_NO = 'QK61311KR 00001'  
FOR FETCH ONLY WITH UR;

select PHONE_NO, addr.EMAIL_ADDR_NM, addr.ADDR_LINE_1_T, addr.ADDR_LINE_2_T, addr.ADDR_LINE_3_T, addr.CITY_NM, addr.ST_C, addr.ZIP_C, addr.COUNTRY_C, hist.mod_ts
from DBSYSTC.BENE_HIST HIST, DBSYSTC.LE_ADDRESS ADDR
where hist.account_no = 'QK61311KR 00001'
and hist.soc_sec_no in ('395-58-7434')
and hist.address_i = addr.cp_i
order by hist.bene_soc_sec_no, hist.status_c
FOR FETCH ONLY WITH UR;

--////////
SELECT wp.WD_SUB_TYPE_DESC_T AS type, to_char(wp.APPROVAL_C) AS approval, ppg.account_no
FROM DBSYSTC.plan_prov_grp ppg, DBSYSTC.plan_provision pp, DBSYSTC.withdrawal_prov wp 
WHERE pp.enrl_prov_grp_i = ppg.enrl_prov_grp_i AND pp.provision_i = wp.plan_wd_prov_i AND pp.prov_typ_c IN(77, 78) AND wp.WD_SUB_TYPE_DESC_T = 'Hardship'--AND ppg.account_no =? 
UNION SELECT 'Termination' AS type, OTR.NON_OUT_APP_METH AS approval, ppg.account_no 
FROM DBSYSTC.PLAN_PROV_GRP PPG, DBSYSTC.PLAN_PROVISION PP, DBSYSTC.OUTSRC_TERM_RULES OTR 
WHERE PP.ENRL_PROV_GRP_I = PPG.ENRL_PROV_GRP_I 
AND PP.PROV_TYP_C = 80 
AND OTR.OUTSRC_I = PP.PROVISION_I 
AND OTR.NON_OUT_APP_METH = '3'
--AND PPG.ACCOUNT_NO =? 
FOR FETCH ONLY WITH UR;




--Withdrawal approver – hardship (for STANDARD hardship)
SELECT PPG.ACCOUNT_NO, WP.APPROVAL_C 
FROM DBSYSTC.PLAN_PROV_GRP PPG, DBSYSTC.WITHDRAWAL_PROV WP, DBSYSTC.PLAN_PROVISION PP
WHERE PPG.ACCOUNT_NO = 'QK61311KR 00001' 
AND PP.ENRL_PROV_GRP_I = PPG.ENRL_PROV_GRP_I 
AND PP.PROV_TYP_C = 77 
AND PLAN_WD_PROV_I = PP.PROVISION_I
FOR FETCH ONLY WITH UR;
--example: it returned approval_c = 2 (approver Hardship = PLAN ADMIN - PAPER and approver in-service = PLAN ADMIN - PAPER)

--<option value="0" >NOT APPLICABLE</option>
--<option value="1" >TRANSAMERICA</option>
--<option value="2" >PLAN ADMIN - PAPER</option>
--<option value="3" >PLAN ADMIN - PSD</option>
--Withdrawal approver – in-service (for standard in-service)
SELECT PPG.ACCOUNT_NO, WP.APPROVAL_C 
FROM DBSYSTC.PLAN_PROV_GRP PPG, DBSYSTC.WITHDRAWAL_PROV WP, DBSYSTC.PLAN_PROVISION PP
WHERE PPG.ACCOUNT_NO = 'QK61311KR 00001' 
AND PP.ENRL_PROV_GRP_I = PPG.ENRL_PROV_GRP_I 
AND PP.PROV_TYP_C = 78 
AND PLAN_WD_PROV_I = PP.PROVISION_I
FOR FETCH ONLY WITH UR;
-- example: returned approval_c = 1 (approver in-service = TRANSAMERICA and nothing set for hardship)



--Below query will pull details for Plan sponsor information, Personal information and Plan sponsor address. We just need to get the plansponsor phone number.
SELECT  OUTPUT_ACT_I,  
                                     OUTPUT_ACT_TYP_C,  
                                                 OU.EFF_DT,  
                                                 OU.FIN_ACT_I,  
                                                 WD.TR_REF_NO,  
                                                 WD.CASE_NO,  
                                                 WD.SOC_SEC_NO,  
             WD.STAT_CD,  
                                                 WD.RQST_WD_AMT,  
             WD.RQST_WD_PCT,  
                                                 WD.WD_AMT_TYP_CD,  
                                                 EE.EE_FST_MID_NM,  
                                                 EE.MIDDLE_NM,  
                                                 EE.EE_LAST_NM,  
             EE.EE_DIV_NO,  
                                                 EE.LANG_CD,  
                                                 STREET_NM,  
                                                 ADDR_LINE_2_T,  
                                                 CITY_NM,  
                                                 ST_CD,  
                                                 ZIP_CD,  
                                                 EBA.REGION_ST_CD,  
                                                 P2.P2_BUS_LINE_T,  
             P2.TABLE_QUALIFIER,  
                                                 OS.ORG_1_NM,  
                                                 OS.ORG_2_NM,  
                                                 CAS.PLAN_PROD_TYP_CD,  
                                                 CAS.ERISA_PLAN_C,  
                                                 CD.ALLIANCE_REL_CD,  
                                  CAS.CONTACT_STREET_NM, CAS.CONTACT_ST_CD, CAS.CONTACT_ZIP_CD,  CAS.*,
                                                (TRIM(WD.CASE_NO) CONCAT TRIM(WD.TR_REF_NO)) AS ORDER_ID   
                    FROM dbsystc.OUTPUT_ACT_PEND OU  
                                                 INNER JOIN dbsystc.WITHDRAWAL_DETAIL WD  
                                                 ON (OU.FIN_ACT_I = WD.FIN_ACT_I)  
                                                 INNER JOIN dbsystc.EMPLOYEE EE  
                                                 ON (EE.CASE_NO = WD.CASE_NO AND EE.SOC_SEC_NO = WD.SOC_SEC_NO)  
                                                 INNER JOIN dbsystc.EE_BEN_ADDRESS EBA  
                                                 ON (EBA.CASE_NO = EE.CASE_NO AND EBA.SOC_SEC_NO = EE.SOC_SEC_NO AND EBA.PAYEE_TYP_CD =  '1')  
                                                 INNER JOIN dbsystc.PLAN_PROV_GRP PPG  
                                                 ON (PPG.ENRL_PROV_GRP_I = OU.ENRL_PROV_GRP_I AND PPG.RELATED_GRP_TYP_C = 361)  
                                                 INNER JOIN dbsystc.CONTRACT_DATA CD  
             ON (SUBSTR(PPG.ACCOUNT_NO, 1, 10) = CD.CONT_NO)  
             INNER JOIN dbsystc.CASE_DATA CAS  
             ON (PPG.ACCOUNT_NO = CAS.CASE_NO)   
                                                 INNER JOIN dbsystc.P2_BUS_LINE P2  
                                                 ON (PPG.BUS_LINE_C = P2.P2_BUS_LINE_C)  
                                                 INNER JOIN dbsystc.ORG_ENRL OE  
                                                 ON (OE.ORG_ENRL_I = PPG.PLAN_ENRL_I AND OE.ROLE_C = 113)  
                                                 INNER JOIN dbsystc.ORG_SEARCH OS  
                                                 ON (OS.ORG_I = OE.ORG_I AND OS.ROLE_C = 13)  
                   WHERE  OUTPUT_ACT_STAT_C =  '1'  
                                 AND OUTPUT_ACT_TYP_C IN ('WDSPCD' , 'WDSPCH' , 'WDSPCI')  
                                 ORDER BY ORDER_ID ASC FETCH FIRST 500 ROWS ONLY  
                   FOR FETCH ONLY WITH UR;




select *
from DBSYSTC.employee
where soc_sec_no in ('395-58-7434', '242-06-3015')
;

--retrieve the participant phone number 
select *
from DBSYSTC.ee_ben_address
where soc_sec_no in ('395-58-7434') and case_no= 'QK61311KR 00001'
;


--retrieve the sponsor phone number 
select *
from DBSYSTC.case_data
where case_no like 'QK61543%' and contact_street_nm like '%MANHATTANVILLE ROAD%'
;

select *
from DBSYSTC.part_enrl_xref
where account_no like 'QK61543KR%'
--ACCOUNT_NO,ENRL_PROV_GRP_I
--QK61543KR 00001,97408762195665630
;

select *
from DBSYSTC.plan_prov_grp
where account_no like 'QK61543KR%' -- or  ENRL_PROV_GRP_I = 97408762195665630
--PLAN_ENRL_I,ENRL_PROV_GRP_I
;

select *
from DBSYSTC.part_enrl
;
select *
from DBSYSTC.person_search
;

select *
from DBSYSTC.le_address
where addr_line_1_t like '%MANHATTANVILLE ROAD%'
;

select *
from DBSYSTC.le_address
where phone_no <> '' and addr_line_1_t like '%MANHATTANVILLE ROAD%'
;


select *
from DBSYSTC.le_telephone
where phone_no  = '8938981461'
--it find fax number under phone_no -> '1508553392'
-- did not find  PHONE_CNTRY_C like '%3392%'
-- did not find or PHONE_EXT_NO like '%3392%'
-- did not find --or INTL_PHONE_NO like '%8553392%'
;


select hist.person_i, hist.account_no, hist.soc_sec_no,hist.BENE_RELAT_C, hist.BENE_TYP_C, hist.BENE_ACCOUNT_NO, hist.BENE_SOC_SEC_NO, hist.BENE_DESIG_EFF_D, hist.BENE_PRCDS_SHR_P, hist.status_c, hist.address_i,addr.PHONE_NO, addr.EMAIL_ADDR_NM, addr.ADDR_LINE_1_T, addr.ADDR_LINE_2_T, addr.ADDR_LINE_3_T, addr.CITY_NM, addr.ST_C, addr.ZIP_C, addr.COUNTRY_C, hist.mod_ts
from DBSYSTC.BENE_HIST HIST, DBSYSTC.LE_ADDRESS ADDR
where 
(hist.account_no = '651658    00001' 
or hist.account_no = '651659    00001' 
or hist.account_no = '651660    00001')
and (hist.soc_sec_no in ('888-77-1171')
and hist.address_i = addr.cp_i and hist.status_c='A')
order by hist.bene_soc_sec_no, hist.status_c
FOR FETCH ONLY WITH UR
;

select * from DBSYSTC.LE_role_cp_rel
where cp_i in (select cp_i from DBSYSTC.le_telephone where phone_no  = '8938981461')
and related_i in (select enrl_prov_grp_i from DBSYSTC.plan_prov_grp where account_no like 'QK61543KR%')
--and RELATED_TYP_C = 361
--and bus_line_c = 2
FOR FETCH ONLY WITH UR;

select * from DBSYSTC.LE_role_cp_rel
where related_i = 97408762195665630
;

select * from DBSYSTC.case_data
where case_no = 'QK61543KR 00001'
;

select * from DBSYSTC.plan_prov_grp 
where enrl_prov_grp_i in (select related_i from DBSYSTC.LE_role_cp_rel where cp_i in (select cp_i from DBSYSTC.le_telephone where phone_no  = '8938981461') )
and account_no like 'QK6%'
;

select * from DBSYSTC.LE_role_cp_rel 
where cp_i in (select cp_i from DBSYSTC.le_telephone where phone_no  = '8938981461') 
and related_i = 9440695095665286
--JK61672JM 00001
;

--Plan sponsor phone and fax query

select * --phone_no,os.role_c, let.phone_typ_c
from dbsystc.org_search os,
     dbsystc.le_role_cp_rel ler,
     dbsystc.le_telephone let
where os.org_no = 'QK61543PD' --'CT71926JM' --'QK61543KR'     -- no affiliate is used here
--and os.role_c = 12 --271               --271= PLAN ADMINISTRATOR/PRIMARY CONTACT  -- 12=plan sponsor
and ler.RELATED_I = os.org_i
and ler.cp_i = let.cp_i
and (let.phone_typ_c = 4          -- 4=daytime phone
or let.phone_typ_c = 1)           -- 1=fax   
for fetch only with ur
;

ORG_I                  ,ROLE_C              ,ORG_SRCH_NM,ORG_NM_S, ORG_NO
2427762195665630,12    ,CREATIVE TECHNIQUES, INC.        ,1       ,QK61543KR

--P3 - employer / sponsor  - QK61920JW
--PHONE_NO,ROLE_C,PHONE_TYP_C
--2328925823,12,4     - phone
--6347547111,12,1     - fax

--the employer name phone number is not in the qry result
--Employer Name 
--SCULPTZ, INC.        (555) 666-6666

select * from dbsystc.le_role_cp_rel ler
where le_i = 2427762195665630 
;

select os.org_i, ler.le_i, ler.related_i, ler.cp_i, let.cp_i,os.org_no, let.phone_typ_c,phone_no,os.role_c
from dbsystc.org_search os,
     dbsystc.le_role_cp_rel ler,
     dbsystc.le_telephone let
where os.org_no = 'QK61311PD' --'QK61543KR' --'CT71926JM' --'QK61543KR'     -- no affiliate is used here
--and os.role_c = 271               --271= PLAN ADMINISTRATOR/PRIMARY CONTACT  -- 12=plan sponsor
and ler.RELATED_I = os.org_i
and ler.cp_i = let.cp_i
and (let.phone_typ_c = 4          -- 4=daytime phone
or let.phone_typ_c = 1)           -- 1=fax   
for fetch only with ur
;

select os.org_i, os.org_no,let.phone_typ_c, COUNT(1) as CNT  --os.org_i, ler.le_i, ler.related_i, ler.cp_i, let.cp_i,os.org_no, let.phone_typ_c  --phone_no,os.role_c, let.phone_typ_c
from dbsystc.org_search os,
     dbsystc.le_role_cp_rel ler,
     dbsystc.le_telephone let
--where os.org_no = 'QK61543KR' --'CT71926JM' --'QK61543KR'     -- no affiliate is used here
where ler.RELATED_I = os.org_i
and os.role_c = 12 --271               --271= PLAN ADMINISTRATOR/PRIMARY CONTACT  -- 12=plan sponsor
and ler.cp_i = let.cp_i
and (let.phone_typ_c = 4          -- 4=daytime phone
or let.phone_typ_c = 1)           -- 1=fax 
group by os.org_i, os.org_no, let.phone_typ_c 
having count(1) > 1 
for fetch only with ur
;

--Plan sponsor phone and fax query
--select os.org_no, os.role_c, let.phone_typ_c, phone_no, COUNT(1) as CNT
select ler.related_i, os.org_no, os.role_c, let.phone_typ_c, COUNT(1) as CNT
from dbsystc.org_search os,
     dbsystc.le_role_cp_rel ler,
     dbsystc.le_telephone let
--where os.org_no like 'QK61%'     -- no affiliate is used here
where os.role_c = 12 --271               --271= PLAN ADMINISTRATOR/PRIMARY CONTACT  -- 12=plan sponsor
and ler.RELATED_I = os.org_i
and ler.cp_i = let.cp_i
and (let.phone_typ_c = 4 )--or let.phone_typ_c = 1)                -- 4=daytime phone     1=fax  
group by ler.related_i,os.org_no, os.role_c, let.phone_typ_c 
having count(1) > 1
for fetch only with ur
;
--QK61531MS  com employer phone (555) 777-6666    and plan sponsor (305) 777-2923

select * from DBSYSTC.le_telephone where cp_i = 54427429607175286

select * from DBSYSTC.pod_sources

select * from DBSYSTC.org_provision

select * from DBSYSTC.org_enrl

select * from DBSYSTC.entity_grp_detail

select * from DBSYSTC.plan_fund

select * from DBSYSTC.plan_fund


select related_i, related_typ_c from DBSYSTC.LE_role_cp_rel where cp_i in (select cp_i from DBSYSTC.le_telephone where phone_no  = '8938981461') and related_typ_c = 361


select * from DBSYSTC.plan_prov_grp
where account_no like 'QK61543KR%'
and enrl_prov_grp_i in (select related_i from DBSYSTC.LE_role_cp_rel)
;

select * from DBSYSTC.org_search  
where org_srch_nm like 'CREATIVE TECHNIQUES 401(K) RET%'
;
--ORG_I,ROLE_C,ORG_SRCH_NM
--66687762195665630,13,CREATIVE TECHNIQUES 401(K) RET

select * from DBSYSTC.org_enrl
where org_i = 8359111583910730 
-- or 66687762195665630;
--org_enrl_i=41697762195665630 = le_i

select * from DBSYSTC.LE_role_cp_rel
where related_i = 97408762195665630
;



select *
from DBSYSTC.ee_ben_address
where  street_nm like '%MANHATTANVILLE ROAD%'  --case_no like 'QK61543%' and
--and phone_no > 8938981000
--or fax_phone_no like '%1461%' or eve_phone_ext_no like '%1461%' or intl_hom_phone_no like '%1461%' or intl_wrk_phone_no like '%1461%' or intl_fax_phone_no like '%1461%' or mobile_phone_no like '%1461%'
FOR FETCH ONLY WITH UR;


SELECT OUTPUT_ACT_I,  
       OUTPUT_ACT_TYP_C,  
       OU.EFF_DT,  
       OU.FIN_ACT_I,  
       WD.TR_REF_NO,  
       WD.CASE_NO,  
       WD.SOC_SEC_NO,  
       WD.STAT_CD,  
       WD.RQST_WD_AMT,  
       WD.RQST_WD_PCT,  
       WD.WD_AMT_TYP_CD,                                                   
       (TRIM(WD.CASE_NO) CONCAT TRIM(WD.TR_REF_NO)) AS ORDER_ID   
 FROM dbsystc.OUTPUT_ACT_PEND OU  
 INNER JOIN dbsystc.WITHDRAWAL_DETAIL WD  
 ON (OU.FIN_ACT_I = WD.FIN_ACT_I)
WHERE OUTPUT_ACT_TYP_C IN ('WDSPCD' , 'WDSPCH' , 'WDSPCI')
--and tr_ref_no = '20180731922229'
;

----------------------------------------------------     /////////////////////////////////////////


-- return the VESTED percentage of a participant per transaction
select *-- src_i, vest_p
from DBSYSTC.trans_vest_ovrd
where tr_ref_no = '20070103900941'-- '20180116922TWC'--'20180116922TVM'
and case_no like 'QK61311KR %'   --'QK61531KR%'
and soc_sec_no = '295-08-3961' --'226-15-6018'--'461-26-9837'
;
--PART_ENRL_I,       ENRL_PROV_GRP_I,  FIN_ACT_I,        SRC_I,          SOC_SEC_NO, TR_REF_NO,     VEST_P,  USER_I,  MOD_TS
--58153875286602488,12235502195665388,94054446290873500,8792925995665388,295-08-3961,20180116922TWC,80.0000,develope,2018-01-16-15.27.44.450306
--58153875286602488,12235502195665388,94054446290873500,98440035995665388,295-08-3961,20180116922TWC,100.0000,develope,2018-01-16-15.27.44.450306


select count(1) -- src_i, vest_p
from DBSYSTC.trans_vest_ovrd
where tr_ref_no = '20070103900941';



-- effective date and cycle date
select eff_dt, cyc_dt 
from DBSYSTC.withdrawal_detail
where tr_ref_no = '20180116922TWC'  --'20180116922TVM'
;


--to set the login for ppt in DDOL, select an existing PPT, then duplicate it informing the new PPT your are creating the login for.
select *
from DBSYSTC.ee_secure_data
where SOC_SEC_NO IN ('102-06-8672')--'395-58-7434', '625-87-4605', '134-69-0823', '395-58-7434')
;

 
 

select *
from DBSYSTC.employee
where case_no = 'QK61311KR 00001'
for fetch only with ur;
---------------------------------------------------

-- request from ddol or p3
select *--case_no, soc_sec_no, stat_cd, RQST_WD_AMT, tr_ref_no, src_cd, user_i, ee_term_dt, eff_dt
From DBSYSTC.WITHDRAWAL_DETAIL
where 
tr_ref_no = '20180731922R7L'--'2018073192222C' '20180731922229'--'20180116922TWC' --'2018031992227N'
and case_no = 'QK61311PD 00001'
for fetch only with UR
;


select *--case_no, soc_sec_no, tr_ref_no, fin_act_i, eff_dt
From DBSYSTC.WITHDRAWAL_DETAIL
where tr_ref_no = '2018081692222C'--'2018070692222B'
for fetch only with UR
;


select *
From DBSYSTC.output_act_log
where fin_act_i = '83068399775525500'
for fetch only with UR
;


-- TESTING REBOOK on P3->Employer WD Request
select *
From DBSYSTC.Case_Remit 
where 
tr_ref_no = '20180803922224'-- '20180802922222' 
--case_no like 'QK61311KR%'
;

select *
From DBSYSTC.BILL_REMIT_DETAIL
where
--case_no = 'QK61311KR 00001' and soc_sec_no = '395-58-7434'
tr_ref_no = '20180803922224'--'20180802922222' --'2018073192222C%' 
for fetch only with UR
;


SELECT *
FROM DBSYSTC.REBOOK_DATA
WHERE FROM_TR_REF_NO in ('2018080292222V')
;

select *
From DBSYSTC.REBOOK_DATA 
where TO_CASE_NO = '' and TO_TR_REF_NO = ''
;



--Remit query to get the sources							
SELECT PSD.SRC_I, PSD.SRC_TYP_C, PSD.TRANSLATION_C, PSD.SRC_S, PSD.DEFAULT_SRC_C, PSD.DIRECTED_SRC_C, PSD.ANNUAL_MTCH_C, PSD.COMBIN_DEFER_C, PSD.COMBIN_DEFER_LIM_P, PSD.CALC_FREQ_PER_C, PSD.CNDTL_CTRB_C, PSD.DEFER_CHG_PER_C, PSD.REINST_PER_C, PSD.DEFER_CHG_FREQ_CT, PSD.REINST_FREQ_CT, PSD.MAND_CTRB_EXCS_P, PSD.INTEG_LVL_C, PSD.MTCH_CTRB_DEPEND_C, PSD.SAFE_HRBR_MTCH_C, PSD.EFF_D, PSD.SRC_T, PSD.SRC_MIN_P, PSD.SRC_MIN_A, PSD.SRC_MAX_P, PSD.SRC_MAX_A, PSD.SRC_HCE_MIN_P, PSD.SRC_HCE_MAX_P, PSD.FORMULA_C, PSD.BKPT_I, PSD.ACTIVE_SRC_C, PSD.SETUP_COMPLETE_C, PSD.ENRL_ALLOW_C, PSD.REPORT_1_NM, PSD.REPORT_2_NM, PSD.SRC_HCE_LMT_A, PSD.SRC_HCE_LMT_P, PSD.SRC_LMT_P, PSD.SRC_LMT_A, PSD.FORMULA_HCE_C, PSD.PRINT_SEQ_NO, PSD.HCE_ALLOW_C, PSD.HCE_OVRD_C, PSD.CATCHUP_ALLOW_C, PSD.CATCHUP_MTCH_C, PSD.CATCHUP_METH_C, PSD.EXCS_BONUS_DEFER_C, PSD.EXCS_BONUS_DEFER_P, PSD.EXCS_BONUS_DEFER_A, PSD.HCE_SEP_FORMULA_C, PSD.SRC_REMIT_DISP_C, PSD.SRC_ALLOW_C, PSD.EXEC_HCE_ALLOW_C, PSD.SRC_EXEC_HCE_MAX_P, PSD.SRC_EXEC_HCE_MIN_P, PSD.DOC_NM, PSD.FORMULA_T, PSD.CTRB_CALC_DESC_T, PSD.DEFER_CHG_FREQ_T, PSD.REINST_FREQ_T, PSD.INTEG_LVL_DESC_T, PSD.FORMULA_HCE_T, PSD.USER_I, PSD.MOD_TS, PSD.AUTO_ENRL_DEF_C, PSD.AUTO_ENRL_DEF_P, PSD.DISTRIB_GRP_I, PSD.DEF_GRP_EFF_YR, PSD.ROTH_AUTO_ENRL_P, PSD.SP_REPORT_1_NM, PSD.SP_REPORT_2_NM, PSD.SPANISH_DOC_NM, PSD.RELATED_SRC_I, PSD.SUB_FORMULA_C, PSD.SUB_FORMULA_T, PSD.AUTO_ESCLT_C, PSD.AUTO_ESCLT_P, PSD.AUTO_ESCLT_MAX_P, PSD.AUTO_ESCLT_MMDD, PSD.AUTO_ESCLT_EFF_D, PSD.AUTO_ENRL_EFF_D, PSD.AUTO_ESCLT_GRP_C, PSD.DIST_GRP_EFF_YR, PSD.AUTO_ESCLT_INCR_C, PSD.AUTO_ESCLT_WAIT_NO, PSD.HCE_MAX_DEFER_A, PSD.EACA_EFF_D, PSD.EACA_IND_C, PSD.PPA_QACA_EFF_D, PSD.ER_CTRB_PFT_IND_C, PSD.AUTO_ENRL_APPLY_C, PSD.SIX_MONTH_REFUND_C, PSD.CREATION_TS, PSD.AUTO_RE_ENRL_C, PSD.AUTO_RE_ENRL_EFF_D, PSD.TRS_MNY_TYP_C, PSD.ALL_403B_CATCHUP_C, PSD.MONEY_TYP_NM, PSD.RELIUS_TYP_NM, PSD.EXT_SRC_C, PSD.HCE_4_ALLOW_C, PSD.HCE_4_MAX_P, PSD.HCE_4_MIN_P, PSD.DOC_APPL_OF_AE_C, PSD.ACA_ANY_EE_EXCL_C, PSD.ACA_ELIG_EE_EXCL_T, PSD.AE_AFF_ELEC_C, PSD.AE_AFF_ELEC_EXP_D, PSD.AE_AFF_ELEC_INC_P, PSD.AI_AFF_ELEC_C, PSD.AI_AFF_ELEC_INC_P, PSD.AI_AFF_ELEC_INC_MAX_P, PSD.AUTO_ESCLT_INITIAL_D, PSD.MTCH_CTRB_MAX_LIMIT_C, PSD.MTCH_CTRB_MAX_LIMIT_P, PSD.MTCH_CTRB_MAX_LIMIT_A, PSD.MTCH_CTRB_APPLIES_C, PSD.HCE_5_ALLOW_C, PSD.HCE_5_MAX_P, PSD.HCE_5_MIN_P, PSD.HCE_6_ALLOW_C, PSD.HCE_6_MAX_P, PSD.HCE_6_MIN_P, PSD.REQ_MAND_ELEC_C, PSD.REHIRE_AUTO_ENRL_C
FROM   DBSYSTT.CO_SOURCE CS, 							
       DBSYSTT.PLAN_PROV_GRP PPG, 							
       DBSYSTT.PLAN_PROVISION PP, 							
       DBSYSTT.PLAN_SRC_DETAIL PSD 							
WHERE PPG.ACCOUNT_NO ='QK61311KR 00001' AND PPG.ENRL_PROV_GRP_I = PP.ENRL_PROV_GRP_I AND PP.PROV_TYP_C = 13 AND PP.PROVISION_I = PSD.SRC_I AND PSD.SRC_TYP_C = CS.SRC_TYP_C AND PSD.ACTIVE_SRC_C IN ('A')  FOR FETCH ONLY;




-- when approve the pending approval on PSD
Select * from DBSYSTC.TRANSACT_APPROVAL
where TR_REF_NO = '20180206922CBW'
;

-- when denying thepending appr on PSD 
Select * from DBSYSTC.TRANSACT_DENY_DETL
where TR_REF_NO = '20180205922C95'
;


-- related to sources
SELECT MIN_WITHDRAWAL_A FROM DBSYSTC.WITHDRAWAL_PROV WHERE PLAN_WD_PROV_I IN ('14052245595665388') FOR FETCH ONLY WITH UR 
;


-- logs the transactions done in ddol for ppt
Select * From DBSYSTC.INET_VRU_DETAIL
where SOC_SEC_NO = '395-58-7434 '  --'226-15-6018'
;


select * from dbsystc.part_vest_ovrd 
where SOC_SEC_NO = '653-85-4210'
;


-- PA- 2343  - related to non-repudiation


Select * From DBSYSTC.INET_VRU_UTIL
where non_repud_cd = 'PWW';

Select * From DBSYSTC.INET_VRU_DETAIL
where SOC_SEC_NO = '727-40-8257'
;

--tc01 and 03
Select * From DBSYSTC.INET_VRU_UTIL
where case_no = 'QK61311KR 00001'
order by trans_ts desc;
--session_ts desc; 

Select * From DBSYSTC.INET_VRU_DETAIL
where case_no = 'QK61311KR 00001'
order by session_ts desc; 


--tc02
Select * From DBSYSTC.INET_VRU_UTIL
where case_no = 'TT069026MS80003'
order by session_ts desc; 

Select * From DBSYSTC.INET_VRU_DETAIL
where case_no = 'TT069026MS80003'
order by session_ts desc; 

--issue with tda plan


Select * From DBSYSTC.INET_VRU_UTIL
where case_no = 'TT069270FP00001'
order by session_ts desc; 

Select * From DBSYSTC.INET_VRU_DETAIL
where case_no = 'TT069270FP00001'
order by session_ts desc; 


--tc05


Select * From DBSYSTC.INET_VRU_UTIL
where case_no like 'QK61543KR 00001%' 
order by session_ts desc; 

Select * From DBSYSTC.INET_VRU_DETAIL
where case_no like 'QK61543KR 00001%'
--and non_repud_Cd = 'PWW'
order by session_ts desc; 

select distinct EE.CASE_NO , EE.SOC_SEC_NO , EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT , EE_MARITAL_STAT_CD,CYE_BAL_EFF_DT
from DBSYSTC.funds_detail FD, DBSYSTC.EMPLOYEE EE, DBSYSTC.plan_prov_grp ppg
where EE.case_no like 'QK61311PD%'--'QK61543KR 00001%'
and CYE_UNIT_CT > '0.00' -- they have money
and fd.case_no = ppg.account_no
and ENRL_STAT_C = 7 -- plan is active
and FD_DESC_CD not in ('PCRA', 'CRF1', 'GDAF', 'G16B')
AND EE.CASE_NO = FD.CASE_NO
AND EE.SOC_SEC_NO = FD.SOC_SEC_NO
and ee.ee_term_dt = '00000000' -- not terminated
--and CYE_BAL_EFF_DT = '20160630'
--and SRC_I count > 1
--and EE_BRTH_DT > '19700101'
for fetch only with UR
;


SELECT   *
FROM     DBSYSTC.HELPER
WHERE    HLP_CODE like 'PSOLNREP%'
and HLP_VALUE like 'PWW%';


---- PA-2165   ----------------------------------

SELECT   *
FROM     DBSYSTC.HELPER
WHERE    
HLP_CODE like 'PSOLNREP%' and (HLP_VALUE like 'PWL%' or HLP_VALUE like 'PWR%' or HLP_VALUE like 'PWA%');



Select * From DBSYSTC.INET_VRU_UTIL
where case_no like 'QK61543KR 00001%' 
order by trans_ts desc; 

-- ERR_MSG2_TXT : shows a brief description of the error happening with a SSN
Select CASE_NO,SOC_SEC_NO,TRANS_TS,NON_REPUD_CD,TR_REF_NO,ERR_MSG1_TXT,ERR_MSG2_TXT,USER_NO,DO_NOT_CHANGE_ME,SESSION_ID,SESSION_TS
From DBSYSTC.INET_VRU_DETAIL
where case_no like 'QK61543PD 00001%'
and soc_sec_no = '625-87-4605'
--and non_repud_Cd = 'PWW'
order by trans_ts desc; 




--tc 02

Select * From DBSYSTC.INET_VRU_UTIL
where case_no like 'TA080459KR00001%' 
order by trans_ts desc; 

Select CASE_NO,SOC_SEC_NO,TRANS_TS,NON_REPUD_CD,TR_REF_NO,ERR_MSG1_TXT,ERR_MSG2_TXT,USER_NO,DO_NOT_CHANGE_ME,SESSION_ID,SESSION_TS
From DBSYSTC.INET_VRU_DETAIL
where case_no like 'TA080459KR00001%'
order by trans_ts desc; 



-- tc 03

-- TDA plan
select distinct EE.CASE_NO , EE.SOC_SEC_NO , EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT , CYE_BAL_EFF_DT
from dbsystt.funds_detail FD, dbsystt.EMPLOYEE EE, dbsystt.plan_prov_grp ppg
where EE.case_no like 'TA080581KP%' --0459KR00001%' --= '342483    00000'--like 'QK62899MS%'
and CYE_UNIT_CT > '0.00' -- they have money
and fd.case_no = ppg.account_no
and ENRL_STAT_C = 7 -- plan is active
and FD_DESC_CD not in ('PCRA', 'CRF1', 'GDAF', 'G16B')
AND EE.CASE_NO = FD.CASE_NO
AND EE.SOC_SEC_NO = FD.SOC_SEC_NO
and ee.ee_term_dt = '00000000' -- not terminated
for fetch only with UR
;

select *
from DBSYSTT.ee_secure_data
where SOC_SEC_NO IN ('637-22-9884','595-54-5108' )--'074-11-0844','367-72-5127','036-42-5136', '005-85-1020' )--'046-02-2719','295-08-3961','983-28-3881')
;


Select * From DBSYSTC.INET_VRU_UTIL
where case_no like 'TA080581KP00001%' 
order by trans_ts desc; 

Select CASE_NO,SOC_SEC_NO,TRANS_TS,NON_REPUD_CD,TR_REF_NO,ERR_MSG1_TXT,ERR_MSG2_TXT,USER_NO,DO_NOT_CHANGE_ME,SESSION_ID,SESSION_TS
From DBSYSTC.INET_VRU_DETAIL
where case_no like 'TA080581KP00001%'
order by trans_ts desc; 

 

--tc 04


Select * From DBSYSTC.INET_VRU_UTIL
where case_no like 'TA080581KP00001%' 
order by trans_ts desc; 

Select CASE_NO,SOC_SEC_NO,TRANS_TS,NON_REPUD_CD,TR_REF_NO,ERR_MSG1_TXT,ERR_MSG2_TXT,USER_NO,DO_NOT_CHANGE_ME,SESSION_ID,SESSION_TS
From DBSYSTC.INET_VRU_DETAIL
where case_no like 'TA080581KP00001%'
order by trans_ts desc; 

Select CASE_NO,SOC_SEC_NO,TRANS_TS,NON_REPUD_CD,TR_REF_NO,ERR_MSG1_TXT,ERR_MSG2_TXT,USER_NO,DO_NOT_CHANGE_ME,SESSION_ID,SESSION_TS
From DBSYSTC.INET_VRU_DETAIL
where err_msg2_txt like '%ApprovalDenyReader.getApprovalSubmit%'
order by trans_ts desc;

Select CASE_NO,SOC_SEC_NO,TRANS_TS,NON_REPUD_CD,TR_REF_NO,ERR_MSG1_TXT,ERR_MSG2_TXT,USER_NO,DO_NOT_CHANGE_ME,SESSION_ID,SESSION_TS
From DBSYSTC.INET_VRU_DETAIL 
where case_no like 'QK61%' and NON_REPUD_CD = 'PWA'
order by trans_ts desc; 

--tc 05 



Select * From DBSYSTC.INET_VRU_UTIL
where case_no like 'QK61311KR %' 
order by trans_ts desc; 

Select CASE_NO,SOC_SEC_NO,TRANS_TS,NON_REPUD_CD,TR_REF_NO,ERR_MSG1_TXT,ERR_MSG2_TXT,USER_NO,DO_NOT_CHANGE_ME,SESSION_ID,SESSION_TS
From DBSYSTC.INET_VRU_DETAIL
where case_no like 'QK61311KR %'
order by trans_ts desc; 




 ---------------------------

SELECT * FROM DBSYSTC.PENSION.HELPER where HLP_CODE = 'PSOLNREP'
;

SELECT * FROM dbsystt.NOTIFICATION N, dbsystt.NOTIFICATION_DETAIL ND, dbsystt.NOTIFICATION_CONTENT NC
WHERE N.NOTIFICATION_I = ND.NOTIFICATION_I
AND ACCOUNT_NO like 'QK61311KR%%'
AND TR_REF_NO = '2018031992227N'
AND N.APPL_C = NC.APPL_C;


SELECT * from DBREGRC.EMPLOYEE
where SOC_SEC_NO in ('271-88-4700','019-48-6887')
;

-- it creates an user for ppt login into ddol
-- example  in TEST env
select *
from dbsystc.ee_secure_data
where SOC_SEC_NO IN ('004-97-6047','102-06-8672','295-08-3961','002-08-6692') 
;
--******** example ssn: 295-08-3961  in REGRESSION env
SELECT * FROM DBREGRC.EE_SECURE_DATA
where SOC_SEC_NO in ('019-48-6887','824-59-7499')
;

-- spouse consent 
Select * from DBSYSTT.OUTPUT_ACT_LOG
where FIN_ACT_I = '81351211964553500'
;

-- spouc consent  in pending
Select * from DBSYSTC.OUTPUT_ACT_PEND
where FIN_ACT_I = '81351211964553500'
;

-- get the source name for the vesting
select SRC_I, REPORT_1_NM , REPORT_2_NM 
from dbsystp.plan_src_detail
where src_i in ('98440035995665388','8792925995665388') 
;



--*****************************************************
-- Withdrawal Information
--*****************************************************

--Withdrawal Information;
-- stat_cd:
-- 0 = pending
-- 1 = pending sponsor approval (EM only)
-- 2 = on pending tpa approval (EM only)
-- 3 = cancelled
-- 4 = pending approval (IM only)
-- 6 = reversed
-- 9 = denied
select case_no, soc_sec_no, stat_cd, RQST_WD_AMT, tr_ref_no, src_cd, user_i, ee_term_dt, eff_dt
From DBSYSTC.WITHDRAWAL_DETAIL
where tr_ref_no in ('20180815923CCH', '20180824922232', '2018082392223F', '2018081692222C' )
;






--Trailing contribution SQL:
SELECT
               count(td.SRC_I)
FROM
               DBSYSTC.TRANSACT_DETAIL TD,
               (
                              SELECT
                                             PPG.ACCOUNT_NO
                              FROM
                                             DBSYSTC.PLAN_PROV_GRP PPG
                              WHERE
                                             ACCOUNT_NO = 'QK61311KR  00001'
                                             AND RELATED_GRP_TYP_C = 361
               UNION ALL SELECT
                                             PPG2.ACCOUNT_NO
                              FROM
                                             DBSYSTC.PLAN_PROV_GRP PPG1,
                                             DBSYSTC.PLAN_PROV_GRP PPG2
                              WHERE
                                             PPG1.ACCOUNT_NO = 'QK61311KR  00001'
                                             AND PPG1.RELATED_GRP_TYP_C = 361
                                             AND PPG2.RELATED_GRP_I = PPG1.ENRL_PROV_GRP_I
                                             AND PPG2.RELATED_GRP_TYP_C = 362
               ) PPG
WHERE
               (
                              (
                                             TD.TR_TYP_CD = '1'
                                             AND TD.TR_NO LIKE '1%'
                                             AND TD.TR_NO NOT IN(
                                                            '1008',
                                                            '1018',
                                                            '1035',
                                                            '1046',
                                                            '1036',
                                                            '1037',
                                                            '1039',
                                                            '1033'
                                             )
                              )
                              OR TD.TR_NO IN(
                                             '1006',
                                             '1119'
                              )
               )
               AND TD.TR_REVSL_DISP_CD = '0'
               AND(
                              TD.EFF_DT > '20180103'
                              OR TD.CYC_DT > '20180116'
               ) 
               AND TD.CASE_NO = PPG.ACCOUNT_NO
               AND TD.SOC_SEC_NO = '226-15-6018'
               AND TD.SRC_I IN(SELECT TVO.SRC_I FROM DBSYSTC.TRANS_VEST_OVRD TVO WHERE TVO.SOC_SEC_NO = '226-15-6018' AND TVO.TR_REF_NO = ''/*FOD TR_REF_NO*/ AND TVO.VEST_P != 100)
               FOR FETCH ONLY WITH UR;

select *
FROM DBSYSTC.employee
where soc_sec_no = '005-85-1020'
--case_no like 'TA080459%' ;
;
-------------------------------------
--Query para procurar ppts de algum case específico que possuam balance > $0.
-- plus ppt with termination date <> 00000000

SELECT STEP1.SOC_SEC_NO,STEP1.FD_DESC_CD,H.HLP_TEXT,SUM(STEP1.CYE_UNIT_CT) CYE_UNIT_CT
FROM (SELECT FD.SOC_SEC_NO, FD.FD_DESC_CD, SUM(FD.CYE_UNIT_CT) CYE_UNIT_CT
FROM DBSYSTC.CASE_DATA CD,
      DBSYSTC.FUNDS_DETAIL FD
WHERE CD.CASE_NO IN (
SELECT PPG.ACCOUNT_NO
FROM DBSYSTC.PLAN_PROV_GRP PPG
WHERE ACCOUNT_NO ='QK62454MS 00001'
UNION
SELECT PPG2.ACCOUNT_NO
FROM DBSYSTC.PLAN_PROV_GRP PPG1,
	DBSYSTC.PLAN_PROV_GRP PPG2
WHERE PPG1.ACCOUNT_NO ='QK62454MS 00001'
AND PPG2.RELATED_GRP_I = PPG1.ENRL_PROV_GRP_I)
AND FD.CASE_NO = CD.CASE_NO
AND FD.CYE_BAL_EFF_DT=CD.LAST_CYE_REV_DT
AND FD.PYE_BAL_EFF_DT=CD.LAST_PYE_VAL_DT
GROUP BY FD.SOC_SEC_NO, FD.FD_DESC_CD
UNION ALL
SELECT TD.SOC_SEC_NO, TD.FD_DESC_CD, SUM(TD.TR_UNITS_AMT) CYE_UNIT_CT
FROM DBSYSTC.CASE_DATA CD, DBSYSTC.TRANSACT_DETAIL TD
WHERE CD.CASE_NO IN (
SELECT PPG.ACCOUNT_NO
FROM DBSYSTC.PLAN_PROV_GRP PPG WHERE ACCOUNT_NO='QK62454MS 00001'
UNION
SELECT PPG2.ACCOUNT_NO FROM DBSYSTC.PLAN_PROV_GRP PPG1,DBSYSTC.PLAN_PROV_GRP PPG2 
WHERE PPG1.ACCOUNT_NO ='QK62454MS 00001' AND PPG2.RELATED_GRP_I = PPG1.ENRL_PROV_GRP_I
)
AND TD.CASE_NO=CD.CASE_NO
AND TD.EFF_DT>CD.LAST_CYE_REV_DT
AND TD.TR_REVSL_DISP_CD='0'
AND TD.BKT_NO='00'
GROUP BY TD.CASE_NO,TD.SOC_SEC_NO,TD.FD_DESC_CD
UNION
SELECT TD.SOC_SEC_NO, TD.FD_DESC_CD, SUM(TD.TR_AMT) CYE_UNIT_CT
FROM DBSYSTC.CASE_DATA CD,DBSYSTC.TRANSACT_DETAIL TD
WHERE CD.CASE_NO IN
(SELECT PPG.ACCOUNT_NO
FROM DBSYSTC.PLAN_PROV_GRP PPG
WHERE ACCOUNT_NO='QK62454MS 00001'
UNION
SELECT PPG2.ACCOUNT_NO
FROM DBSYSTC.PLAN_PROV_GRP PPG1,DBSYSTC.PLAN_PROV_GRP PPG2
WHERE PPG1.ACCOUNT_NO='QK62454MS 00001'
AND PPG2.RELATED_GRP_I=PPG1.ENRL_PROV_GRP_I)
AND TD.CASE_NO = CD.CASE_NO
AND TD.EFF_DT > CD.LAST_CYE_REV_DT
AND TD.TR_REVSL_DISP_CD = '0'
AND TD.BKT_NO <> '00'
GROUP BY SOC_SEC_NO, FD_DESC_CD)
STEP1,DBSYSTC.HELPER2 H,DBSYSTC.FUNDDESC F
WHERE F.FD_DESCR_CODE=STEP1.FD_DESC_CD
AND H.HLP_CODE='55104B'
AND H.HLP_VALUE=F.FD_TYPE_CD
--and step1.soc_sec_no in (SELECT SOC_SEC_NO FROM DBSYSTC.employee where ee_term_dt <> '00000000')
GROUP BY SOC_SEC_NO,FD_DESC_CD,H.HLP_TEXT
;

--Query para procurar ppts de algum case específico que possuam balance > $0. 
--Se for usar em Regression, só é necessário atualizar o SCHEMA
-- it was joined with the query to find FOD participants (last clausure)



SELECT STEP1.SOC_SEC_NO,STEP1.FD_DESC_CD,H.HLP_TEXT,SUM(STEP1.CYE_UNIT_CT) CYE_UNIT_CT
FROM (SELECT FD.SOC_SEC_NO, FD.FD_DESC_CD, SUM(FD.CYE_UNIT_CT) CYE_UNIT_CT
FROM DBSYSTC.CASE_DATA CD,
      DBSYSTC.FUNDS_DETAIL FD
WHERE CD.CASE_NO IN (
SELECT PPG.ACCOUNT_NO
FROM DBSYSTC.PLAN_PROV_GRP PPG
WHERE ACCOUNT_NO ='QK62454MS 00001'
UNION
SELECT PPG2.ACCOUNT_NO
FROM DBSYSTC.PLAN_PROV_GRP PPG1,
	DBSYSTC.PLAN_PROV_GRP PPG2
WHERE PPG1.ACCOUNT_NO ='QK62454MS 00001'
AND PPG2.RELATED_GRP_I = PPG1.ENRL_PROV_GRP_I)
AND FD.CASE_NO = CD.CASE_NO
AND FD.CYE_BAL_EFF_DT=CD.LAST_CYE_REV_DT
AND FD.PYE_BAL_EFF_DT=CD.LAST_PYE_VAL_DT
GROUP BY FD.SOC_SEC_NO, FD.FD_DESC_CD
UNION ALL
SELECT TD.SOC_SEC_NO, TD.FD_DESC_CD, SUM(TD.TR_UNITS_AMT) CYE_UNIT_CT
FROM DBSYSTC.CASE_DATA CD, DBSYSTC.TRANSACT_DETAIL TD
WHERE CD.CASE_NO IN (
SELECT PPG.ACCOUNT_NO
FROM DBSYSTC.PLAN_PROV_GRP PPG WHERE ACCOUNT_NO='QK62454MS 00001'
UNION
SELECT PPG2.ACCOUNT_NO FROM DBSYSTC.PLAN_PROV_GRP PPG1,DBSYSTC.PLAN_PROV_GRP PPG2 
WHERE PPG1.ACCOUNT_NO ='QK62454MS 00001' AND PPG2.RELATED_GRP_I = PPG1.ENRL_PROV_GRP_I
)
AND TD.CASE_NO=CD.CASE_NO
AND TD.EFF_DT>CD.LAST_CYE_REV_DT
AND TD.TR_REVSL_DISP_CD='0'
AND TD.BKT_NO='00'
GROUP BY TD.CASE_NO,TD.SOC_SEC_NO,TD.FD_DESC_CD
UNION
SELECT TD.SOC_SEC_NO, TD.FD_DESC_CD, SUM(TD.TR_AMT) CYE_UNIT_CT
FROM DBSYSTC.CASE_DATA CD,DBSYSTC.TRANSACT_DETAIL TD
WHERE CD.CASE_NO IN
(SELECT PPG.ACCOUNT_NO
FROM DBSYSTC.PLAN_PROV_GRP PPG
WHERE ACCOUNT_NO='QK62454MS 00001'
UNION
SELECT PPG2.ACCOUNT_NO
FROM DBSYSTC.PLAN_PROV_GRP PPG1,DBSYSTC.PLAN_PROV_GRP PPG2
WHERE PPG1.ACCOUNT_NO='QK62454MS 00001'
AND PPG2.RELATED_GRP_I=PPG1.ENRL_PROV_GRP_I)
AND TD.CASE_NO = CD.CASE_NO
AND TD.EFF_DT > CD.LAST_CYE_REV_DT
AND TD.TR_REVSL_DISP_CD = '0'
AND TD.BKT_NO <> '00'
GROUP BY SOC_SEC_NO, FD_DESC_CD)
STEP1,DBSYSTC.HELPER2 H,DBSYSTC.FUNDDESC F
WHERE F.FD_DESCR_CODE=STEP1.FD_DESC_CD
AND H.HLP_CODE='55104B'
AND H.HLP_VALUE=F.FD_TYPE_CD
AND STEP1.SOC_SEC_NO IN (select wd.soc_sec_no
from DBSYSTC.withdrawal_detail wd, DBSYSTC.trans_vest_ovrd vest 
where wd.case_no = 'QK62454MS 00001'
and wd.tr_no in ('3030','3040','3050')
and wd.pymt_stat_cd = 1
and wd.stat_cd = 8 
and wd.tr_ref_no = vest.tr_ref_no
and wd.soc_sec_no = vest.soc_sec_no)
GROUP BY SOC_SEC_NO,FD_DESC_CD,H.HLP_TEXT;


--FOD participants
select wd.case_no, wd.tr_no, wd.soc_sec_no, wd.pymt_stat_cd, wd.creation_ts, wd.TR_REF_NO, vest.tr_ref_no
from DBSYSTC.withdrawal_detail wd, DBSYSTC.trans_vest_ovrd vest 
where wd.case_no = 'QK61311KR 00001'
and wd.soc_sec_no = '295-08-3961'  --'295-55-5965'
and wd.tr_no in ('3030','3040','3050')
and wd.pymt_stat_cd = 1
and wd.stat_cd = 8 
and wd.tr_ref_no = vest.tr_ref_no
and wd.soc_sec_no = vest.soc_sec_no
FOR FETCH ONLY WITH UR;

--QK61311KR 00001
--P295-08-3961(100% vested)
--FOD: TR_REF_NO: 20180116922TWC

----------------------------------------------------------------------- STEPHANIE's QUERIES

- ************************************************************
-- STEP 1. RUN THIS IN PRODUCTION TO FIND PLANS
-- ************************************************************

--TO GET HARDSHIP & IN-SERVICE PLAN LEVEL DATA
-- WD_TYP_C: 0 = Hardship, 1 = In Service, 2 = custom
-- WD_ONLINE_C = 0 = do not display, 1 =display only, 2 = allow request
--approval_c: 0=n/a, 1 = transamerica, 2 =plan admin paper

SELECT PPG.ACCOUNT_NO, PLAN_WD_PROV_I , WD_SUB_TYPE_DESC_T , WD_TYP_C, APPROVAL_C , WD_ONLINE_C , ONLY_FULL_VEST_C , MAX_WD_PER_CT , MAX_WD_FREQ , MAX_WD_FRQ_CT , MAX_WD_FREQ_PER , MAX_WD_TIMEPER_C , SUSP_PER_CT , SUSP_TIMEPER_C , MIN_WITHDRAWAL_A , HRDSHP_ALL_P_BEN_C , MAIL_SUSP_RENTRY_C , SUSP_LTR_LD_DAYS_C , PRO_RATA_CALC_C , GROUPED_WD_RESTRICT_C
FROM DBSYSTC.PLAN_PROV_GRP PPG, DBSYSTC.PLAN_PROVISION PP, DBSYSTC.WITHDRAWAL_PROV WP
--WHERE PPG.ACCOUNT_NO like '93%'--if you do not know the case
where ppg.account_no = 'QK62454MS 00001' 
and PPG.RELATED_GRP_TYP_C = 361
AND PP.ENRL_PROV_GRP_I = PPG.ENRL_PROV_GRP_I
AND PP.PROVISION_I = WP.PLAN_WD_PROV_I
and wd_online_c = '2' -- allow request
--AND WP.WD_TYP_C ='0'--HARDSHIP
AND WP.WD_TYP_C ='1' --IN-SERVICE
--AND WP.WD_TYP_C ='2' --custom (mercer) you dont care about this
FOR FETCH ONLY WITH UR
;
-- ************************************************************
-- STEP 2 - FIND PARTICIPANTS WITH BALANCES
-- ************************************************************
--When CYE_UNIT_CT column is > 0 then those participants have a balance. You will notice
--that one participant can have multiple rows (one per fund they are holding)
select distinct EE.CASE_NO , EE.SOC_SEC_NO , EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT , CYE_BAL_EFF_DT
from DBSYSTC.funds_detail FD, DBSYSTC.EMPLOYEE EE, DBSYSTC.plan_prov_grp ppg
where EE.case_no like 'QK62454MS%'
and CYE_UNIT_CT > '0.00' -- they have money
and fd.case_no = ppg.account_no
and ENRL_STAT_C = 7 -- plan is active
and FD_DESC_CD not in ('PCRA', 'CRF1', 'GDAF', 'G16B')
AND EE.CASE_NO = FD.CASE_NO
AND EE.SOC_SEC_NO = FD.SOC_SEC_NO
and ee.ee_term_dt = '00000000' -- not terminated
and CYE_BAL_EFF_DT = '20151231'
--and SRC_I count > 1
--and EE_BRTH_DT > '19700101'
for fetch only with UR
;

-- *******************************************************************
-- NOW THAT YOU HAVE FOUND A PLAN REQUEST TO MOVE IT TO TEST ENVIRONMENT
-- look again for participants because the ssn's change
-- if they are older than 59.5 they ususally have in service money
-- *******************************************************************
select distinct EE.CASE_NO , EE.SOC_SEC_NO , EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT , CYE_BAL_EFF_DT, CYE_UNIT_CT
from dbsystc.funds_detail FD, dbsystc.EMPLOYEE EE, dbsystc.plan_prov_grp ppg
where EE.case_no like 'QK61311KR%' --'Q51483%' --'QK62454MS%' --'Q51695%'
and CYE_UNIT_CT > '1000.00' -- they have money
and fd.case_no = ppg.account_no
and ENRL_STAT_C = 7 -- plan is active
and FD_DESC_CD not in ('PCRA', 'CRF1', 'GDAF', 'G16B')
AND EE.CASE_NO = FD.CASE_NO
AND EE.SOC_SEC_NO = FD.SOC_SEC_NO
and ee.ee_term_dt <> '00000000' -- 0 = not terminated
for fetch only with UR;
-- *******************************************************************
-- STEP 3 - GET INFO FOR REGISTERING THEM ON DDOL
-- *******************************************************************
select ee.case_no, ee.soc_sec_no, ee_brth_dt, ed.zip_cd
from dbsystc.EMPLOYEE ee,
     dbsystc.ee_ben_address ed
where EE.case_no like 'QK62899MS%'
  and ee.soc_sec_no = '735-50-5930'
  and ee.case_no = ed.case_no
  and ee.soc_sec_no = ed.soc_sec_no
for fetch only with UR
;

-- this is for fyi only. you don't need to do this
-- registratin info is written here after they register. can't do this in production
select * from dbsystc.ee_secure_data
where 
--case_no like 'QK62899MS%' 
 soc_sec_no in ('295-11-2124','295-69-2965')
;


-- *******************************************************************
-- STEP 4 - If you want to move this case to test see which table it's 
-- in and check to see if it's already there
-- *******************************************************************

-- see which DB try CORP and if it's not there try TDA
Select * 
from CORP.CASE_DATA
--from TDA.CASE_DATA
where case_no = 'QK63033   00001'

-- see if it's already in test
Select *
from dbsystc.CASE_DATA


--*******************************************************
--FIND ACCOUNT_NO 
--*******************************************************

SELECT ACCOUNT_NO , BUS_LINE_C , PROV_GRP_SRCH_NM, ENRL_PROV_GRP_I, 
       DFLT_GRP_C, RELATED_GRP_I, RELATED_GRP_TYP_C , ENRL_STAT_C 
  FROM DBSYSTC.PLAN_PROV_GRP
WHERE ACCOUNT_NO =  'JK62446SK 00001'
   AND RELATED_GRP_TYP_C = 361

UNION ALL

SELECT B.ACCOUNT_NO , B.BUS_LINE_C , B.PROV_GRP_SRCH_NM, B.ENRL_PROV_GRP_I, 
       B.DFLT_GRP_C, B.RELATED_GRP_I, B.RELATED_GRP_TYP_C , B.ENRL_STAT_C  
  FROM DBSYSTC.PLAN_PROV_GRP A,
       DBSYSTC.PLAN_PROV_GRP B
WHERE A.ACCOUNT_NO =  'JK62446SK 00001'
   AND A.RELATED_GRP_TYP_C = 361
   AND A.ENRL_PROV_GRP_I = B.RELATED_GRP_I
   AND B.RELATED_GRP_TYP_C = 362

--******************************************************
-- FIND ACCOUNT PROVISIONS
--******************************************************

SELECT A.ACCOUNT_NO , A.ENRL_PROV_GRP_I, 
       B.PROVISION_I, B.PROV_TYP_C
  FROM DBSYSTC.PLAN_PROV_GRP A,
       DBSYSTC.PLAN_PROVISION B
WHERE A.ACCOUNT_NO =  'JK62446SK 00001'
   AND A.RELATED_GRP_TYP_C = 361
   AND A.ENRL_PROV_GRP_I = B.ENRL_PROV_GRP_I

UNION ALL

SELECT B.ACCOUNT_NO , B.ENRL_PROV_GRP_I ,   
       C.PROVISION_I, C.PROV_TYP_C
  FROM DBSYSTC.PLAN_PROV_GRP A,
       DBSYSTC.PLAN_PROV_GRP B,
       DBSYSTC.PLAN_PROVISION C
WHERE A.ACCOUNT_NO =  'JK62446SK 00001'
   AND A.RELATED_GRP_TYP_C = 361
   AND A.ENRL_PROV_GRP_I = B.RELATED_GRP_I
   AND B.RELATED_GRP_TYP_C = 362
   AND B.ENRL_PROV_GRP_I = C.ENRL_PROV_GRP_I
order by prov_typ_c

SELECT *
  FROM DBSYSTC.HELPER2
WHERE HLP_CODE LIKE 'PROV_TYP'

--*************************************************
-- FIND ACCOUNT FUNDS
--*************************************************


SELECT A.ACCOUNT_NO , A.ENRL_PROV_GRP_I, 
       B.PROVISION_I, B.PROV_TYP_C, FD_DESC_CD, REPORT_1_FD_NM, REPORT_2_FD_NM
  FROM DBSYSTC.PLAN_PROV_GRP A,
       DBSYSTC.PLAN_PROVISION B,
       DBSYSTC.PLAN_FUND C
       
 WHERE A.ACCOUNT_NO =  'QK61543KR 00001'--'JK62446SK 00001'
   AND A.RELATED_GRP_TYP_C = 361
   AND A.ENRL_PROV_GRP_I = B.ENRL_PROV_GRP_I
   AND B.PROVISION_I = C.FD_PROV_I
   AND B.PROV_TYP_C = 15

UNION ALL

SELECT B.ACCOUNT_NO , B.ENRL_PROV_GRP_I ,   
       C.PROVISION_I, C.PROV_TYP_C, FD_DESC_CD, REPORT_1_FD_NM, REPORT_2_FD_NM
  FROM DBSYSTC.PLAN_PROV_GRP A,
       DBSYSTC.PLAN_PROV_GRP B,
       DBSYSTC.PLAN_PROVISION C,
       DBSYSTC.PLAN_FUND D
WHERE A.ACCOUNT_NO =  'QK61543KR 00001'--'JK62446SK 00001'
   AND A.RELATED_GRP_TYP_C = 361
   AND A.ENRL_PROV_GRP_I = B.RELATED_GRP_I
   AND B.RELATED_GRP_TYP_C = 362
   AND B.ENRL_PROV_GRP_I = C.ENRL_PROV_GRP_I
   AND C.PROVISION_I = D.FD_PROV_I
   AND C.PROV_TYP_C = 15
;
--************************************************************
-- find plan sources
--************************************************************


SELECT A.ACCOUNT_NO , A.ENRL_PROV_GRP_I, 
       B.PROVISION_I, B.PROV_TYP_C, SRC_TYP_C, REPORT_1_NM, REPORT_2_NM, SRC_MIN_P,  SRC_MIN_a
  FROM DBSYSTC.PLAN_PROV_GRP A,
       DBSYSTC.PLAN_PROVISION B,
       DBSYSTC.plan_src_detail C
       
 WHERE A.ACCOUNT_NO =  'JK62446SK 00001'
   AND A.RELATED_GRP_TYP_C = 361
   AND A.ENRL_PROV_GRP_I = B.ENRL_PROV_GRP_I
   AND B.PROVISION_I = C.src_i
   AND B.PROV_TYP_C = 13

UNION ALL

SELECT B.ACCOUNT_NO , B.ENRL_PROV_GRP_I ,   
       C.PROVISION_I, C.PROV_TYP_C, SRC_TYP_C, REPORT_1_NM, REPORT_2_NM, SRC_MIN_P,  SRC_MIN_A
  FROM DBSYSTC.PLAN_PROV_GRP A,
       DBSYSTC.PLAN_PROV_GRP B,
       DBSYSTC.PLAN_PROVISION C,
       DBSYSTC.PLAN_src_detail D
WHERE A.ACCOUNT_NO =  'JK62446SK 00001'
   AND A.RELATED_GRP_TYP_C = 361
   AND A.ENRL_PROV_GRP_I = B.RELATED_GRP_I
   AND B.RELATED_GRP_TYP_C = 362
   AND B.ENRL_PROV_GRP_I = C.ENRL_PROV_GRP_I
   AND C.PROVISION_I = D.src_i
   AND C.PROV_TYP_C = 13

--**************************************************************
-- FIND PARTICIPANT
--**************************************************************

SELECT A.ACCOUNT_NO, A.ENRL_PROV_GRP_I , A.RELATED_GRP_TYP_C, 
       A.SOC_SEC_NO, A.PART_ENRL_I , A.PERSON_I, C.EE_FST_MID_NM, 
       C.EE_LAST_NM, C.EE_BRTH_DT, C.EE_HIRE_DT 
  FROM dbsystc.part_enrl_xref a,
       DBSYSTC.PERSON_SEARCH B,
       DBSYSTC.EMPLOYEE C
WHERE A.ACCOUNT_NO = 'QK61543KR 00001' --'JK62446SK 00001'
   --AND A.SOC_sEC_NO = '034-18-7847'  
   AND A.PERSON_I = B.PERSON_I
   AND A.SOC_sEC_NO = B.SOC_sEC_NO
   AND A.ACCOUNT_NO = C.CASE_NO
   AND A.SOC_sEC_NO = C.SOC_SEC_NO

--****************************************************************
-- FIND TRANSACT_DETAIL I.E. TRANSACTION HISTORY FOR A PARTICIPANT
--****************************************************************

Select CASE_NO, SOC_SEC_NO , TR_REF_NO ,tr_no, TR_AMT , 
       TR_UNITS_AMT , EFF_DT , FD_DESC_CD , CTRB_TYP_CD , INTL_ACCT_CD 
  from dbsystc.transact_detail 
 where soc_Sec_no = '034-18-7847' 
   and case_no in (
SELECT ACCOUNT_NO
  FROM DBSYSTC.PLAN_PROV_GRP
WHERE ACCOUNT_NO =  'JK62446SK 00001'
   AND RELATED_GRP_TYP_C = 361

UNION ALL

SELECT B.ACCOUNT_NO  
  FROM DBSYSTC.PLAN_PROV_GRP A,
       DBSYSTC.PLAN_PROV_GRP B
WHERE A.ACCOUNT_NO =  'JK62446SK 00001'
   AND A.RELATED_GRP_TYP_C = 361
   AND A.ENRL_PROV_GRP_I = B.RELATED_GRP_I
   AND B.RELATED_GRP_TYP_C = 362)

--**************************************************************
-- FIND PARTICIPANT ELECTIONS
--**************************************************************

SELECT A.ACCOUNT_NO, A.ENRL_PROV_GRP_I , A.RELATED_GRP_TYP_C, 
       A.SOC_SEC_NO, A.PART_ENRL_I , A.PERSON_I,
       D.EFF_D, D.ELEC_TYP_C, D.SRC_I, D.FD_DESC_C, D.ELEC_P
  FROM DBSYSTC.PART_ENRL_XREF A,
       DBSYSTC.PERSON_SEARCH B,
       DBSYSTC.EMPLOYEE C,
       DBSYSTC.PART_ELECT_DETAIL D
WHERE A.ACCOUNT_NO = 'JK62446SK 00001'
   AND A.SOC_sEC_NO = '034-18-7847'  
   AND A.PERSON_I = B.PERSON_I
   AND A.SOC_sEC_NO = B.SOC_sEC_NO
   AND A.ACCOUNT_NO = C.CASE_NO
   AND A.SOC_sEC_NO = C.SOC_SEC_NO
   AND A.ENRL_PROV_GRP_I = D.ENRL_PROV_GRP_I
   AND A.PART_ENRL_I = D.PART_ENRL_I


--**************************************************************
-- FIND PARTICIPANT ELECTIONS
--**************************************************************

SELECT A.ACCOUNT_NO, A.ENRL_PROV_GRP_I , A.RELATED_GRP_TYP_C, 
       A.SOC_SEC_NO, A.PART_ENRL_I , A.PERSON_I,
       LOAN_NO, INIT_LN_AMT, FST_LN_REPAY_DT
  FROM DBSYSTC.PART_ENRL_XREF A,
       DBSYSTC.PERSON_SEARCH B,
       DBSYSTC.EMPLOYEE C,
       DBSYSTC.LOAN_DETAIL D
WHERE A.ACCOUNT_NO = 'JK62446SK 00001'
   AND A.SOC_sEC_NO = '034-18-7847'  
   AND A.PERSON_I = B.PERSON_I
   AND A.SOC_sEC_NO = B.SOC_sEC_NO
   AND A.ACCOUNT_NO = C.CASE_NO
   AND A.SOC_sEC_NO = C.SOC_SEC_NO
   AND A.CASE_NO = B.CASE_NO
   AND A.SOC_sEC_NO = B.SOC_sEC_NO


SELECT *
  FROM DBSYSTC.FUNDDESC

SELECT *
  FROM DBSYSTC.PRODUCT_FUND

SELECT *
FROM DBSYSTC.UNIT_VALUE
WHERE FD_DESC_CD = 'Q16F'


--*****************************************************
-- Split Distributions submitted on DDOL by ppt or CTI
--*****************************************************

Select *
from corp.Withdrawal_Detail
where eff_dt > '20170601'
and src_cd in ('I', 'C')  --I=Internet/DDOL, C=CTI, 3=P3
--and PRNC_ROTH_RLVR_CD = 'N' or PRNC_RLVR_CD = 'N'
and PRNC_ROTH_RLVR_CD = 'N'
--in addition these tr_ref_no(s) will have two rows in PAYEE_ADDRESS for the same tr_ref_no
Union
Select *
from corp.Withdrawal_Detail
where eff_dt > '20170601'
and src_cd in ('I', 'C')  --I=Internet/DDOL, C=CTI, 3=P3
--and PRNC_ROTH_RLVR_CD = 'N' or PRNC_RLVR_CD = 'N'
and PRNC_RLVR_CD = 'N'
--in addition these tr_ref_no(s) will have two rows in PAYEE_ADDRESS for the same tr_ref_no
for fetch only with ur
;
-- Run after split dist. query to find the number of payees

Select *
from corp.payee_address
where TR_REF_NO = '201706039223K6'
;

--*****************************************************
-- Withdrawal Information
--*****************************************************

--Withdrawal Information;
--Withdrawal detail; stat_cd
-- 0 = pending
-- 1 = pending sponsor approval (EM only)
-- 2 = on pending tpa approval (EM only)
-- 3 = cancelled
-- 4 = pending approval (IM only)
-- 6 = reversed
-- 9 = denied

--pending wd's
select case_no, soc_sec_no, stat_cd, RQST_WD_AMT, tr_ref_no, src_cd, BOOK_DT,CYC_DT,EFF_DT,EE_TERM_DT,user_i
from DBSYSTC.withdrawal_detail
where 
--case_no = 'JK6196MS 00001'
tr_ref_no = '2018082392223F'
--where SOC SEC NO = '625-81-1042'
;




-- ******************************************************
-- FOD
-- ******************************************************

select *
from corp.employee ee,
     corp.ee_status es
where ee.case_no like 'JK60455   01%'
  and ee.soc_sec_no = '001-54-0308'
  and ee.case_no = es.case_no
  and ee.soc_sec_no = es.soc_sec_no
for fetch only with UR

select * from TDA.withdrawal_detail 
where account_no = 'JK60455   01'
and 
tr_no = 3030, 3040 or 3050 and pymt_stat_cd = 1


select case_no, tr_no, soc_sec_no, pymt_stat_cd, creation_ts
from CORP.withdrawal_detail 
where case_no = 'JK60455   01' -- this plan is in test JK60455MS
      --and soc_sec_no = '001-54-0308'
      and tr_no in ('3030', -- term withdrawal
                   '3040', -- retired
                   '3050') -- disabled
      and pymt_stat_cd = 1
      and stat_cd = 8 -- completed successfully
FOR FETCH ONLY WITH UR

select src_i, vest_p
from DBSYSTC.trans_vest_ovrd
where tr_ref_no = '20180116922TVM'
--and case_no like 'QK61311KR%'
and soc_sec_no = '226-15-6018' 





--- **************************************************************************************************************** STEPHANIE
;



------ Automation



--sc 01


--# current sc01
Update DBSYSTC.WITHDRAWAL_DETAIL
Set STAT_CD='4'
where CASE_NO='YK51202KR 00001'
AND SOC_SEC_NO='074-11-0844'
AND TR_REF_NO='2018032292227W'
;
select * from DBSYSTC.WITHDRAWAL_DETAIL
where CASE_NO='YK51202KR 00001'
AND SOC_SEC_NO='074-11-0844'
AND TR_REF_NO='2018032292227W'
;

select * from DBSYSTC.WITHDRAWAL_DETAIL
where CASE_NO='YK51202KR 00001'
AND SOC_SEC_NO='074-11-0844'
order by mod_ts desc
;

 
SELECT * 
FROM DBSYSTC.withdrawal_detail
WHERE tr_ref_no = '2018032292227W' 
FOR FETCH ONLY
;


select * from DBSYSTC.TRANSACT_APPROVAL
--where TR_REF_NO= '2018032292227W';
order by mod_ts desc;

---
Update DBSYSTC.WITHDRAWAL_DETAIL 
Set STAT_CD='4' 
where CASE_NO='YK51202KR 00001' -- 'XK25051KR 00001' 
AND SOC_SEC_NO='074-11-0844' --'155-67-2760' 
AND TR_REF_NO= '2018032292227W'--'2018032292227W'
;


--#sc02 
select * from DBSYSTC.WITHDRAWAL_DETAIL 
where CASE_NO='XK25051KR 00001' 
order by mod_ts desc;

Update DBSYSTC.WITHDRAWAL_DETAIL 
Set STAT_CD='4' 
where CASE_NO='XK25051KR 00001'  
AND SOC_SEC_NO='155-67-2760'
AND TR_REF_NO='20180322922H85';  


--  run this query for DENIAL to delete the reason = 0 and = 99
Delete from DBSYSTC.TRANSACT_DENY_DETL 
where CASE_NO='XK25051KR 00001' 
AND SOC_SEC_NO='155-67-2760' 
AND TR_REF_NO='20180322922H85' 
AND DENIAL_REASON_C='99' ;


Select * from DBSYSTC.TRANSACT_DENY_DETL
where CASE_NO='XK25051KR 00001' 
AND SOC_SEC_NO='155-67-2760' 
AND TR_REF_NO='20180322922H85' 
;


----  ///////////////////////////////////    query to pull plan with

---- **********************    to be used on REGRESSION

---DDOL/VRU
--1.	Terminations set to Non-outsourced and DDOL/VRU tab “Term withdrawals” set to “Allow Request”.
SELECT *--pw.WD_ONLINE_C 
FROM dbsystc.PLAN_WITHDRAWAL pw WHERE pw.WD_ONLINE_C = '2' for FETCH ONLY WITH UR; 

SELECT * FROM DBREGRC.PLAN_WITHDRAWAL
WHERE WD_ONLINE_C = '2' for FETCH ONLY WITH UR; 



-- QUERY 1 - REG

SELECT PPG.account_no, PW.*
FROM DBREGRC.plan_prov_grp PPG
JOIN DBREGRC.plan_provision PP ON PP.enrl_prov_grp_i = PPG.enrl_prov_grp_i
JOIN DBREGRC.plan_withdrawal PW ON PP.provision_i = PW.plan_wd_prov_i
WHERE PW.wd_online_c = '2' 
FOR FETCH ONLY WITH UR;

--REGR
SELECT *--PPG.account_no, PW.wd_online_c-- PW.*
FROM DBREGRC.plan_prov_grp PPG
JOIN DBREGRC.plan_provision PP ON PP.enrl_prov_grp_i = PPG.enrl_prov_grp_i
JOIN DBREGRC.plan_withdrawal PW ON PP.provision_i = PW.plan_wd_prov_i
WHERE PW.wd_online_c = '2'
 AND Account_NO in ( 'QK61311MB 00001','JK61963MS 00001', 'QK61311KR 00001') 
FOR FETCH ONLY WITH UR;



-- Vesting
--2.	Vesting set to Plan Admin PSOL.
SELECT gvd.APP_C FROM dbsystc.GEN_VESTING_DATA gvd WHERE gvd.APP_C = 2 FOR FETCH ONLY WITH UR; 

-- QUERY 2

SELECT PPG.account_no, gvd.*
FROM DBREGRC.plan_prov_grp PPG
JOIN DBREGRC.plan_provision PP ON PP.enrl_prov_grp_i = PPG.enrl_prov_grp_i
JOIN DBREGRC.GEN_VESTING_DATA gvd ON PP.provision_i = gvd.vest_i
WHERE gvd.APP_C = 2 
AND Account_NO in ('QK61311MB 00001', 'JK61963MS 00001', 'QK61311KR 00001') 
--and vest_i = '32044042311440400'
FOR FETCH ONLY WITH UR; 


-- 3.	In P3 -> outsourcing tab
SELECT otr.NON_OUT_APP_METH FROM dbsystc.OUTSRC_TERM_RULES OTR WHERE otr.NON_OUT_APP_METH = '2' for FETCH ONLY WITH UR;

-- QUERY 3

SELECT PPG.account_no, otr.*
FROM DBREGRC.plan_prov_grp PPG
JOIN DBREGRC.plan_provision PP ON PP.enrl_prov_grp_i = PPG.enrl_prov_grp_i
JOIN DBREGRC.OUTSRC_TERM_RULES OTR ON pp.provision_i = otr.outsrc_i
WHERE --otr.NON_OUT_APP_METH = '2' 
 Account_NO in ( 'QK61311MB 00001', 'JK61963MS 00001', 'QK61311KR 00001') 
for FETCH ONLY WITH UR;


--
select * from DBREGRC.WITHDRAWAL_DETAIL
where CASE_NO like 'QK61311MB%'  
order by mod_ts desc
;

--////
-- REGRESSION
select *
from DBREGRC.ee_secure_data
where SOC_SEC_NO IN ('015-88-0384' , '155-55-5466')
;


--  /////////

-- PA-1482

select *
from DBSYSTC.ee_secure_data
where SOC_SEC_NO IN ('194-07-0291','015-88-0384', '325-67-1882' )
;


select * from DBSYSTC.WITHDRAWAL_DETAIL
where CASE_NO like '651795LH%'  
order by mod_ts desc
;


-- 1482
-- TC01

--                B295-11-2124   - in-service
--05/16/2018
select * from DBSYSTC.WITHDRAWAL_DETAIL 
where 
--CASE_NO='QK61311PD 00001'--'QK61311KR 00001'  
--AND SOC_SEC_NO= '194-07-0291'--'295-11-2124' 
--AND TR_REF_NO= '2018051692222S' 
fin_act_i in (43857635083565500 )
order by mod_ts desc
;

select * from DBSYSTC.OUTPUT_ACT_PEND
where fin_act_i in (43857635083565500) --mine -8/20 (68190409209165500 )
order by mod_ts desc
for fetch only with ur;

-- INNER JOIN WITHDRAWAL_DETAIL with OUTPUT_ACT_PEND
-- Return all rows found in OUTPUT_ACT_PEND for the given TR_REF_NO and FIN_ACT_I
select wdd.case_no, wdd.soc_sec_no, wdd.tr_ref_no, wdd.tr_no, wdd.stat_cd, oap.fin_act_i as OUTPUT_ACT_PEND_FIN_ACT_I , wdd.RQST_WD_AMT, wdd.src_cd, wdd.ee_term_dt, wdd.eff_dt, oap.OUTPUT_ACT_TYP_C as OUTPUT_ACT_PEND_OUTPUT_ACT_TYP_C, oap.OUTPUT_ACT_I as OUTPUT_ACT_PEND_OUTPUT_ACT_I, oap.eff_dt as OUTPUT_ACT_PEND_EFF_DT, oap.cyc_dt as OUTPUT_ACT_PEND_CYC_DT, oap.MOD_TS as OUTPUT_ACT_PEND_MOD_TS
From DBSYSTC.WITHDRAWAL_DETAIL WDD
inner join DBSYSTC.OUTPUT_ACT_PEND OAP
on WDD.fin_act_i = OAP.fin_act_i
where WDD.tr_ref_no in ('2018082392222C', '2018082392222F', '2018082392222J')-- '2018081792222D', '20180820922229', '2018082092222B')
--and WDD.case_no = 'QK61311PD 00001'
order by oap.mod_ts desc
for fetch only with UR
;


select * from DBSYSTC.OUTPUT_ACT_LOG
where fin_act_i in (74626968767184500)
order by mod_ts desc
for fetch only with ur;

-- INNER JOIN WITHDRAWAL_DETAIL with OUTPUT_ACT_LOG
-- Return all rows found in OUTPUT_ACT_LOG for the given TR_REF_NO and FIN_ACT_I
select wdd.case_no, wdd.soc_sec_no, wdd.tr_ref_no, wdd.tr_no, wdd.stat_cd, wdd.RQST_WD_AMT, wdd.src_cd, wdd.ee_term_dt, wdd.eff_dt, oal.fin_act_i as OUTPUT_ACT_LOG_FIN_ACT_I , oal.OUTPUT_ACT_TYP_C as OUTPUT_ACT_LOG_OUTPUT_ACT_TYP_C, oal.OUTPUT_ACT_I as OUTPUT_ACT_LOG_OUTPUT_ACT_I, oal.eff_dt as OUTPUT_ACT_LOG_EFF_DT, oal.cyc_dt as OUTPUT_ACT_LOG_CYC_DT, oal.MOD_TS as OUTPUT_ACT_LOG_MOD_TS
From DBSYSTC.WITHDRAWAL_DETAIL WDD
inner join DBSYSTC.OUTPUT_ACT_LOG OAL
on WDD.fin_act_i = OAL.fin_act_i
where WDD.tr_ref_no in ('2018082392222C', '2018082392222F', '2018082392222J' ) --'2018082192222K') --, '2018081792222D', '20180820922229', '2018082092222B')
--and WDD.case_no = 'QK61311PD 00001'
order by oal.mod_ts desc
for fetch only with UR
;


-- ///////   Batch web services

select * from
dbsystc.batch_init_parm 
where parm_nm like 'participant%'--in ('withdrawalWebserviceWsdlUrl', 'participantWebserviceWsdlUrl', 'participantWebserviceWsdlUrlFUTURE')
;

select * from
dbsystc.batch_init_parm 
where job_nm = 'PSOL'
;

--////////



--For EM plan, the CD1.ALLIANCE_REL_CD = '18'
SELECT 
CD2.CASE_NO
, CD1.ALLIANCE_REL_CD
, CD1.Prod_Series_Cd
, CD2.CASE_STAT_CD
FROM DBSYSTC.CONTRACT_DATA CD1,DBSYSTC.CASE_DATA CD2
WHERE CD1.ALLIANCE_REL_CD = '18'
AND CD2.CONT_NO = CD1.CONT_NO
AND CD2.CASE_NO NOT IN (SELECT ACCOUNT_NO FROM DBSYSTP.CLONING_TEMPLATE)
AND case_no like '512%'
;
--05/17/2018      B295-11-2124
select * from DBSYSTC.WITHDRAWAL_DETAIL 
where CASE_NO='QK61311KR 00001'  
AND SOC_SEC_NO= '295-11-2124' 
AND TR_REF_NO= '20180517922235' --'2018051792222V' 
--and fin_act_i in (70392848373284500 )
order by mod_ts desc
;
select * from DBSYSTC.OUTPUT_ACT_PEND
where fin_act_i in (5775654014284500) --(70392848373284500)
order by mod_ts desc
for fetch only with ur
;
select * from DBSYSTC.OUTPUT_ACT_LOG
where fin_act_i in (5775654014284500)
order by mod_ts desc
for fetch only with ur;

--TC 05 - next day
--05/18/2018      B295-11-2124
select * from DBSYSTC.WITHDRAWAL_DETAIL 
where CASE_NO='QK61311KR 00001'  
AND SOC_SEC_NO= '295-11-2124' 
AND TR_REF_NO= '20180517922235'
order by mod_ts desc
;
select * from DBSYSTC.OUTPUT_ACT_PEND
where fin_act_i in (5775654014284500) 
order by mod_ts desc
for fetch only with ur
;
select * from DBSYSTC.OUTPUT_ACT_LOG
where fin_act_i in (5775654014284500)
order by mod_ts desc
for fetch only with ur;


-- B625-87-4605 (problem)
-- in-service
select * from DBSYSTC.WITHDRAWAL_DETAIL 
where 
--CASE_NO='QK61543KR 00001'  
-- SOC_SEC_NO= '102-06-8672' and
 TR_REF_NO= '20180607922249 ' 
order by mod_ts desc
;
--OUTPUT_ACT_STAT_C
select * from DBSYSTC.OUTPUT_ACT_PEND
where fin_act_i in (81687117638005500 )--53162495690405500 )
order by mod_ts desc
for fetch only with ur;


select * from DBSYSTC.OUTPUT_ACT_LOG
where fin_act_i in (81687117638005500) --53162495690405500)
order by mod_ts desc
for fetch only with ur;



-- PA-3066

-- RETESTED on Sprint 32 - 8/03/2018

--TC 001

select * from DBSYSTC.WITHDRAWAL_DETAIL 
where CASE_NO='QK61543PD 00001'  
AND SOC_SEC_NO= '625-87-4605' 
AND TR_REF_NO= '' 
order by mod_ts desc
for fetch only with ur
;

select * from DBSYSTC.OUTPUT_ACT_PEND
where fin_act_i in ( )
order by mod_ts desc
for fetch only with ur;


--tc01 - part 1
select * from DBSYSTC.WITHDRAWAL_DETAIL 
where CASE_NO='QK61543PD 00001'  
--AND SOC_SEC_NO= '102-06-8672' 
AND TR_REF_NO= '2018080692222J' 
order by mod_ts desc
for fetch only with ur
;

select * from DBSYSTC.OUTPUT_ACT_PEND
where fin_act_i in (58530643753255500 )
order by mod_ts desc
for fetch only with ur;

-- INNER JOIN WITHDRAWAL_DETAIL with OUTPUT_ACT_PEND
-- Return all rows found in OUTPUT_ACT_PEND for the given TR_REF_NO and FIN_ACT_I
select wdd.case_no, wdd.soc_sec_no, wdd.tr_ref_no, wdd.tr_no, wdd.stat_cd, wdd.RQST_WD_AMT, wdd.src_cd, wdd.ee_term_dt, wdd.eff_dt, oap.fin_act_i as OUTPUT_ACT_PEND_FIN_ACT_I , oap.OUTPUT_ACT_TYP_C as OUTPUT_ACT_PEND_OUTPUT_ACT_TYP_C, oap.OUTPUT_ACT_I as OUTPUT_ACT_PEND_OUTPUT_ACT_I, oap.eff_dt as OUTPUT_ACT_PEND_EFF_DT, oap.cyc_dt as OUTPUT_ACT_PEND_CYC_DT, oap.MOD_TS as OUTPUT_ACT_PEND_MOD_TS
From DBSYSTC.WITHDRAWAL_DETAIL WDD
inner join DBSYSTC.OUTPUT_ACT_PEND OAP
on WDD.fin_act_i = OAP.fin_act_i
where WDD.tr_ref_no in ('20180803923DGK', '2018080692222J')
order by oap.mod_ts desc
for fetch only with UR
;


-- INNER JOIN WITHDRAWAL_DETAIL with OUTPUT_ACT_LOG
-- Return all rows found in OUTPUT_ACT_LOG for the given TR_REF_NO and FIN_ACT_I
select wdd.case_no, wdd.soc_sec_no, wdd.tr_ref_no, wdd.tr_no, wdd.stat_cd, wdd.RQST_WD_AMT, wdd.src_cd, wdd.ee_term_dt, wdd.eff_dt, oal.fin_act_i as OUTPUT_ACT_LOG_FIN_ACT_I , oal.OUTPUT_ACT_TYP_C as OUTPUT_ACT_LOG_OUTPUT_ACT_TYP_C, oal.OUTPUT_ACT_I as OUTPUT_ACT_LOG_OUTPUT_ACT_I, oal.eff_dt as OUTPUT_ACT_LOG_EFF_DT, oal.cyc_dt as OUTPUT_ACT_LOG_CYC_DT, oal.MOD_TS as OUTPUT_ACT_LOG_MOD_TS
From DBSYSTC.WITHDRAWAL_DETAIL WDD
inner join DBSYSTC.OUTPUT_ACT_LOG OAL
on WDD.fin_act_i = OAL.fin_act_i
where WDD.tr_ref_no in ('20180803923DGK', '2018080692222J')
order by oal.mod_ts desc
for fetch only with UR
;

select * from DBSYSTC.OUTPUT_ACT_LOG
where fin_act_i in ()
order by mod_ts desc
for fetch only with ur;


--tc01- part 2
select * from DBSYSTC.WITHDRAWAL_DETAIL 
where CASE_NO='QK61311PD 00001'  
AND SOC_SEC_NO= '295-11-2124' 
AND TR_REF_NO= '20180803923DGK' 
order by mod_ts desc
for fetch only with ur
;

select * from DBSYSTC.OUTPUT_ACT_PEND
where fin_act_i in ( )
order by mod_ts desc
for fetch only with ur;

-- INNER JOIN WITHDRAWAL_DETAIL with OUTPUT_ACT_PEND
-- Return all rows found in OUTPUT_ACT_PEND for the given TR_REF_NO and FIN_ACT_I
select wdd.case_no, wdd.soc_sec_no, wdd.tr_ref_no, wdd.tr_no, wdd.stat_cd, wdd.RQST_WD_AMT, wdd.src_cd, wdd.ee_term_dt, wdd.eff_dt, oap.fin_act_i as OUTPUT_ACT_PEND_FIN_ACT_I , oap.OUTPUT_ACT_TYP_C as OUTPUT_ACT_PEND_OUTPUT_ACT_TYP_C, oap.OUTPUT_ACT_I as OUTPUT_ACT_PEND_OUTPUT_ACT_I, oap.eff_dt as OUTPUT_ACT_PEND_EFF_DT, oap.cyc_dt as OUTPUT_ACT_PEND_CYC_DT, oap.MOD_TS as OUTPUT_ACT_PEND_MOD_TS
From DBSYSTC.WITHDRAWAL_DETAIL WDD
inner join DBSYSTC.OUTPUT_ACT_PEND OAP
on WDD.fin_act_i = OAP.fin_act_i
where WDD.tr_ref_no = '20180803923DGK'
--and WDD.case_no = 'QK61311PD 00001'
order by oap.mod_ts desc
for fetch only with UR
;


-- INNER JOIN WITHDRAWAL_DETAIL with OUTPUT_ACT_LOG
-- Return all rows found in OUTPUT_ACT_LOG for the given TR_REF_NO and FIN_ACT_I
select wdd.case_no, wdd.soc_sec_no, wdd.tr_ref_no, wdd.tr_no, wdd.stat_cd, wdd.RQST_WD_AMT, wdd.src_cd, wdd.ee_term_dt, wdd.eff_dt, oal.fin_act_i as OUTPUT_ACT_LOG_FIN_ACT_I , oal.OUTPUT_ACT_TYP_C as OUTPUT_ACT_LOG_OUTPUT_ACT_TYP_C, oal.OUTPUT_ACT_I as OUTPUT_ACT_LOG_OUTPUT_ACT_I, oal.eff_dt as OUTPUT_ACT_LOG_EFF_DT, oal.cyc_dt as OUTPUT_ACT_LOG_CYC_DT, oal.MOD_TS as OUTPUT_ACT_LOG_MOD_TS
From DBSYSTC.WITHDRAWAL_DETAIL WDD
inner join DBSYSTC.OUTPUT_ACT_LOG OAL
on WDD.fin_act_i = OAL.fin_act_i
where WDD.tr_ref_no = '20180803923DGK'
--and WDD.case_no = 'QK61311PD 00001'
order by oal.mod_ts desc
for fetch only with UR
;


-- TC02 - part 1

select * from DBSYSTC.WITHDRAWAL_DETAIL 
where --CASE_NO='QK61311PD 00001'  
--AND SOC_SEC_NO= '102-06-8672' 
 TR_REF_NO= '2018080992223H' 
order by mod_ts desc
for fetch only with ur
;

select * from DBSYSTC.OUTPUT_ACT_PEND
where fin_act_i in (80787127125255500 )
order by mod_ts desc
for fetch only with ur;

-- INNER JOIN WITHDRAWAL_DETAIL with OUTPUT_ACT_PEND
-- Return all rows found in OUTPUT_ACT_PEND for the given TR_REF_NO and FIN_ACT_I
select wdd.case_no, wdd.soc_sec_no, wdd.tr_ref_no, wdd.tr_no, wdd.stat_cd, wdd.RQST_WD_AMT, wdd.src_cd, wdd.ee_term_dt, wdd.eff_dt, oap.fin_act_i as OUTPUT_ACT_PEND_FIN_ACT_I , oap.OUTPUT_ACT_TYP_C as OUTPUT_ACT_PEND_OUTPUT_ACT_TYP_C, oap.OUTPUT_ACT_I as OUTPUT_ACT_PEND_OUTPUT_ACT_I, oap.eff_dt as OUTPUT_ACT_PEND_EFF_DT, oap.cyc_dt as OUTPUT_ACT_PEND_CYC_DT, oap.MOD_TS as OUTPUT_ACT_PEND_MOD_TS
From DBSYSTC.WITHDRAWAL_DETAIL WDD
inner join DBSYSTC.OUTPUT_ACT_PEND OAP
on WDD.fin_act_i = OAP.fin_act_i
where WDD.tr_ref_no in ('2018081492223V')--'2018080992223H')--'20180806924944', '2018080692493C', '20180806924943')
order by oap.mod_ts desc
for fetch only with UR
;


-- INNER JOIN WITHDRAWAL_DETAIL with OUTPUT_ACT_LOG
-- Return all rows found in OUTPUT_ACT_LOG for the given TR_REF_NO and FIN_ACT_I
select wdd.case_no, wdd.soc_sec_no, wdd.tr_ref_no, oal.fin_act_i as OUTPUT_ACT_LOG_FIN_ACT_I,wdd.tr_no, wdd.stat_cd, wdd.RQST_WD_AMT, wdd.src_cd, wdd.ee_term_dt, wdd.eff_dt, oal.OUTPUT_ACT_TYP_C as OUTPUT_ACT_LOG_OUTPUT_ACT_TYP_C, oal.OUTPUT_ACT_I as OUTPUT_ACT_LOG_OUTPUT_ACT_I, oal.eff_dt as OUTPUT_ACT_LOG_EFF_DT, oal.cyc_dt as OUTPUT_ACT_LOG_CYC_DT, oal.MOD_TS as OUTPUT_ACT_LOG_MOD_TS
From DBSYSTC.WITHDRAWAL_DETAIL WDD
inner join DBSYSTC.OUTPUT_ACT_LOG OAL
on WDD.fin_act_i = OAL.fin_act_i
where WDD.tr_ref_no in ('2018081492223V') -- '2018080992223H', '20180806924943', '2018080692493C', '20180803923DGK', '2018080692222J')--'20180806924944', '2018080692493C', '20180806924943')-- ('2018080692222J','20180803923DGK','20180806924944', '20180806924943', '2018080692493C') --('2018080692493C', '20180806924943', '20180806924944')
order by oal.mod_ts desc
for fetch only with UR
;






-- TESTED ON 7/10/18

select * from DBSYSTC.WITHDRAWAL_DETAIL 
where soc_sec_no in ('395-58-7434', '625-87-4605', '134-69-0823', '395-58-7434')
order by mod_ts desc
for fetch only with ur;

select FIN_ACT_I, TR_REF_NO, STAT_CD, MOD_TS from DBSYSTC.WITHDRAWAL_DETAIL 
where TR_REF_NO in ( '2018071092223S', '2018071092223T', '2018071092223V', '2018071092223W', '2018071092223X')
order by mod_ts asc
for fetch only with ur;

-- PA 2477 - sprint 28 - RETEST

select 
PKG_ID,CASE_NO,SOC_SEC_NO,TOT_WD_AMT,WHLD_FED_TAX_AMT,WHLD_ST_TAX_AMT,BOOK_DT,CYC_DT,EFF_DT,EE_TERM_DT,TR_REF_NO,TR_NO,FIN_ACT_I,STAT_CD,PYMT_STAT_CD,WD_SEQ_STAT_CD,DEFAULT_STATUS_CD,PRNC_RLVR_CD,REASON_CD,IRA_FLEX_TAX_AMT,USER_I,SRC_CD,WD_OPTION_C,HRDSHP_REASON_C,WD_REASON_C,ST_TAX_OVRD_C,WHLD_ST_AMT_TYP_C,WHLD_ST_DLR_A,WHLD_ST_P,EE_ELECT_DEF_WD_A,AUTO_CASHOUT_TYP_C,RFND_TYP_C,RTH_HRDSHP_CTRB_A,RTH_TAXFREE_CTRB_A,RTH_TAXFREE_ROLL_A,RTH_ROLLOVER_TYP_C,WD_TR_TYP_C,CREATION_TS,MOD_TS,NON_CASH_CD,NON_CASH_FEE_CD,OVERNIGHT_CHK_C,SIGNATURE_C,OVERNIGHT_CHK_FEE_A,ORIG_RQST_AMT,EE_MARITAL_STAT_C
from DBSYSTC.WITHDRAWAL_DETAIL 
where CASE_NO='QK61543PD 00001'  
AND SOC_SEC_NO= '102-06-8672' 
AND TR_REF_NO= '20180607922249'
order by mod_ts desc
;

select 
PKG_ID,CASE_NO,SOC_SEC_NO,TOT_WD_AMT,WHLD_FED_TAX_AMT,WHLD_ST_TAX_AMT,BOOK_DT,CYC_DT,EFF_DT,EE_TERM_DT,TR_REF_NO,TR_NO,FIN_ACT_I,STAT_CD,PYMT_STAT_CD,WD_SEQ_STAT_CD,DEFAULT_STATUS_CD,PRNC_RLVR_CD,REASON_CD,IRA_FLEX_TAX_AMT,USER_I,SRC_CD,WD_OPTION_C,HRDSHP_REASON_C,WD_REASON_C,ST_TAX_OVRD_C,WHLD_ST_AMT_TYP_C,WHLD_ST_DLR_A,WHLD_ST_P,EE_ELECT_DEF_WD_A,AUTO_CASHOUT_TYP_C,RFND_TYP_C,RTH_HRDSHP_CTRB_A,RTH_TAXFREE_CTRB_A,RTH_TAXFREE_ROLL_A,RTH_ROLLOVER_TYP_C,WD_TR_TYP_C,CREATION_TS,MOD_TS,NON_CASH_CD,NON_CASH_FEE_CD,OVERNIGHT_CHK_C,SIGNATURE_C,OVERNIGHT_CHK_FEE_A,ORIG_RQST_AMT,EE_MARITAL_STAT_C
from DBSYSTC.WITHDRAWAL_DETAIL 
where --CASE_NO='QK61543PD 00001'  
 SOC_SEC_NO= '073-86-8810' 
AND TR_REF_NO= '20180611922227'
order by mod_ts desc
;

select 
PKG_ID,CASE_NO,SOC_SEC_NO,TOT_WD_AMT,WHLD_FED_TAX_AMT,WHLD_ST_TAX_AMT,BOOK_DT,CYC_DT,EFF_DT,EE_TERM_DT,TR_REF_NO,TR_NO,FIN_ACT_I,STAT_CD,PYMT_STAT_CD,WD_SEQ_STAT_CD,DEFAULT_STATUS_CD,PRNC_RLVR_CD,REASON_CD,IRA_FLEX_TAX_AMT,USER_I,SRC_CD,WD_OPTION_C,HRDSHP_REASON_C,WD_REASON_C,ST_TAX_OVRD_C,WHLD_ST_AMT_TYP_C,WHLD_ST_DLR_A,WHLD_ST_P,EE_ELECT_DEF_WD_A,AUTO_CASHOUT_TYP_C,RFND_TYP_C,RTH_HRDSHP_CTRB_A,RTH_TAXFREE_CTRB_A,RTH_TAXFREE_ROLL_A,RTH_ROLLOVER_TYP_C,WD_TR_TYP_C,CREATION_TS,MOD_TS,NON_CASH_CD,NON_CASH_FEE_CD,OVERNIGHT_CHK_C,SIGNATURE_C,OVERNIGHT_CHK_FEE_A,ORIG_RQST_AMT,EE_MARITAL_STAT_C
from DBSYSTC.WITHDRAWAL_DETAIL 
where --CASE_NO='QK61543PD 00001'  
 --SOC_SEC_NO= '102-06-8672'--'242-06-3015'  and
 TR_REF_NO= '2018061192222L' --'20180611922228'--'20180605922GTL'
order by mod_ts desc
;

-- when submit to mail the spousal consent, it add a row here
select * from DBSYSTC.OUTPUT_ACT_PEND
where fin_act_i in (81687117638005500)
order by mod_ts desc
for fetch only with ur;

select count(fin_act_i) as v_fin_act_i from DBSYSTC.OUTPUT_ACT_PEND
where fin_act_i in (54402164429305500 )
group by fin_act_i
;
-- when the bathc job runs - it moves from PEND to LOG table
select * from DBSYSTC.OUTPUT_ACT_LOG
where fin_act_i in (81687117638005500 )
order by mod_ts desc
for fetch only with ur;





--  P003-87-8219 - tc7

SELECT * FROM DBSYSTT.LOAN_DETAIL
WHERE SOC_SEC_NO= '003-87-8219' 
and LOAN_NO in ('20180518522222') 
;

select * from DBSYSTC.WITHDRAWAL_DETAIL 
where CASE_NO='TT080386KR00001'  
AND SOC_SEC_NO= '003-87-8219' 
--AND TR_REF_NO= '2018051792223X' --'2018051492222V' 
order by mod_ts desc
;

select * from DBSYSTT.OUTPUT_ACT_PEND
where fin_act_i in (2008259083384500) -- (77704229155184500 )
order by mod_ts desc
for fetch only with ur;



select * from DBSYSTC.OUTPUT_ACT_LOG
where fin_act_i in (77244607655284500)
order by mod_ts desc
for fetch only with ur;


-----------------------


--TO GET HARDSHIP & IN-SERVICE PLAN LEVEL DATA
-- WD_TYP_C: 0 = Hardship, 1 = In Service, 2 = custom
-- WD_ONLINE_C = 0 = do not display, 1 =display only, 2 = allow request
--approval_c: 0=n/a, 1 = transamerica, 2 =plan admin paper

SELECT PPG.ACCOUNT_NO, PLAN_WD_PROV_I , WD_SUB_TYPE_DESC_T , WD_TYP_C, APPROVAL_C , WD_ONLINE_C , ONLY_FULL_VEST_C , MAX_WD_PER_CT , MAX_WD_FREQ , MAX_WD_FRQ_CT , MAX_WD_FREQ_PER , MAX_WD_TIMEPER_C , SUSP_PER_CT , SUSP_TIMEPER_C , MIN_WITHDRAWAL_A , HRDSHP_ALL_P_BEN_C , MAIL_SUSP_RENTRY_C , SUSP_LTR_LD_DAYS_C , PRO_RATA_CALC_C , GROUPED_WD_RESTRICT_C 
FROM DBSYSTC.PLAN_PROV_GRP PPG, DBSYSTC.PLAN_PROVISION PP, DBSYSTC.WITHDRAWAL_PROV WP 
WHERE PPG.ACCOUNT_NO like 'order by mod_ts desc%'--if you do not know the case
--where account_no = 'QK63002RT 00001'
and PPG.RELATED_GRP_TYP_C = 361
AND PP.ENRL_PROV_GRP_I = PPG.ENRL_PROV_GRP_I
AND PP.PROVISION_I = WP.PLAN_WD_PROV_I 
and wd_online_c = '2' -- allow request
--AND WP.WD_TYP_C ='0'--HARDSHIP
AND WP.WD_TYP_C ='1' --IN-SERVICE
--AND WP.WD_TYP_C ='2' --custom (mercer) you dont care about this
FOR FETCH ONLY WITH UR
;


--PA-2477


SELECT   *
FROM     DBSYSTC.HELPER
WHERE    HLP_LINE_NO like '008864%' OR HLP_LINE_NO like '008865%' OR HLP_LINE_NO like '008866%';

select distinct EE.CASE_NO , EE.SOC_SEC_NO , EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT , CYE_BAL_EFF_DT, CYE_UNIT_CT
from DBSYSTC.funds_detail FD, DBSYSTC.EMPLOYEE EE, DBSYSTC.plan_prov_grp ppg
where EE.case_no like 'QK62826SD%'--'QK61311PD%'-- 'QK61311PD%' --'QK61543PD%'
and CYE_UNIT_CT < 50000 -- they have money
and fd.case_no = ppg.account_no
and ENRL_STAT_C = 7 -- plan is active
and FD_DESC_CD not in ('PCRA', 'CRF1', 'GDAF', 'G16B')
AND EE.CASE_NO = FD.CASE_NO
AND EE.SOC_SEC_NO = FD.SOC_SEC_NO
and ee.ee_term_dt = '00000000' -- not terminated
--and CYE_BAL_EFF_DT = '20160630'
--and SRC_I count > 1
--and EE_BRTH_DT > '19700101'
for fetch only with UR
;

--Check the ddol/vru rules in P3: 
--    In-Service online Wd is allowed?
--    Full-term online Wd is allowed?
--    Hardship online Wd is allowed?
--      * HS only allowed for EM plan
select * from DBSYSTP.VINET_VRU_DETAIL where soc_sec_no='102-06-8672' 
order by trans_ts desc for fetch only with ur fetch first 30 rows only;


--to set the login for ppt in DDOL, select an existing PPT, then duplicate it informing the new PPT your are creating the login for.
select *
from DBSYSTC.ee_secure_data
where SOC_SEC_NO IN ('545-11-4584', '023-30-5100')--'545-11-4584','471-11-1817','004-97-6047')--, '295-11-2124', '435-50-6529','525-68-2932','525-89-4992', '635-28-1023')
;


---- PA 2961    LOAN

select * from DBSYSTC.LOAN_DETAIL
where LOAN_NO in  ('2018060492223G') 
and soc_sec_no = '923-68-6879' 
;
-- get the ORIG_FIN_ACT_I = 73600111440394500   and search it into Withdrawal_detail table
select * from DBSYSTC.WITHDRAWAL_DETAIL 
where FIN_ACT_I = 16848240422894500 
order by mod_ts desc;
-- make sure the stat_cd is equal to 0,
-- and the dates (except the INT...EXEC_DT ) should be a day before the current date for the LOAN Batch Job RUN

select CASE_NO,SOC_SEC_NO,BOOK_DT,CYC_DT,EFF_DT,TR_REF_NO,TR_NO,STAT_CD,FIN_ACT_I,CREATION_TS,MOD_TS
from DBSYSTC.WITHDRAWAL_DETAIL 
where FIN_ACT_I = 16848240422894500
for fetch only with UR
;

SELECT * FROM DBSYSTC.NOTIFICATION
WHERE TR_REF_NO in ('2018060492223G')-- ('2018052992222W', '20180320522224')
--AND account_no = '341350    00000'
FOR FETCH ONLY WITH UR;
--result as of 29/5:
--NOTIFICATION_I,ENRL_PROV_GRP_I,ACCOUNT_NO,PART_ENRL_I,APPL_C,TR_REF_NO,NOTIFIC_METHOD_EXIST,STATUS_C,CREATE_TS,MOD_TS,USER_I
--18769121440394500,78046076022123421,341350    00000,21819655712864221,1,2018052992222W,1,1,2018-05-29-16.33.32.240413,2018-05-29-16.41.03.329077,UYP3D1 

--AFTER to RUN the batch jobs, the DBSYSTC.WITHDRAWAL_DETAIL.STAT_CD will be updated to 8. and the ppt receives a notification by his phone


--AUTOMATION

--QK61311MB 00001 - 
  --     outsourcing -> PLAN PSD .....
--

SELECT otr.NON_OUT_APP_METH FROM dbsystc.OUTSRC_TERM_RULES OTR WHERE otr.NON_OUT_APP_METH = '2' for FETCH ONLY WITH UR; 

select distinct EE.CASE_NO , EE.SOC_SEC_NO , EE_BRTH_DT, EE_TERM_DT, EE_REHIRE_DT , CYE_BAL_EFF_DT, CYE_UNIT_CT
from DBSYSTC.funds_detail FD, DBSYSTC.EMPLOYEE EE, DBSYSTC.plan_prov_grp ppg
where EE.case_no like 'QK61543PD%'-- 'QK61311PD%' --'QK61543PD%'
--and CYE_UNIT_CT < 50000 -- they have money
and fd.case_no = ppg.account_no
and ENRL_STAT_C = 7 -- plan is active
and FD_DESC_CD not in ('PCRA', 'CRF1', 'GDAF', 'G16B')
AND EE.CASE_NO = FD.CASE_NO
AND EE.SOC_SEC_NO = FD.SOC_SEC_NO
and ee.ee_term_dt = '00000000' -- not terminated
--and CYE_BAL_EFF_DT = '20160630'
--and SRC_I count > 1
--and EE_BRTH_DT > '19700101'
for fetch only with UR

