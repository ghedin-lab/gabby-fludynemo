#!/bin/bash
#PBS -m ae
#PBS -M gmg302@nyu.edu
#PBS -N humann2-noflu-ignorevir
#PBS -l walltime=24:00:00,nodes=1:ppn=12,mem=64gb
#PBS -joe

#BioBakery Humann2
#1. taxonomic assignments (metaphlan)
#2. pathways (binary (presence/absesnse) and coverage stats)
#3. gene families (coverage/abundance stats)


#Note: humann2 automatically loads bowtie2, diamond, and metaphlan (incorrect version in script may cause error)
#samtools necessary if input is a bam file

module load humann2/0.5.0
module load bowtie2/intel/2.2.3
module load diamond/intel/0.7.9.58
module load metaphlan/2.0.0
module load samtools/intel/1.3

contigs="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/CONTIGS/CLEAN_NOFLU/HUMANN2-NOVIR"
out="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/ANNOTATION"


#Input is the mapped reads to contigs (bowtie2, converted sam > bam > fasta using samtools - NO FLU)
humann2 --input $contigs/$file.mapped.noflu.fasta_clean.fa --metaphlan-options="--ignore_viruses" --output $out/$file.noflu.humann2-novir --threads 12

#use --bypass-prescreen option to skip the metaphlan step and use the complete chocophlan 


exit 0;

