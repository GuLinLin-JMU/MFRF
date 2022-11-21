#' Usage
#' Rscript zzz.R phenotype.txt pca.txt /MFRF_work_path/
args <- commandArgs(T)
trait <- args[1]
pca <- args[2]
output <- args[3]
trait <- read.table(file = trait, header = TRUE)
pca <- read.table(file = pca, header = FALSE)
trait_new <- matrix(data = NA, nrow = nrow(trait), ncol = ncol(trait))
for(i in 1:ncol(trait))
{
data = data.frame(trait = trait[,i], pca)
n_cov <- ncol(data)
xnam <- paste(colnames(data)[2:n_cov], sep = "", collapse = "+")
fmla <- as.formula(paste("trait ~ ", paste(xnam, collapse = "+")))
trait_res = residuals(lm(formula = fmla, data = data, na.action=na.exclude))
trait_inv = qnorm((rank(trait_res, na.last="keep")-0.5) / length(na.omit(trait_res)))
trait_new[,i] <- trait_inv
}
write.table(trait_new, file = paste0(output, "trait_new.txt"), sep = "\t", quote = F, row.names = F, col.names = colnames(trait))

