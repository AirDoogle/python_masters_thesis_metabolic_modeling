# Data:
#Input: GSE88794_RAW.tar 
#Output: processed_expression_data.txt, intermediate_data.txt, gene_symbol_expression_data.txt

# Code
# # Extract the TAR file
untar("GSE88794_RAW.tar")

# Load the libraries
library(oligo)
library(affycoretools)
library(hugene11sttranscriptcluster.db)

# Set working directory
setwd("practical_work/processed_gse88794")



# Read in the .CEL files
celFiles <- list.celfiles(listGzipped = TRUE)
affyRaw <- read.celfiles(celFiles)

# Run RMA normalization
eset <- rma(affyRaw)

# Optional: Save the raw expression values
write.exprs(eset, file = 'intermediate_data.txt')

# Annotate the expression set
anno_eset <- annotateEset(eset, pd.hugene.1.1.st.v1, columns = c("PROBEID", "SYMBOL"), multivals = "first")

# Append the new identifiers and save the processed data
eset_frame <- data.frame(fData(anno_eset), exprs(anno_eset))
filter_eset <- subset(eset_frame, !is.na(eset_frame$ID))
write.table(filter_eset, file = "processed_expression_data.txt", sep = "\t", row.names = FALSE)

head(filter_eset)

filter_eset <- filter_eset[, -c(2)]

write.table(filter_eset, file = "gene_symbol_expression_data.txt", sep = "\t", row.names = FALSE, quote = FALSE)
