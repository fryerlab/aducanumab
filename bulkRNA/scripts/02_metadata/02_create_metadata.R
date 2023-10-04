# Kennedi Todd
# September 24, 2023
# Merge sample info to create master metadata file

library(stringr)
setwd(".")

mika.meta <- read.table("../../refs/mika_metadata.tsv", sep = "\t", header = TRUE)
colnames(mika.meta) <- c("mouse_id","week","treatment","sex","RIN")

samples <- read.table("../../refs/sample_file_list.txt", sep = "\t", header = FALSE)
colnames(samples) <- "filename"
samples$mouse_id <- str_match(samples$filename, "([0-9]+)_[AduIgG_R]+_S[0-9]+")[,2]
samples$mouse_id <- as.numeric(samples$mouse_id)

df <- dplyr::left_join(samples, mika.meta, by = "mouse_id")
remove(mika.meta, samples)

df$sex <- gsub("Female", "F", df$sex)
df$sex <- gsub("Male", "M", df$sex)

df$sample <- paste(df$treatment, df$week, df$sex, df$mouse_id, sep = ".")

write.table(df, "../../refs/metadata.tsv", quote = FALSE, sep = "\t")

# display groups
table(paste(df$treatment, df$week, df$sex, sep = "."))
