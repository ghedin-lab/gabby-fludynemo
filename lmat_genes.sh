#!/bin/bash
#PBS -N lmat_genes
#PBS -l nodes=1:ppn=8,walltime=24:00:00,mem=92GB
#PBS -M gmg302@nyu.edu
#PBS -m ea
#PBS -e localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.e${PBS_JOBID}
#PBS -o localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.o${PBS_JOBID}

#LMAT GENE ANNOTATION 

#1. set path
lmat="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/lmat-directories"

cd $lmat

#2. create output directory
mkdir $file.genes

module load kronatools/2.5
module load lmat/intel/1.2.6
module load seqtk/intel/1.0

#3. set LMAT variables
#LMAT_DIR contains runtime inputs from ftp://gdo-bioinformatics.ucllnl.org/pub/lmat/
LMAT_DIR=/scratch/kmg549/flu-metagenomics/example/runtime_inputs
OUT_FILE=/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/lmat-directories/$file.genes
QUERY_FILE=/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/filtered-data/$file.interleaved.deconseq_clean.mask.fasta
DB=/scratch/work/public/gen-data/lmat/runtime_inputs/lmat.genes.7-14.db
ILST=/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/lmat-directories/$file.output.flst

export LMAT_DIR=/scratch/kmg549/flu-metagenomics/example/runtime_inputs

#4. Execute
/share/apps/lmat/1.2.6/intel/bin/run_gl.sh --db_file=$DB --ilst=$ILST --odir=$OUT_FILE --filesum=$OUT_FILE/$file.output.flst.lmat.genes.7-14.db.gl_output.0.1.20.genesummary --threads=$PBS_NP


exit 0;





















