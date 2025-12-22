nextflow.enable.dsl=2

params.index_dir = "${projectDir}/index_folder"
params.fasta     = "GRCh38.primary_assembly.genome.fa"
params.reads     = "${projectDir}/*_s{1,2}.fastq.gz"
params.outdir    = "results"

params.snpeff_path = "/home/ricky/snpEff"

process read_alignment {
    publishDir "${params.outdir}/align", mode: 'copy'

    input:
    path index_folder 
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
    bwa mem ${index_folder}/${params.fasta} ${reads[0]} ${reads[1]} > ${sample_id}.sam | \\
    samtools view -Sb - > ${sample_id}.bam
    """
}

process sort_index {
    publishDir "${params.outdir}/sorted", mode: 'copy'

    input:
    tuple val(sample_id), path(bam)

    output:
    tuple val(sample_id), path("${sample_id}_sorted.bam"), path("${sample_id}_sorted.bam.bai")

    script:
    """
    samtools sort ${bam} -o ${sample_id}_sorted.bam
    samtools index ${sample_id}_sorted.bam
    """
}

process variant_fre {
	publishDir "${params.outdir}/vcf", mode: 'copy'
	
	input:
	path index_folder
	tuple val(sample_id), path(bam), path(bai)
	
	output:
	tuple val(sample_id), path("${sample_id}.vcf")
	
	script:
	"""
	freebayes -f ${index_folder}/${params.fasta} ${bam} > ${sample_id}.vcf
	"""
}

process annotate_reads {
    publishDir "${params.outdir}/annotated", mode: 'copy'

    input:
    tuple val(sample_id), path(vcf)

    output:
    path "${sample_id}_annotated.vcf"

    script:
    """
    	snpEff -Xmx4g -dataDir /mnt/snpeff_data GRCh38.99 ${vcf} > ${sample_id}_annotated.vcf
    """
    
}

workflow {
    index_path = file(params.index_dir)
    if( !index_path.exists() ) exit 1, "Folder not found: ${params.index_dir}"
    reads_ch = Channel.fromFilePairs(params.reads)
    bam_ch    = read_alignment(index_path, reads_ch)
    sorting_ch = sort_index(bam_ch)
    vcf_ch    = variant_fre(index_path, sorting_ch)
    annotate_reads(vcf_ch)
}

