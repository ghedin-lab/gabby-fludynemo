#!/bin/bash
#PBS -S /bin/bash
#PBS -N micrococcus
#PBS -l nodes=1:ppn=8,walltime=10:00:00,mem=20GB
#PBS -M gmg302@nyu.edu
#PBS -m ea
#PBS -e localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.e${PBS_JOBID}
#PBS -o localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.o${PBS_JOBID}

file=$1

path="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/lmat-directories"
cd $path

module load kronatools/2.5
module load lmat
module load seqtk

LMAT_DIR=/scratch/kmg549/flu-metagenomics/example/runtime_inputs
export LMAT_DIR=/scratch/kmg549/flu-metagenomics/example/runtime_inputs

#Replace Micrococcus with the taxid list of your rank of interest
/share/apps/lmat/1.2.6/intel/bin/pull_reads_mc.sh --idfile=$file.Micrococcus-id.txt --file_lst=$file.output.flst

exit 0;















