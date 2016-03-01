#!/bin/bash
#PBS -V
#PBS -S /bin/bash
#PBS -N lmat-list_tax-ids
#PBS -l nodes=1:ppn=8,walltime=24:00:00,mem=92GB
#PBS -q s48
#PBS -M gmg302@nyu.edu
#PBS -m ea
#PBS -e localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.e${PBS_JOBID}
#PBS -o localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.o${PBS_JOBID}

file=$1

#to submit job: sh script.sh file

#0.0 Before running this script you must generate a summary list file of all the LMAT summary outputs



#set to path where the lmat output files are
#Note: after running the initial LMAT script, I combined all the $file.lmat directories
path="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/lmat-directories"
cd $path

module load kronatools/2.5
module load lmat
module load seqtk

#LMAT_DIR=runtime inputs from ftp://gdo-bioinformatics.ucllnl.org/pub/lmat/ and place them here
LMAT_DIR=/scratch/kmg549/flu-metagenomics/example/runtime_inputs
export LMAT_DIR=/scratch/kmg549/flu-metagenomics/example/runtime_inputs

#the build_taxid_lst.sh script will pull all taxid's for a given rank, here for example the genus Haemophilus
/share/apps/lmat/1.2.6/intel/bin/build_taxid_lst.sh --file_lst=$file.rl_summary.flst --sstr=genus,Haemophilus --idfile=haemo

#combine all taxids from fastsummary file outputs
cat $file.non-rRNA.deconseq_clean.mask.fasta.kML+Human.v4-14.20.g10.db.lo.rl_output.0.30.fastsummary.genus.idtxt $file.non-rRNA.deconseq_clean.mask.fasta.kML+Human.v4-14.20.g10.db.lo.rl_output.0.30.fastsummary.plasmid.idtxt $file.non-rRNA.deconseq_clean.mask.fasta.kML+Human.v4-14.20.g10.db.lo.rl_output.0.30.fastsummary.species.idtxt $file.non-rRNA.deconseq_clean.mask.fasta.kML+Human.v4-14.20.g10.db.lo.rl_output.0.30.fastsummary.idtxt > $file.haemo-id.txt

#get rid of the separate lists of taxids
rm *idtxt

exit 0;


























