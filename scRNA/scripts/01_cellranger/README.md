# scRNAseq: preprocessing with cellranger
- **01_get_fastq_headers.sh** - gets the fastq header from every fastq file, used to check for any batch effects
- **02_count.sh** - takes the variable passed to the script and runs cellranger count, contains header for SoGE job scheduler
  - refdata-gex-mm10-2020-A (Mouse reference mm10 - 2020-A) is available for download from 10x Genomic's website
  - https://www.10xgenomics.com/support/software/cell-ranger/downloads
- **03_sample_loop.sh** - loops through a list of samples, within each loop 02_count.sh is being submitted to the SoGE job scheduler and a sample name is passed
- **04_get_web_summaries.sh** - loops through cellranger output directories and extracts the web summaries so they are in one folder


