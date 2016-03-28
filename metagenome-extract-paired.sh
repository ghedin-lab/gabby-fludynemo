#!/bin/bash
#PBS -S /bin/bash
#PBS -N metagenome
#PBS -l nodes=1:ppn=8,walltime=24:00:00,mem=20GB
#PBS -q s48
#PBS -M gmg302@nyu.edu
#PBS -m ea
#PBS -e localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.e${PBS_JOBID}
#PBS -o localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.o${PBS_JOBID}


module load biopython

#file=$1

dir="/scratch/at120/shared/gabby-alan/metagenome"
mg="/scratch/kmg549/flu-metagenomics"
scripts="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/scripts/gabby-fludynemo"

cd $mg

#To run: python <script.python> <input.fasta> <input r1.fastq> <input r2.fastq> <output.r1.fastq> <output.r2.fastq>
python $scripts/extract-paired-reads-from-fasta.py $dir/$file.interleaved.deconseq_clean.mask.fasta $mg/$file.r1.fastq $mg/$file.r2.fastq $dir/$file.trim.r1.fastq $dir/$file.trim.r2.fastq

exit 0;


