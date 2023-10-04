#!/bin/sh

# activate conda environment
source $HOME/.bash_profile
conda activate aducanumab

# run multiqc on rawQC
cd ../../rawQC
multiqc *.zip --interactive --filename raw_reads_multiqc

# run multiqc on trimmedQC
cd ../trimmedQC
multiqc *.zip --interactive --filename trimmed_reads_multiqc
