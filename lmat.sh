#!/bin/bash
#PBS -S /bin/bash
#PBS -N lmat_run
#PBS -l nodes=1:ppn=8,walltime=24:00:00
#PBS -l mem=92GB
#PBS -q s48
#PBS -M gmg302@nyu.edu
#PBS -m ea
#PBS -e localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.e${PBS_JOBID}
#PBS -o localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.o${PBS_JOBID}

#This script runs Livermore Metagenomics Analysis Toolkit (LMAT) to assign taxonomic labels to each read and report a summary of organim contents

#input files are interleaved, fasta files that have been masked for poor quality using seqtk
#these files were previously filtered using the human-16s-phix.sh filter (SortMeRNA, DeconSeq)


#1. Set path to the interleaved fasta files generated using seqtk
path="<path-to-dir>"
cd $path

#create output directory
mkdir $file.lmat

module load kronatools/2.5
module load lmat
module load seqtk

#LMAT_DIR contains runtime inputs from ftp://gdo-bioinformatics.ucllnl.org/pub/lmat/
LMAT_DIR=<path-to-runtime-inputs>
OUT_FILE=<path-to-dir>/$file.lmat
QUERY_FILE=<path-to-dir>/$file.interleaved.deconseq_clean.mask.fasta
DB=<path-to-db>/kML+Human.v4-14.20.g10.db

export LMAT_DIR=<path-to-runtime-inputs>

/share/apps/lmat/1.2.6/intel/bin/run_rl.sh --db_file=$DB --query_file=$QUERY_FILE --odir=$OUT_FILE --threads=8


exit 0;

















