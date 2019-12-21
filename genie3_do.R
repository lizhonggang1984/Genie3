setwd ("E:\\LIVER_DATA_FOR_NETWORKS\\Genie3\\DO_mRNA")
library(GENIE3)


hf_male <- read.table ("expr_matrix_hf_m.txt")


exprMatr<- data.matrix(hf_male, rownames.force = NA)


regulators <- c("Foxo1","Agpat5")

set.seed(123) # For reproducibility of results
weightMat <- GENIE3(exprMatr,regulator = regulators)

dim(weightMat)


linkList <- getLinkList(weightMat)
dim(linkList)

head(linkList)

linkList <- getLinkList(weightMat, threshold=0.1)

linkList 
write.table (linkList, "linklist.txt",row.names = FALSE)

save.image ("genie3_for_do_hf_male_3.RData")
