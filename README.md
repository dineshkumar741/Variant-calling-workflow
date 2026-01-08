# Task-3

# A simplified Nextflow pipeline for variant calling
This repository contains a Nextflow-based bioinformatics workflow for processing raw paired-end FASTQ files through alignment, variant calling, and annotation.
The pipeline is containerized using Docker to ensure reproducibility, portability, and ease of use.

The workflow is suitable for generating annotated variant calls from short-read sequencing data and can be integrated into larger data portals or downstream analysis systems.



# Workflow

1. Input:
   
      Raw paired-end FASTQ files.
   
2. Quality Control:
   
      Initial quality assessment of raw reads
   
3. Read Trimming:
   
      Removal of low-quality bases and adapters

   step 1,2,3 were not performed as they were not required for this project. 
   
4. Alignment:
   
      FASTQ to SAM using BWA-MEM
   
5. Post-alignment Processing:
    
      SAM to BAM conversion
   
      Sorting and indexing using samtools
   
6. Variant Calling:
    
      SNP and small INDEL detection using FreeBayes
    
7. Variant Annotation:
    
      Functional annotation using SnpEff

# Tools used
Nextflow DSL2

Docker

BWA-MEM

SAMTOOLS

FREEBAYES

snpEff

Before running the workflow, it is very important to ensure that Nextflow and Docker are correctly installed and configured on the system. For the first time users, the initial set up can be challenging sometimes, however, once configured, running workflows become straightforward and reproducible. The files such as snpEff.jar, sample datasets, index files, and configuration files must either placed in the same directory or have their paths specified within the workflow or configuration files. After completing the set up, the workflow can be executed by running main.nf from the terminal. During the first execution, it is quite normal to get errors. Most of them are due to incomplete Nextflow or Docker configuration, missing dependencies or your machine related limitations. 

This workflow begins with the read alignment step and concludes with tvariant annotation, generating annotated VCF file as the final output. Preliminary steps such as read quality control, trimming, and reference genome indexing are intentionally excluded because the primary objective of this project is to work with synthetic datasets, where quality control is not really required. Reference genome indexing should be completed seprately prior to running the workflow. Have a look at the output snip of terminal window.


# Input:
Paired-end FASTQ file

Reference genome FASTA

# Output:
sam file

sorted and indexed BAM files

Variant - VCF files

Annotated VCF files
