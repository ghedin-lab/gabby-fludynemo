#!/bin/bash 
#PBS -N lmat-flst
#PBS -l nodes=1:ppn=8,walltime=05:00:00,mem=10GB
#PBS -M gmg302@nyu.edu
#PBS -j oe
#PBS -m ea

file=$1

cd /scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/lmat-directories

find -name $file.lo.rl_output[0-9]\*.out > $file.output.flst

# this one won't work because
#ls -1 $file.non-rRNA.deconseq_clean.mask.fasta.kML+Human.v4-14.20.g10.db.lo.rl_output[0-9]\*.out > $file.ls.rl_output.flst 

exit 0;





