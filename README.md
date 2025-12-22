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

# Input:
Paired-end FASTQ file

Reference genome FASTA

# Output:
sam file

sorted and indexed BAM files

Variant - VCF files

Annotated VCF files

Full results are not included due to their large file sizes. Only vcf files reperesenting a small subset of the results are uploaded for demonstration purposes.
