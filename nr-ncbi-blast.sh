#!/bin/bash
#PBS -S /bin/bash
#PBS -N blast-to-nr
#PBS -l nodes=1:ppn=20,walltime=24:00:00,mem=20GB
#PBS -M gmg302@nyu.edu
#PBS -m ea
#PBS -e localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.e${PBS_JOBID}
#PBS -o localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.o${PBS_JOBID}

###NR-BLAST###

path=/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/filtered-data
dir=/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/ANNOTATION
#db=/scratch/at120/db/blast/nr/nr
db=/scratch/cgsb/ncbi/blast/db/nr

cd $path

bunzip2 $file.non-rRNA.deconseq_clean.mask.fasta.bz2
module load blast+/2.2.31

blastx -query $path/$file.non-rRNA.deconseq_clean.mask.fasta -out $dir/$file.NCBI-nr.xml -outfmt 5 -evalue 0.00001 -max_target_seqs 20 -culling_limit 2 -db $db

bzip2 $file.non-rRNA.deconseq_clean.mask.fasta

exit 0; 





