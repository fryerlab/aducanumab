# Bulk RNA-Seq Analysis
## 1. Experiment overview
Mouse **?hemibrain?** was collected from 10 samples. There were 4 groups total based on treatment given and sex.
- 3 biological replicates of IgG Female
- 2 biological replicates of IgG Male
- 3 biological replicates of Aducanumab Female
- 2 biological replicates of Aducanumab Male
## 2. Sample preparation
10 mouse **?hemibrains?** were harvested. **?Single cell suspension protocol?**. The Chromium Next GEM Single Cell 3' (dual index) kit was used to prepare libararies with the Chromium Controller. Libraries were sent for sequencing at the Mayo Clinic Genome Analysis Core. **getting seq info from core**.
## 3. Read processing
- Cellranger 6.1.1 was used to preprocess reads with mm10 reference.
- The **scripts/01_cellranger** folder contains all scripts used for preprocessing reads.
## 4. R Analysis
- Only **? x samples ?** were used for the R analysis.
- The **scripts/02_R_analysis** folder contains all R scripts used to filter, normalize, and perform differential expression of the counts data.
