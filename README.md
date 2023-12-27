# aducanumab
## Overview
This repository contains scripts for analyzing the single cell and bulk RNA sequencing data from *Aducanumab immunotherapy induces sustained microglial transcriptional and functional alterations* (Cadiz et al., 2023). Navigate to the **bulkRNA** or **scRNA** directory for more information on each project.

## Abstract
Aducanumab, an anti-amyloid beta (Aβ) antibody therapy for Alzheimer’s disease (AD), is efficient at reducing Aβ, though its plaque clearance mechanisms, long-term effects, and effects of discontinuation are not fully understood. Using histology, flow cytometry, RT-qPCR, and single-cell RNA sequencing, we assessed the effect of aducanumab treatment and withdrawal on Aβ plaques, neuritic dystrophy, and microglia in the APP/PS1 amyloid mouse model. We found that acute treatment preferentially clears diffuse over fibrillar plaques while reducing neuritic dystrophy. Reductions in neuritic dystrophy were more pronounced than reductions in amyloid, suggesting a neuroprotective benefit not fully dependent on plaque reduction. This was accompanied by increased microglial activation, recruitment to plaques, and adoption of a transcriptome enriched for processes involved in immune response, antigen processing, and inflammation, indicating a role for microglia in aducanumab-mediated Aβ clearance. Strikingly, fifteen weeks after withdrawal, reductions in amyloid and neuritic dystrophy were not only maintained but were even more pronounced than immediately after treatment. Thirty weeks after withdrawal, Aβ levels in aducanumab-treated mice were comparable to controls. Microglial activation was reduced at both timepoints, despite the return of plaques after thirty weeks, suggesting microglial re-activation is impaired in the aftermath of treatment. These results suggest that despite the initial benefit received from plaque clearance and reduced neuritic dystrophy, after a sufficient duration of time, plaques begin to reaccumulate, and microglia may be unable to re-activate as strongly to restrain this accumulation, making further study into the effect of aducanumab withdrawal crucial for assessing its long-term safety profile

## Raw Data
The raw data is available to download from the Sequence Read Archive (SRA) under PRJNA1026618.
1. Obtain the run accessions of the samples you want to download. We have already created run accession lists (SraAccList.txt), metadata, and biosample attributes files available in the **scRNA/refs** folder and **bulkRNA/refs** folder.
2. Install SRA Toolkit from https://github.com/ncbi/sra-tools/wiki/01.-Downloading-SRA-Toolkit
3. After SRA Toolkit is installed, run the commands below to download the raw FASTQ files.
   ```
   prefetch --option-file SraAccList.txt
   ```
## Shiny Apps
- https://fryerlab.shinyapps.io/aducanumab_mice_bulkRNAseq/


## Contact information

| Contact | Email | Scope |
| --- | --- | --- |
| Mika Cadiz | cadiz.mika@mayo.edu | scRNAseq analysis, manuscript |
| Kennedi Todd | todd.kennedi@mayo.edu | bulkRNAseq analysis |

## Citation
