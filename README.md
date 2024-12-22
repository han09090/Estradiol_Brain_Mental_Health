Code used for

**No Causal Links Between Estradiol and Female’s Brain and Mental Health: A Mendelian Randomization Study**
Hannah Oppenheimer, Dennis van der Meer, Louise S. Schindler, Arielle Crestol, Lars T. Westlye, Ann-Marie G. de Lange, & Claudia Barth

GWAS.txt - code used in PLINK to run genome-wide association studies (GWAS) on estradiol levels and brain age gap

MR_Analysis.R - code used in R to run univariable Mendelian randomization analyses using instrumental variables (including plots)

MRlap.R - code used in R to run MRlap for analyses with sample overlap

MVMR_Analysis.R - code used for multivariable Mendelian randomization anlyses

Manhattan_plot.R - code used to create Manhattan plots for GWAS

example_sumstats.csv - example dataset to run MR_Analysis.R

Variables were adjusted according to the analyses described in the paper (preprint: https://osf.io/preprints/osf/ryq3g).

**System requirements:**

The following versions were used:

PLINK 2.0

R v4.3.1

R packages:

TwoSampleMR v0.5.11

MendelianRandomization v0.9.0

MVMR v0.1

MRlap v0.0.3.2

qqman v0.1.9

**Installation Guide:**

R packages can be downloaded from CRAN or GitHub (fast installation, < 1 min per package)

**Demo:**

Run MR_Analysis.R using example_sumstats.csv as an input file for exposure and outcome variables (expected run time < 2 mins).
Expected output for the MR analysis: 

<img width="850" alt="Screenshot 2024-12-22 at 13 39 31" src="https://github.com/user-attachments/assets/8b5c2297-442a-4fc3-bd5d-aae9aa4a5a35" />

**Instructions for use:**

All GWAS summary statistics used for the present study is publicly availble for download or can be requested from the respective authors.
The summary statistics from the GWAS on brain age gap (female-specific and male-specific) and the female-specific GWAS on estradiol levels (continuous approach and binary approach) will be published on the NHGRI-EBI GWAS Catalog (study accessions: brain age gap in females: GCST90483374; brain age gap in males: GCST90483373; estradiol levels using the continuous approach: GCST90483375; estradiol levels using binary approach: GCST90483376). Data used for the GWAS are available from the UK Biobank.

MR_Analysis.R was used for univariable analyses 

MVMR_Analysis.R was used for multivariable analyses

MRlap.R was used for univariable analyses with sample overlap

GWAS.txt and Manhattan_plot.R was used for running and plotting GWAS

All results in the present study can be reproduced using the data and analyses as described in the manuscript.
