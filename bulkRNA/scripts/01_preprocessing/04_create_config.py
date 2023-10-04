#!/usr/bin/python3

# create a new output file
outfile = open('../../refs/config.json', 'w')

# get all file names
allSamples = list()
read = ["R1", "R2"]
numSamples = 0

with open('../../refs/sample_file_list.txt', 'r') as infile:
    for line in infile:
        numSamples += 1
        sample = line.strip()
        allSamples.append(sample.replace("_L001_R1_001.fastq.gz", ""))

# create header and write to outfile
header = '''{{
    "DIRECTORIES",
    "rawReads" : "/research/labs/neurology/fryer/projects/aducanumab/mouse/bulkRNA/",
    "rawQC" : "rawQC/",
    "trimmedReads" : "trimmedReads/",
    "trimmedQC" : "trimmedQC/",
    "starAligned" : "starAligned/",
    "featureCounts" : "featureCounts/",
    "genomeDir" : "refs/starGenomeDir/",

    "FILES",
    "Mmusculus.gtf" : "/research/labs/neurology/fryer/projects/references/mouse/refdata-gex-mm10-2020-A/genes/genes.gtf",
    "Mmusculus.fa" : "/research/labs/neurology/fryer/projects/references/mouse/refdata-gex-mm10-2020-A/fasta/genome.fa",

    "SAMPLE INFORMATION",
    "allSamples": {0},
    "read": {1},

    "CLUSTER INFORMATION",
    "threads" : "20",
'''
outfile.write(header.format(allSamples, read))


# config formatting
counter = 0
with open('../../refs/sample_file_list.txt', 'r') as infile:
    for line in infile:
        counter += 1

        # store filename
        sample = line.strip()
        lane1read1 = sample.replace("L001_R1_001.fastq.gz", "L001_R1")
        lane1read2 = sample.replace("L001_R1_001.fastq.gz", "L001_R2")
        lane2read1 = sample.replace("L001_R1_001.fastq.gz", "L002_R1")
        lane2read2 = sample.replace("L001_R1_001.fastq.gz", "L002_R2")
        lane3read1 = sample.replace("L001_R1_001.fastq.gz", "L003_R1")
        lane3read2 = sample.replace("L001_R1_001.fastq.gz", "L003_R2")
        lane4read1 = sample.replace("L001_R1_001.fastq.gz", "L004_R1")
        lane4read2 = sample.replace("L001_R1_001.fastq.gz", "L004_R2")
        baseName = sample.replace("_L001_R1_001.fastq.gz", "")

        # break down fastq file info
        # @A00127:312:HVNLJDSXY:2:1101:2211:1000
        # @<instrument>:<run number>:<flowcell ID>:<lane>:<tile>:<x-pos>:<y-pos>

        out = '''
    "{0}":{{
        "lane1read1": "{1}",
        "lane1read2": "{2}",
        "lane2read1": "{3}",
        "lane2read2": "{4}",
        "lane3read1": "{5}",
        "lane3read2": "{6}",
        "lane4read1": "{7}",
        "lane4read2": "{8}"
        '''
        outfile.write(out.format(baseName, lane1read1, lane1read2, lane2read1, lane2read2, lane3read1, lane3read2, lane4read1, lane4read2))
        if (counter == numSamples):
            outfile.write("}\n}")
        else:
            outfile.write("},\n")
outfile.close()

