# aducanumab
## Overview
This repository contains scripts for analyzing the single cell and bulk RNA sequencing data from *Aducanumab immunotherapy induces sustained microglial transcriptional and functional alterations* (Cadiz et al., 2023). Navigate to the **bulkRNA** or **scRNA** directory for more information on each project.

## Abstract
Aducanumab, an anti-amyloid immunotherapy for Alzheimer’s disease, efficiently reduces Aβ, though its plaque clearance mechanisms, long-term effects, and effects of discontinuation are not fully understood. We assessed the effect of aducanumab treatment and withdrawal on Aβ, neuritic dystrophy, astrocytes, and microglia in the APP/PS1 amyloid mouse model. We found that reductions in amyloid and neuritic dystrophy during acute treatment were accompanied by microglial and astrocytic activation, and microglial recruitment to plaques and adoption of an aducanumab-specific pro-phagocytic and pro-degradation transcriptomic signature, indicating a role for microglia in aducanumab-mediated Aβ clearance. Reductions in Aβ and dystrophy were sustained 15 but not 30 wk after discontinuation, and reaccumulation of plaques coincided with loss of the microglial aducanumab signature and failure of microglia to reactivate. This suggests that despite the initial benefit from treatment, microglia are unable to respond later to restrain plaque reaccumulation, making further studies on the effect of amyloid-directed immunotherapy withdrawal crucial for assessing long-term safety and efficacy.

## Raw Data
The raw data is available to download from the Sequence Read Archive (SRA) under [PRJNA1026618](https://www.ncbi.nlm.nih.gov/bioproject/?term=PRJNA1026618).
1. Obtain the run accessions of the samples you want to download. **scRNA/refs/scRNA_SRA_metadata.tsv** and **bulkRNA/refs/bulkRNA_SRA_metadata.tsv** contain SRA run accessions, metadata, and biosample attributes.
2. Install SRA Toolkit from https://github.com/ncbi/sra-tools/wiki/01.-Downloading-SRA-Toolkit
3. After SRA Toolkit is installed, run pre-fetch and fastq-dump to download the FASTQ files. An example is shown below.
   ```
   prefetch SRR123456
   fastq-dump SRR123456.sra
   ```
## Shiny Apps
- https://fryerlab.shinyapps.io/aducanumab_mice_bulkRNAseq/


## Contact information

| Contact | Email | Scope |
| --- | --- | --- |
| Mika Cadiz | cadiz.mika@mayo.edu | scRNAseq analysis, manuscript |
| Kennedi Todd | todd.kennedi@mayo.edu | bulkRNAseq analysis |

## Citation
Mika P. Cadiz, Katelin A. Gibson, Kennedi T. Todd, David G. Nascari, Nashali Massa, Meredith T. Lilley, Kimberly C. Olney, Md Mamun Al-Amin, Hong Jiang, David M. Holtzman, John D. Fryer; Aducanumab anti-amyloid immunotherapy induces sustained microglial and immune alterations. J Exp Med 5 February 2024; 221 (2): e20231363. doi: https://doi.org/10.1084/jem.20231363
