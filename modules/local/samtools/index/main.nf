/*
 * Generate BAM index file
 */
process SAMTOOLS_INDEX {

    container 'community.wave.seqera.io/library/samtools:1.20--b5dfbd93de237464'
    conda "bioconda::samtools=1.20"

    publishDir "${params.outdir}", mode: 'symlink'

    input:
        path input_bam

    output:
        tuple path(input_bam), path("${input_bam}.bai"), emit: bam_bai

    script:
    """
    samtools index '$input_bam'
    """
}