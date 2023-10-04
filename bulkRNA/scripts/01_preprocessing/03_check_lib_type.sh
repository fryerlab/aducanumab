#!/bin/sh
#SBATCH --job-name check_lib_type
#SBATCH --mem 10G
#SBATCH --output logs/%x.%j.stdout
#SBATCH --error logs/%x.%j.stderr
#SBATCH --partition cpu-med
#SBATCH --tasks 15
#SBATCH --time 02:00:00 ## HH:MM:SS

# salmon was installed in it's own environment to work properly
# activate environment
source $HOME/.bash_profile
conda activate salmon

# salmon version
salmon -v

# validate mappings
# note this same sample has other lanes but this should be sufficient to check
salmon quant --libType A \
             --index /research/labs/neurology/fryer/projects/references/mouse/salmonIndexGRCm39 \
             --mates1 /research/labs/neurology/fryer/projects/aducanumab/mouse/bulkRNA/442_Adu_S28_L004_R1_001.fastq.gz \
             --mates2 /research/labs/neurology/fryer/projects/aducanumab/mouse/bulkRNA/442_Adu_S28_L004_R2_001.fastq.gz \
             --output ../../refs/transcript_quant \
             --threads 15 \
             --validateMappings

# Key
# --libType A is for autodetect library type
# --index Salmon index
# --mates1
# --mates2

# Results
# Automatically detected most likely library type as ISR

# Job stats
# State: COMPLETED (exit code 0)
# Nodes: 1
# Cores per node: 16
# CPU Utilized: 00:30:13
# CPU Efficiency: 75.04% of 00:40:16 core-walltime
# Job Wall-clock time: 00:02:31
# Memory Utilized: 1.72 GB
# Memory Efficiency: 17.24% of 10.00 GB

