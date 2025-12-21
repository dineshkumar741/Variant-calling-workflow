# A-simplified Nextflow pipeline for variant calling
This repository contains a Nextflow-based bioinformatics workflow for processing raw paired-end FASTQ files through alignment, variant calling, and annotation.
The pipeline is containerized using Docker to ensure reproducibility, portability, and ease of use.

The workflow is suitable for generating annotated variant calls from short-read sequencing data and can be integrated into larger data portals or downstream analysis systems.

# Workflow summary

1. Input:
   
      Raw paired-end FASTQ files.
   
3. Quality Control:
   
      Initial quality assessment of raw reads
   
5. Read Trimming:
   
      Removal of low-quality bases and adapters
   
7. Alignment:
   
      FASTQ → SAM using BWA-MEM
   
9. Post-alignment Processing:
    
      SAM → BAM conversion
   
      Sorting and indexing using samtools
   
11. Variant Calling:
    
      SNP and small INDEL detection using FreeBayes
    
13. Variant Annotation:
    
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
