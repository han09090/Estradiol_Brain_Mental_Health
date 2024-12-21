# load packages
library(dplyr)
library(readr)
library(MRlap)

# load data
childbirths <- read.table("path/childbirths.txt", header = TRUE, sep = "", dec = ".")
bag <- read.table("path/BAG.txt", header = TRUE, sep = "", dec = ".")
IVs <- read.table("path/IVs_BAG_childbirths", header = TRUE, sep = "", dec = ".")
# headers should be: chr, rsid, pos, ref, alt, se, p, N

# run MRlap using instrumental variables
result <- MRlap(exposure=childbirths,exposure_name="childbirths",outcome=bag,
                outcome_name="BAG",
                ld = "path/eur_w_ld_chr",
                hm3 = "path/w_hm3.noMHC.snplist",
                do_pruning = F,
                user_SNPsToKeep = IVs$SNPs)

print(result)






