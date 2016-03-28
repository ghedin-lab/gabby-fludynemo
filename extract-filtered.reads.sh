module load biopython

#file=$1

fil="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/filtered-data"
scripts="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/scripts/human-16s-phix-filter"

cd $fil

python $scripts/extract-paired-reads-from-one-file.py $fil/$file.non-rRNA.deconseq_clean.fastq $fil/$file.non-rRNA.deconseq_clean

exit 0;




