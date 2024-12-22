# load packages
library(dplyr)
library(TwoSampleMR)

# load data "example_sumstats.csv"
# this data file has the rsid, beta, se, effect_allele, other_allele, p, eaf, and N
# of the exposure and outcome for the instrumental variables
# if instrumental variables need to be identified:
# IVs <- subset(exposure_sumstats, pval < 0.00000005) # find SNPs with p < 5 x 10^-8
# IVs <- ld_clump(IVs) # clump the SNPs

# Read outcome data
outcome <- read_outcome_data(filename = "example_sumstats.csv", sep = ",", snp_col = "rsid",
                             beta_col = "beta_out", se_col = "se_out",
                             effect_allele = "effect_out", other_allele = "other_out",
                             pval_col="p_out", samplesize_col = "N_out")


# Read exposure data
exposure <- read_exposure_data(filename = "example_sumstats.csv", sep = ",", snp_col = "rsid",
                             beta_col = "beta_exp", se_col = "se_exp",
                             effect_allele = "effect_exp", other_allele = "other_exp",
                             pval_col="p_exp", samplesize_col = "N_exp")


# Harmonize the data by aligning exposure and outcome data
data <- harmonise_data(exposure_dat = exposure, outcome_dat = outcome)


# Calculate the number of rows in the harmonized dataset
nrow(data)
# Perform Mendelian Randomization (MR) analysis
result <- mr(data)
# Print the MR analysis result
print(result)


# Cochran's Q for heterogeneity
mr_heterogeneity(data) 


# full report of results
library(Cairo)
mr_report(data)


# plot
library(ggplot2)
plot <- mr_scatter_plot(result,data)[[1]] +
  theme_classic() +
  xlab("SNP effect on exposure") +
  ylab("SNP effect on outcome")
plot


