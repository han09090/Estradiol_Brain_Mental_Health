# load packages
library(dplyr)
library(TwoSampleMR)
library(ggplot2)
library(remotes)
install_github("WSpiller/MVMR", build_opts = c("--no-resave-data", "--no-manual"), build_vignettes = TRUE)


# IVs of exposures (e.g. age at menarche and BMI) extracted from IEU OpenGWAS
id_exposures <- c("ebi-a-GCST90029036","ieu-a-974")
exposure_dat <- mv_extract_exposures(id_exposures)

# Find IVs in outcome dataset (e.g. depression)
outcome_dat <- subset(depr, SNP %in% c(exposure_dat$SNP))

# datasets with only IVs found in exposure and outcome datasets
exposure_dat <- subset(exposure_dat, SNP %in% c(outcome_dat$SNP))
outcome_dat <- subset(outcome_dat,select=c("SNP","effect_allele.outcome",
                                           "other_allele.outcome","eaf.outcome",
                                           "beta.outcome","se.outcome","pval.outcome",
                                           "outcome","id.outcome"))

# harmonize data
mvdat <- mv_harmonise_data(exposure_dat, outcome_dat)

# MVMR Analysis
result <- mv_multiple(mvdat,plots=F)
print(result)


# Compare with other approach (MV MR Egger)
library(MendelianRandomization)
bx <- as.matrix(mvdat$exposure_beta)
bxse <- as.matrix(mvdat$exposure_se)
by <- mvdat$outcome_beta
byse <- mvdat$outcome_se
exposure <- c("Menarche","BMI")
outcome <- "MDD"
mvobj <- mr_mvinput(bx=bx,bxse=bxse,by=by,byse=byse,exposure=exposure,outcome=outcome)
res2 <- mr_mvegger(mvobj)
print(res2) 



