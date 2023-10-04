# Kennedi Todd
# September 27, 2023
# Heatmap for IgG.34 vs IgG.3 & Adu.5 vs IgG.5
# DAM gene list from Marco Colonna's paper

# working env
setwd(".")

# gene lists
# homeostatic
homeostatic <- c("Tmem119","P2ry12","P2ry13","Csf1r","Hexb","Cst3","Cx3cr1",
                 "Siglech","Cd33","Tgfbr1","Sall1","Selplg","Mef2a","Jun","Ms4a6d",
                 "Bin1","Serinc3")
all.genes <- data.frame(gene_name = homeostatic,
                        gene_set = "homeostatic")
# DAM-like
dam.like <- c("Cd9","Apoe","Trem2","Tyrobp","Clec7a","Cd63","Lgals3","Axl","Spp1",
              "Cstb","Cstz","Ctsd","Lpl","Itgax","B2m","Cst7","Csf1","Gpnmb","Igf1",
              "Lilrb4a","Irf8","Fth1","Lyz2","Ccl3","Ccl6","Timp2")
all.genes <- rbind(all.genes, data.frame(gene_name = dam.like,
                                         gene_set = "DAM-like"))
# IFN
ifn <- c("Irf7","Ifitm3","Ifit2","Ifit3","Cxcl10","Oasl2","Cd69","Isg15","Usp18")
all.genes <- rbind(all.genes, data.frame(gene_name = ifn,
                                         gene_set = "IFN"))
# MHC
mhc <- c("H2-D1","H2-K1","H2-Eb1","H2-Aa","H2-Ab1","H2-DMa","Cd74")
all.genes <- rbind(all.genes, data.frame(gene_name = mhc,
                                         gene_set = "MHC"))
# Cyc-M
cyc.m <- c("Top2a","Mki67","Cenpe","Mcm5","Birc5","H2afz","H2afv")
all.genes <- rbind(all.genes, data.frame(gene_name = cyc.m,
                                         gene_set = "Cyc-M"))

# HEATMAP FOR BOTH SEXES -------------------------------------------------------

# get file list
files <- list.files(paste0("../../results/DEGs_both_sexes"))
keep <- grep("_1.00.tsv", files)
files <- files[keep]
files <- paste0("../../results/DEGs_both_sexes/",files)
title <- gsub("../../results/DEGs_both_sexes/DEGs_","",files)
title <- gsub("_FDRq_1.00.tsv", "", title)

# loop through files
master.df <- data.frame(matrix(0, 62, 9))
colnames(master.df) <- title
for (i in 1:length(files)) {
  
  # read DEG table
  df <- read.table(files[i], sep = "\t", header = TRUE)
  
  # subset genes of interest
  df <- df[df$gene_name %in% all.genes$gene_name,]
  genes <- all.genes[all.genes$gene_name %in% df$gene_name,]
  
  # subset columns of interest
  df <- df[,colnames(df) %in% c("gene_name","logFC")]
  
  # check the gene_name order
  df <- df[match(genes$gene_name, df$gene_name),]
  print(all.equal(genes$gene_name, df$gene_name))
  
  # add logFC column from comparison to master df
  master.df[[title[i]]] <- df$logFC
  rownames(master.df) <- df$gene_name
}

# reformat
mat <- t(as.matrix(master.df))
master.df$gene_name <- rownames(master.df)
master.df <- dplyr::left_join(genes, master.df, by = "gene_name")
meta <- data.frame(gene_set = master.df[,"gene_set"])
rownames(meta) <- master.df$gene_name

# set colors
paletteLength <- 100
myColor <- colorRampPalette(c("cornflowerblue", "white", "red"))(paletteLength)
myBreaks <- c(seq(min(mat), 0, length.out = ceiling(paletteLength/2) + 1), 
              seq(max(mat)/paletteLength, max(mat), length.out = floor(paletteLength/2)))
ann_colors = list(gene_set = c(`Cyc-M`="chartreuse2",
                               `DAM-like`="magenta",
                               homeostatic="yellow",
                               IFN="gray",
                               MHC="cyan"))

pheatmap::pheatmap(mat,
                   cluster_rows = FALSE,
                   cluster_cols = FALSE,
                   annotation_col = meta,
                   annotation_colors = ann_colors,
                   color = myColor,
                   breaks = myBreaks)

# HEATMAP FOR FEMALES ----------------------------------------------------------
# get file list
files <- list.files(paste0("../../results/DEGs_sex_specific"))
keep <- grep("_1.00.tsv", files)
files <- files[keep]
keep <- grep("F_", files)
files <- files[keep]
files <- paste0("../../results/DEGs_sex_specific/",files)
title <- gsub("../../results/DEGs_sex_specific/DEGs_","",files)
title <- gsub("_FDRq_1.00.tsv", "", title)

# loop through files
master.df <- data.frame(matrix(0, 62, 7))
colnames(master.df) <- title
for (i in 1:length(files)) {
  
  # read DEG table
  df <- read.table(files[i], sep = "\t", header = TRUE)
  
  # subset genes of interest
  df <- df[df$gene_name %in% all.genes$gene_name,]
  genes <- all.genes[all.genes$gene_name %in% df$gene_name,]
  
  # subset columns of interest
  df <- df[,colnames(df) %in% c("gene_name","logFC")]
  
  # check the gene_name order
  df <- df[match(genes$gene_name, df$gene_name),]
  print(all.equal(genes$gene_name, df$gene_name))
  
  # add logFC column from comparison to master df
  master.df[[title[i]]] <- df$logFC
  rownames(master.df) <- df$gene_name
}

# reformat
master.df <- master.df[,c(2,5,1,4,3,7,6)]
mat <- t(as.matrix(master.df))
master.df$gene_name <- rownames(master.df)
master.df <- dplyr::left_join(genes, master.df, by = "gene_name")
meta <- data.frame(gene_set = master.df[,"gene_set"])
rownames(meta) <- master.df$gene_name

# set colors
paletteLength <- 100
myColor <- colorRampPalette(c("cornflowerblue", "white", "red"))(paletteLength)
myBreaks <- c(seq(min(mat), 0, length.out = ceiling(paletteLength/2) + 1), 
              seq(max(mat)/paletteLength, max(mat), length.out = floor(paletteLength/2)))
ann_colors = list(gene_set = c(`Cyc-M`="chartreuse2",
                               `DAM-like`="magenta",
                               homeostatic="yellow",
                               IFN="gray",
                               MHC="cyan"))

pheatmap::pheatmap(mat,
                   cluster_rows = FALSE,
                   cluster_cols = FALSE,
                   annotation_col = meta,
                   annotation_colors = ann_colors,
                   color = myColor,
                   breaks = myBreaks)


# HEATMAP FOR MALES ----------------------------------------------------------
# get file list
files <- list.files(paste0("../../results/DEGs_sex_specific"))
keep <- grep("_1.00.tsv", files)
files <- files[keep]
keep <- grep("M_", files)
files <- files[keep]
files <- paste0("../../results/DEGs_sex_specific/",files)
title <- gsub("../../results/DEGs_sex_specific/DEGs_","",files)
title <- gsub("_FDRq_1.00.tsv", "", title)

# loop through files
master.df <- data.frame(matrix(0, 62, 7))
colnames(master.df) <- title
for (i in 1:length(files)) {
  
  # read DEG table
  df <- read.table(files[i], sep = "\t", header = TRUE)
  
  # subset genes of interest
  df <- df[df$gene_name %in% all.genes$gene_name,]
  genes <- all.genes[all.genes$gene_name %in% df$gene_name,]
  
  # subset columns of interest
  df <- df[,colnames(df) %in% c("gene_name","logFC")]
  
  # check the gene_name order
  df <- df[match(genes$gene_name, df$gene_name),]
  print(all.equal(genes$gene_name, df$gene_name))
  
  # add logFC column from comparison to master df
  master.df[[title[i]]] <- df$logFC
  rownames(master.df) <- df$gene_name
}

# reformat
master.df <- master.df[,c(2,5,1,4,3,7,6)]
mat <- t(as.matrix(master.df))
master.df$gene_name <- rownames(master.df)
master.df <- dplyr::left_join(genes, master.df, by = "gene_name")
meta <- data.frame(gene_set = master.df[,"gene_set"])
rownames(meta) <- master.df$gene_name

# set colors
paletteLength <- 100
myColor <- colorRampPalette(c("cornflowerblue", "white", "red"))(paletteLength)
myBreaks <- c(seq(min(mat), 0, length.out = ceiling(paletteLength/2) + 1), 
              seq(max(mat)/paletteLength, max(mat), length.out = floor(paletteLength/2)))
ann_colors = list(gene_set = c(`Cyc-M`="chartreuse2",
                               `DAM-like`="magenta",
                               homeostatic="yellow",
                               IFN="gray",
                               MHC="cyan"))

pheatmap::pheatmap(mat,
                   cluster_rows = FALSE,
                   cluster_cols = FALSE,
                   annotation_col = meta,
                   annotation_colors = ann_colors,
                   color = myColor,
                   breaks = myBreaks)


# subset heatmap ----------------------------------------------------------
# get file list
files <- list.files(paste0("../../results/DEGs_both_sexes"))
keep <- grep("_1.00.tsv", files)
files <- files[keep]
files <- files[c(8,3)]
files <- paste0("../../results/DEGs_both_sexes/",files)
title <- gsub("../../results/DEGs_both_sexes/DEGs_","",files)
title <- gsub("_FDRq_1.00.tsv", "", title)

# loop through files
master.df <- data.frame(matrix(0, 62, 2))
colnames(master.df) <- title
for (i in 1:length(files)) {
  
  # read DEG table
  df <- read.table(files[i], sep = "\t", header = TRUE)
  
  # subset genes of interest
  df <- df[df$gene_name %in% all.genes$gene_name,]
  genes <- all.genes[all.genes$gene_name %in% df$gene_name,]
  
  # subset columns of interest
  df <- df[,colnames(df) %in% c("gene_name","logFC")]
  
  # check the gene_name order
  df <- df[match(genes$gene_name, df$gene_name),]
  print(all.equal(genes$gene_name, df$gene_name))
  
  # add logFC column from comparison to master df
  master.df[[title[i]]] <- df$logFC
  rownames(master.df) <- df$gene_name
}

# reformat
mat <- t(as.matrix(master.df))
master.df$gene_name <- rownames(master.df)
master.df <- dplyr::left_join(genes, master.df, by = "gene_name")
meta <- data.frame(gene_set = master.df[,"gene_set"])
rownames(meta) <- master.df$gene_name

# set colors
paletteLength <- 100
myColor <- colorRampPalette(c("cornflowerblue", "white", "red"))(paletteLength)
myBreaks <- c(seq(min(mat), 0, length.out = ceiling(paletteLength/2) + 1), 
              seq(max(mat)/paletteLength, max(mat), length.out = floor(paletteLength/2)))
ann_colors = list(gene_set = c(`Cyc-M`="chartreuse2",
                               `DAM-like`="magenta",
                               homeostatic="yellow",
                               IFN="gray",
                               MHC="cyan"))

pheatmap::pheatmap(mat,
                   cluster_rows = FALSE,
                   cluster_cols = FALSE,
                   annotation_col = meta,
                   annotation_colors = ann_colors,
                   color = myColor,
                   breaks = myBreaks)


