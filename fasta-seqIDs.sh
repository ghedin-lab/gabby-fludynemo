#These commands pull sequence IDs from a fasta file to be used for subsetting other files
#I used these commands to pull sequence IDs from genus fasta files generated using LMAT
#each sample had several fasta files for different genera
#eg. file.staph.fasta file.strep.fasta... etc

#first I concatenated all fasta files for each genus
cat $(ls *fasta | grep 'corny') > corny.fasta.txt

#then I concatenated all of the *fasta.txt files
*cat *fasta.txt > all.genera.fasta

#next I grabbed all of the sequence IDs using grep
grep 'HISEQ' all.genera.fasta > all.genera.seqids

#finally I removed the rest of the line after the sequence ID using awk
awk '{print $1}' all.genera.seqids > seqIDS.txt 