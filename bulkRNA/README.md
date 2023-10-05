# Bulk RNA-Seq Analysis
## Experiment overview
Mouse hemibrain was collected from the following groups.
- 4 biological replicates of 3 weeks (2 doses) IgG
- 4 biological replicates of 3 weeks (2 doses) Aducanumab
- 4 biological replicates of 5 weeks (4 doses) IgG
- 4 biological replicates of 5 weeks (4 doses) Aducanumab
- 4 biological replicates of 19 weeks (washout) IgG
- 4 biological replicates of 19 weeks (washout) Aducanumab
- 4 biological replicates of 34 weeks (washout) IgG
- 3 biological replicates of 34 weeks (washout) Aducanumab
## Sample preparation
63 samples were sent for bulk RNA sequencing at the Mayo Clinic Genome Analysis Core. Samples were preped with ??? kit. Samples were sequenced to ???? 100 bp paired-end reads on the  ???.
## Read processing
- A Snakemake pipeline was used to preprocess reads.
- Below are the rules in the Snakemake file in addition to a brief description.
  - index_genome
  - trim
  - align
  - featureCounts
- For the exact commands used during preprocessing take a look at the Snakemake file. 
- The scripts folder cotains everything used to setup and exectue the snakemake pipline. Head to the scripts folder to see more details on each script.
