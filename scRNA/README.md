# Bulk RNA-Seq Analysis
## 1. Experiment overview
Mouse hemibrain was collected from ? samples. There were 16 groups total based on treatment given, weeks on treatment, and sex.
- 4 biological replicates of 3 weeks (2 doses) IgG Female
- 4 biological replicates of 3 weeks (2 doses) IgG Male
- 4 biological replicates of 3 weeks (2 doses) Aducanumab Female
- 4 biological replicates of 3 weeks (2 doses) Aducanumab Male
- 4 biological replicates of 5 weeks (4 doses) IgG Female
- 4 biological replicates of 5 weeks (4 doses) IgG Male
- 4 biological replicates of 5 weeks (4 doses) Aducanumab Female
- 4 biological replicates of 5 weeks (4 doses) Aducanumab Male
- 4 biological replicates of 19 weeks (washout) IgG Female
- 4 biological replicates of 19 weeks (washout) IgG Male
- 4 biological replicates of 19 weeks (washout) Aducanumab Female
- 4 biological replicates of 19 weeks (washout) Aducanumab Male
- 4 biological replicates of 34 weeks (washout) IgG Female
- 4 biological replicates of 34 weeks (washout) IgG Male
- 4 biological replicates of 34 weeks (washout) Aducanumab Female
- 4 biological replicates of 34 weeks (washout) Aducanumab Male
## 2. Sample preparation
64 mouse hemibrains were selected. **Kit used for total RNA prep?**. Total RNA was send to the Mayo Clinic Genome Analysis Core. RNA quality was assessed with Qubit and the Agilent Frament Analyzer. Total RNA was cleaned-up with DNase I. 100 ng total RNA was used as input for the Illumina Stranded Total RNA Prep to create libraries. Final libraries were sequenced on the NovaSeq 6000 at 100 x 2 paired-end reads for an average of 170 M read pairs. Raw data is available **here**.
## 3. Read processing
- cellranger was used to preprocess reads
## 4. R Analysis
- The **scripts/02_R_analysis** folder contains all R scripts used to filter, normalize, and perform differential expression of the counts data.
