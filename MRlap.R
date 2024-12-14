library(dplyr)
library(readr)
library(MRlap)
library(data.table)

# load data
gwas_childbirths <- read.delim("path/gwas_child.tsv")
bag <- read.table("path/BAG.txt", header = TRUE, sep = "", dec = ".")
IVs <- read.table("path/IVs_BAG_childbirths", header = TRUE, sep = "", dec = ".")
# headers should be: chr, rsid, pos, ref, alt, se, p, N


result <- MRlap(exposure=gwas_childbirths,exposure_name="gwas_childbirths",outcome=bag,
                outcome_name="BAG",
                ld = "/Users/hannah/Documents/MRlap/eur_w_ld_chr",
                hm3 = "/Users/hannah/Documents/MRlap/w_hm3.noMHC.snplist",
                do_pruning = F,
                user_SNPsToKeep = IVs$SNPs)


print(result)






