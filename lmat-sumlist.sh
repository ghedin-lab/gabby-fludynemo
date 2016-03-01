#!/bin/bash 
#PBS -N lmat-flst
#PBS -l nodes=1:ppn=8,walltime=05:00:00,mem=10GB
#PBS -M gmg302@nyu.edu
#PBS -j oe
#PBS -m ea

file=$1

cd /scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/lmat-directories
ls $file.non-rRNA.deconseq_clean.mask.fasta.kML+Human.v4-14.20.g10.db.lo.rl_output.0.30.fastsummary* > $file.rl_summary.flst


exit 0;





