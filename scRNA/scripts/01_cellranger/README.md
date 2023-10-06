# scRNAseq: preprocessing with cellranger
- **01_get_fastq_headers.sh** - gets the fastq header from every fastq file, used to check for any batch effects
- **02_count.sh** - takes the variable passed to the script and runs cellranger count, contains header for SoGE job scheduler
- **03_sample_loop.sh** - loops through a list of samples, within each loop 02_count.sh is being submitted to the SoGE job scheduler and a sample name is passed
