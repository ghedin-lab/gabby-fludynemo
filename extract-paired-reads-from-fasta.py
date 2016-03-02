#!/usr/bin/python

from Bio import SeqIO
import sys
import gzip

seqs = dict()

with open(sys.argv[1],"rb") as f:
	for record in SeqIO.parse(f,'fasta'):
		seqs[record.id] = 0

with open(sys.argv[2],"rb") as r1:
       with open(sys.argv[4], "w") as r1out:
		for record in SeqIO.parse(r1,'fastq'):
			 if record.id in seqs:
			      #r1out.write("@"+record.id+" "+record.description+"\n"+record.seq+"\n+\n"+record.quality)
			      r1out.write(record.format("fastq"))

with open(sys.argv[3],"rb") as r2:
         with open(sys.argv[5], "w") as r2out:
	         for record in SeqIO.parse(r2,'fastq'):
			 if record.id in seqs:
                              r2out.write(record.format("fastq"))
  	 		      #r2out.write("@"+record.id+" "+record.description+"\n"+record.seq+"\n+\n"+record.quality)

