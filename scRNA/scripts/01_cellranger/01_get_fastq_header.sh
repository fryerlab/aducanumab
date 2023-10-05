#!/bin/bash

# change directory
cd ../../refs

# loops through list and print first line
for sample in `cat fastq_file_list.txt`; do
printf "${sample}\t"
zcat ${sample} | head -1
done;