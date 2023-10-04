#!/bin/bash

# Get fastq file list
# There are 8 fastq files per sample
# Each sample has R1 and R2 on all 4 lanes
cd /research/labs/neurology/fryer/projects/aducanumab/mouse/bulkRNA
out=/research/labs/neurology/fryer/m214960/aducanumab/bulkRNA/refs/fastq_file_list.txt
ls -1 | grep .fastq.gz > $out

# Get sample file list
cd /research/labs/neurology/fryer/projects/aducanumab/mouse/bulkRNA
out=/research/labs/neurology/fryer/m214960/aducanumab/bulkRNA/refs/sample_file_list.txt
ls -1 | grep _L001_R1_001.fastq.gz > $out