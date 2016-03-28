#!/bin/bash
#PBS -S /bin/bash
#PBS -N AR-blast
#PBS -l nodes=1:ppn=12,walltime=24:00:00,mem=24GB
#PBS -q s48
#PBS -M gmg302@nyu.edu
#PBS -m ea
#PBS -e localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.e${PBS_JOBID}
#PBS -o localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.o${PBS_JOBID}

file=$1

dir="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/antbiotic-resistance"
#Metatranscriptome Path:
path="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/filtered-data"
#Metagenome Pathe:
mg="/scratch/at120/shared/gabby-alan/metagenome/filtered-fasta"

cd $dir

#ARG-ANNOT: database abbreviations
# AGly, aminoglycosides; Bla, beta-lactamases; Fos, fosfomycin; 
# Flq, fluoroquinolones; Gly, glycopeptides; MLS, macrolide-lincosamide-streptogramin; 
# Phe, phenicols; Rif, rifampin; Sul, sulfonamides; Tet, tetracyclines; and Tmt, trimethoprim. 

module load blast+

#1. download the antibiotic resistance database (nucleotide fasta) from the ARG-ANNOT website
#ARGANNOT NT_V2_15Dec_2015:
#wget http://www.mediterranee-infection.com/arkotheque/client/ihumed/_depot_arko/articles/691/argannot-nt_doc.fasta

#2. create custom BLAST database for the antibiotic resistance genes using makeblastdb blast+ package
#makeblastdb -in file -out name -dbtype prot/nucl -hash_index for a database of DNA or RNA
#makeblastdb -in argannot-nt_doc.fasta -out antibiotic-resistance -dbtype nucl -hash_index -parse_seqids

#3. blastn to custom database
#Metatranscriptome:
#blastn -task blastn -query $path/$file.non-rRNA.deconseq_clean.mask.fasta -out $dir/$file.ARgene.blast.tsv -outfmt 6 -evalue 0.00001 -max_target_seqs 1 -culling_limit 2 -num_threads 12 -db $dir/antibiotic-resistance
   
#Metagenome:
blastn -task blastn -query $mg/$file.interleaved.deconseq_clean.mask.fasta  -out $dir/$file.ARgene.blast.tsv -outfmt 6 -evalue 0.00001 -max_target_seqs 1 -culling_limit 2 -num_threads 12 -db $dir/antibiotic-resistance


exit 0;




























