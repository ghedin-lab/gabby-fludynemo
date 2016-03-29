#!/bin/bash
#PBS -m ae
#PBS -M gmg302@nyu.edu
#PBS -N humann2
#PBS -l walltime=72:00:00,nodes=1:ppn=12,mem=64gb
#PBS -joe

module load humann2/0.5.0
module load bowtie2/intel/2.2.3
module load diamond/intel/0.7.9.58
module load metaphlan/2.0.0
module load samtools/intel/1.3

contigs="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/CONTIGS"
out="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/ANNOTATION"
reads="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/filtered-data"

#bunzip2 $file.non-rRNA.deconseq_clean.mask.fasta.bz2
#humann2 --input $reads/$file.non-rRNA.deconseq_clean.mask.fasta --output $out/$file.reads-humann2 --input-format fasta --threads 12

#using fasta file from reads mapped to contigs (converted bam to fasta)
humann2 --input $contigs/$file.mapped.fasta --output $out/$file.humann2 --threads 12


exit 0;

