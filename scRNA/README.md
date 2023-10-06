# Single Cell RNA-Seq Analysis
## 1. Experiment overview
Hemiforebrain was collected from 10 mice. There were 4 groups total based on treatment given and sex.
- 3 biological replicates of 4 doses IgG Female 
- 2 biological replicates of 4 doses IgG Male
- 3 biological replicates of 4 doses Aducanumab Female
- 2 biological replicates of 4 doses Aducanumab Male
## 2. Sample preparation
Hemiforebrains were dissociated in Accutase. Debris was removed with Miltenyi debris removal kit. Red blood cells were removed with Miltenyi RBC removal kit. The Chromium Next GEM Single Cell 3' (dual index) kit was used to prepare libararies with the Chromium Controller. Libraries were sent for sequencing at the Mayo Clinic Genome Analysis Core. **getting seq info from core**.
## 3. Read processing
- Cellranger 6.1.1 was used to preprocess reads with mm10 reference.
- The **scripts/01_cellranger** folder contains all scripts used for preprocessing reads.
## 4. R Analysis
- Only **? x samples ?** were used for the R analysis.
- Only 4 samples were used in the R analysis. All male samples were kept. There were several GEM chip failures with the female samples.
  - 2 biological replicates of 4 doses IgG Male
  - 2 biological replicates of 4 doses Aducanumab Male 
- The **scripts/02_R_analysis** folder contains all R scripts used to filter, normalize, and perform differential expression of the counts data.
