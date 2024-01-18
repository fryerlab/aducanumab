# BulkRNA References
- **adapters.fa** - fasta file containing adapter sequences, used for trimming reads
- **aducanumab.yaml** - yaml file to recreate conda environment
- **bulkRNA_SRA_metadata.tsv** - SRA run accessions with sample metadata
- **config.json** - Snakemake config file, created by running python script in scRNA/scripts/create_config.py
- **core_metadata.tsv** - metadata from Mayo Clinic Genome Anlaysis Core
- **fastq_file_list.txt** - list of all fastq files
- **fastq_file_headers.tsv** - headers of all fastq files, used to check for batch effect
- **sample_list.txt** - list of all samples (there are multiple fastq files per sample)
