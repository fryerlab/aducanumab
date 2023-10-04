#!/bin/sh
#SBATCH --job-name fastqc
#SBATCH --mem 50G
#SBATCH --tasks 30
#SBATCH --mail-user todd.kennedi@mayo.edu
#SBATCH --mail-type END,FAIL
#SBATCH --output logs/%x.%N.%j.stdout
#SBATCH --error logs/%x.%j.stderr
#SBATCH --partition cpu-short
#SBATCH --time 4:00:00 ## HH:MM:SS

# activate conda environment
source $HOME/.bash_profile
conda activate aducanumab

# change directory to raw reads
#cd /research/labs/neurology/fryer/projects/aducanumab/mouse/bulkRNA

# run raw fastqc
#fastqc --threads 30 --outdir /research/labs/neurology/fryer/m214960/aducanumab/bulkRNA/rawQC *_R*_001.fastq.gz

# change directory to trimmed reads
cd /research/labs/neurology/fryer/m214960/aducanumab/bulkRNA/trimmedReads

# run trimmed fastqc
fastqc --threads 30 --outdir /research/labs/neurology/fryer/m214960/aducanumab/bulkRNA/trimmedQC *.fastq.gz

