# Load libraries
library(qqman)
library(tidyverse)

# load GWAS summary statistics
dat <- read.table("path/sumstats.txt",header=TRUE, sep = "", dec = ".")
selectdat <- subset(dat,select=(c("SNP","CHR","BP","PVAL")))

# Make the Manhattan plot
# Parameters
width <- 1600
height <- 800
dpi <- 300

# Adjust width and height for high DPI
adj_width <- width * dpi / 72
adj_height <- height * dpi / 72

# plot
png("manhattan_plot.png", width = adj_width, height = adj_height, res=300)  # Adjust the size as needed
par(cex.axis = 1.8)
manhattan(selectdat, chr="CHR", bp="BP", snp="SNP", p="PVAL", col=c("#b8396b","#76bae0"),xlab = "", ylab = "")
mtext("Chromosome", side = 1, line = 3, cex = 1.8)  # Increase x-axis label size
mtext(expression(-log[10](p-value)), side = 2, line = 2.5, cex = 1.8)  # Increase y-axis label size
dev.off()  # Close the device


## QQ plot
# Parameters
width <- 400
height <- 400
dpi <- 300

# Adjust width and height for high DPI
adj_width <- width * dpi / 72
adj_height <- height * dpi / 72

# plot
png("qqplot.png", width = adj_width, height = adj_height, res=300)  # Adjust the size as needed
qqman::qq(selectdat$PVAL)
dev.off()  # Close the device



