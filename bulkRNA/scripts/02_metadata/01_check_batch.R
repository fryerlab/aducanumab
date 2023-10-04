# Kennedi Todd
# September 24, 2019
# Check for batch effects

# read file
seq.info <- read.table("../../refs/fastq_headers.tsv", sep = "\t")
colnames(seq.info) <- c("filename","fastq_header")

# parse fastq header
# @A00220:617:HH2LFDSX7:1:1101:3206:1000 1:N:0:CCATCATTAG+AGAGGCAACC
# @<instrument>:<run number>:<flowcell ID>:<lane>:<tile>:<x-pos>:<y-pos> <read>:<is filtered>:<control number>:<index>
seq.info$fastq_header <- gsub(" ", ":", seq.info$fastq_header)
seq.info <- tidyr::separate_wider_delim(data = seq.info,
                                        cols = fastq_header,
                                        delim = ":",
                                        names = c("instrument", "run_number", "flow_cell", 
                                                  "lane", "title", "x_pos", "y_pos", "read",
                                                  "is_filtered", "control_number", "index"))

# parse sample name
seq.info$sample_name <- 
  stringr::str_match(seq.info$filename, "([0-9]+_[IgGAdu_R]+_S[0-9]+)_L00[0-4]_[IR][12]_001.fastq.gz")[,2]
table(seq.info$sample_name) # 16 files for each sample

# check if instrument, run, and flow cell are the same for all samples
# if they are same delete the column
if (length(table(seq.info$flow_cell)) == 1) {
  seq.info$flow_cell <- NULL
}
if (length(table(seq.info$run_number)) == 1) {
  seq.info$run_number <- NULL
}
if (length(table(seq.info$instrument)) == 1) {
  seq.info$instrument <- NULL
}

# check that each sample has 4 files for their sample_name+lane (4 files per sample per lane)
seq.info$sample_lane <- paste0(seq.info$sample_name, "_L00", seq.info$lane)
check <- table(seq.info$sample_lane)
any(!check == 4) # all samples were run over 4 lanes ()

# check the number of unique indices
length(unique(seq.info$index)) # 70 unique indices

# check that samples with the same index have the same sample_name
indices <- unique(seq.info$index)
for (myIndex in indices) {
  df <- subset(seq.info, index == myIndex)
  
  numSamples <- length(unique(df$sample_name))
  if (numSamples > 1) {
    print(myIndex)
    print(unique(df$sample_name))
  }
}
