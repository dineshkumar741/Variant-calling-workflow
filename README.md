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

# Nextflow
Before srunning the workflow, make sure to configure the nextflow and then docker, It can be challenging sometime especially if you are new to nextflow and docker. Once you have set up your system with both, it is very easy to run your workflows.
Further, snpEff.jar, datasets, index files, and .config files need to be in the same directory or specfify the path in the workflow. Then, run main.nf in the terminal. It is very likely that you will get errors at different steps when the running the workflow first time, just look at them carefully, most of them are due to incomplete configuration of nextflow or docker, and your machine configuration also matters when working on large datasets. This is a very simple workflow, but you are always welcome to text me if stuck at any point. 

The workflow starts with alignment step and completes at annotation step by creating annotate.vcf file. So that means initial steps such as quality checks including trimming and genome indexing is missing . As the aim of this project is to work on synthetic datasets, and hence, quaility check wasn't really required. The genome indexing can be done separately before running the workflow. 


# Input:
Paired-end FASTQ file

Reference genome FASTA

# Output:
sam file

sorted and indexed BAM files

Variant - VCF files

Annotated VCF files

Full results are not included due to their large file sizes. Only vcf files reperesenting a small subset of the results are uploaded for demonstration purposes.
