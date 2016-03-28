#!/bin/bash
#PBS -N COG_blastx-test
#PBS -l nodes=1:ppn=20,walltime=24:00:00,mem=62GB
#PBS -M gmg302@nyu.edu
#PBS -m ea
#PBS -e localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.e${PBS_JOBID}
#PBS -o localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.o${PBS_JOBID}

###NR-BLAST###

path=/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/CONTIGS
dir=/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/ANNOTATION
#db=/scratch/at120/db/blast/nr/nr
db=/scratch/cgsb/ncbi/blast/db/Cog

cd $path

module load blast+/2.2.31

#per sample
blastx -query $path/$file.mapped.fasta -out $dir/$file-COGblast.xml -outfmt 5 -evalue 0.00001 -max_target_seqs 20 -culling_limit 2 -db $db -show_gis

#all samples
#blastx -query $path/topgenera+assorted_contigs.fasta -out $dir/contigs-COG-annotation.xml -outfmt 5 -evalue 0.00001 -max_target_seqs 20 -culling_limit 2 -db $db 

exit 0; 







