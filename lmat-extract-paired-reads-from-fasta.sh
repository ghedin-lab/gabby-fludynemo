module load biopython

file=$1

lmat="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/lmat-directories"
scripts="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/scripts"
fastq="/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/filtered-data"

cd $lmat

#To run: python <script.python> <input.fasta> <input r1.fastq> <input r2.fastq> <output.r1.fastq> <output.r2.fastq>
python $scripts/extract-paired-reads-from-blast-tsv.py $lmat/$file.$file.micro-id.fasta $fastq/$file.non-rRNA.deconseq_clean.r1.fastq $fastq/$file.non-rRNA.deconseq_clean.r2.fastq $lmat/$file.micro.r1.fastq $lmat/$file.micro.r2.fastq


